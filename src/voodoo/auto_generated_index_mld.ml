let gen_with_libraries (libraries : Library_names.Without_dune.library list) =
  let libraries =
    if List.length libraries = 0 then []
    else
      let x =
        List.map
          (fun { Library_names.Without_dune.name; modules; _ } ->
            let non_hidden =
              List.filter (fun x -> not (Util.is_hidden x)) modules
            in
            let a =
              [
                Printf.sprintf "Documentation: {!modules:%s}"
                  (String.concat " " non_hidden);
              ]
            in
            [ "{2 " ^ name ^ "}" ] @ a @ [ "" ])
          libraries
        |> List.flatten
      in
      [
        "{1 Libraries}";
        "This package provides the following libraries (via ocamlobjinfo):";
      ]
      @ x
  in
  libraries

let gen_with_error l =
  let escape line =
    let ls = Astring.String.cuts ~sep:"v}" line in
    String.concat "v }" ls
  in
  match l with
  | Some lines ->
      [
        "{1 Error log}";
        "The package failed to build. The error log from opam follows.";
        "{v";
      ]
      @ List.map escape lines @ [ "v}" ]
  | None ->
      [
        "{1 Failure}";
        "The package failed to build. There are no error logs to display";
      ]

let gen :
    libraries:Library_names.Without_dune.t ->
    error_log:Error_log.t ->
    failed:bool ->
    string =
 fun ~libraries ~error_log ~failed ->
  Format.eprintf "libraries: [%s]\n%!"
    (String.concat ","
       (List.map
          (fun x -> x.Library_names.Without_dune.name)
          libraries.libraries));
  let result =
    if failed then gen_with_error error_log
    else gen_with_libraries libraries.libraries
  in
  String.concat "\n" result

let gen :
    Package.t ->
    blessed:bool ->
    modules:string list ->
    libraries:Library_names.Without_dune.t ->
    package_mlds:Fpath.t list ->
    error_log:Error_log.t ->
    failed:bool ->
    Mld.t =
 fun package ~blessed ~modules ~libraries ~package_mlds ~error_log ~failed ->
  let cwd = Fpath.v "." in
  let mld_index, mld_children =
    List.partition (fun mld -> Fpath.basename mld = "index.mld") package_mlds
  in
  let m_children = List.map (fun m -> Odoc.CModule m) modules in
  let p_children =
    List.map
      (fun p ->
        Format.eprintf "page child: %a\n%!" Fpath.pp p;
        Odoc.CPage Fpath.(rem_ext p |> basename))
      mld_children
  in
  let children = m_children @ p_children in
  let children =
    match children with [] -> [ Odoc.CPage "dummy" ] | _ -> children
  in
  let top_parents =
    if blessed then
      let packages =
        Mld.v cwd "p" None
          [ Odoc.CPage package.name ]
          (Printf.sprintf "{0 Packages}\n{!childpage:%s}\n" package.name)
      in
      packages
    else
      let universes =
        Mld.v cwd "u" None
          [ Odoc.CPage package.universe ]
          (Printf.sprintf "{0 Universes}\n{!childpage:%s}\n" package.universe)
      in
      let universe =
        Mld.v cwd package.universe (Some universes)
          [ Odoc.CPage package.name ]
          (Printf.sprintf "{0 %s}\n{!childpage:%s}\n" package.universe
             package.name)
      in
      universe
  in
  let pkg =
    Mld.v cwd package.name (Some top_parents)
      [ Odoc.CPage package.version ]
      (Printf.sprintf "{0 %s}\n{!childpage:%s}\n" package.name package.version)
  in

  let version =
    Mld.v cwd package.version (Some pkg) [ Odoc.CPage "doc" ]
      (Printf.sprintf "{0 %s}\n{!childpage:doc}\n" package.version)
  in

  let content =
    match mld_index with
    | [] -> gen ~libraries ~error_log ~failed
    | x :: _ ->
        let ic = open_in (Fpath.to_string x) in
        let result = really_input_string ic (in_channel_length ic) in
        close_in ic;
        result
  in
  let () =
    match Bos.OS.File.delete Fpath.(v "doc.mld") with
    | Ok x -> x
    | Error (`Msg m) ->
        Format.eprintf "Failed to remove file: doc.mld - %s\n%!" m;
        ()
  in
  let doc =
    Mld.v cwd "doc" (Some version) children
      (Printf.sprintf "{0 %s %s}\n%s\n" package.name package.version content)
  in
  Mld.compile doc;
  doc
