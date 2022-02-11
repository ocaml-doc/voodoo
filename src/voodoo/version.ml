(* Version page  *)

(* Used to calculate the contents of the version page *)

let gen_with_dune (dune : Dune.t) =
  let libraries =
    if List.length dune.Dune.libraries = 0 then []
    else
      let x =
        List.map
          (fun l ->
            let a =
              match l.Dune.Library.ty with
              | Dune.Library.Wrapped w ->
                  if Util.is_hidden w.alias_module then
                    [
                      Printf.sprintf "Documentation: {!module-%s}"
                        w.main_module_name;
                    ]
                  else
                    [
                      Printf.sprintf "Documentation: {!modules:%s}"
                        (String.concat " "
                           (List.map
                              (fun s -> w.main_module_name ^ "." ^ s)
                              w.modules));
                    ]
              | Dune.Library.Unwrapped u ->
                  [
                    Printf.sprintf "Documentation: {!modules:%s}"
                      (String.concat " " u.modules);
                  ]
              | Dune.Library.Singleton s ->
                  [ Printf.sprintf "Documentation: {!module-%s}" s ]
            in
            let deps =
              if List.length l.dependencies > 0 then
                [ "Dependencies:"; String.concat ", " l.dependencies ]
              else []
            in
            [ "{2 " ^ l.name ^ "}" ] @ a @ ("" :: deps))
          dune.libraries
        |> List.flatten
      in
      [
        "{1 Libraries}";
        "This package provides the following libraries (via dune):";
      ]
      @ x
  in
  libraries

let gen_with_libraries (libraries : (string * string list) list) =
  let libraries =
    if List.length libraries = 0 then []
    else
      let x =
        List.map
          (fun (name, modules) ->
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
    dune:Dune.t option ->
    libraries:(string * string list) list ->
    error_log:Error_log.t ->
    failed:bool ->
    string =
 fun ~dune ~libraries ~error_log ~failed ->
  Format.eprintf "libraries: [%s]\n%!"
    (String.concat "," (List.map fst libraries));
  let result =
    if failed then gen_with_error error_log
    else
      match dune with
      | Some d -> gen_with_dune d
      | _ -> gen_with_libraries libraries
  in
  String.concat "\n" result

let gen_parent :
    Package.t ->
    blessed:bool ->
    modules:string list ->
    dune:Dune.t option ->
    libraries:(string * string list) list ->
    package_mlds:Fpath.t list ->
    error_log:Error_log.t ->
    failed:bool ->
    Mld.t =
 fun package ~blessed ~modules ~dune ~libraries ~package_mlds ~error_log ~failed ->
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
  let universe, package_name, package_version = package in
  let top_parents =
    if blessed then
      let packages =
        Mld.v cwd "p" None
          [ Odoc.CPage package_name ]
          (Printf.sprintf "{0 Packages}\n{!childpage:%s}\n" package_name)
      in
      packages
    else
      let universes =
        Mld.v cwd "u" None [ Odoc.CPage universe ]
          (Printf.sprintf "{0 Universes}\n{!childpage:%s}\n" universe)
      in
      let universe =
        Mld.v cwd universe (Some universes)
          [ Odoc.CPage package_name ]
          (Printf.sprintf "{0 %s}\n{!childpage:%s}\n" universe package_name)
      in
      universe
  in
  let package =
    Mld.v cwd package_name (Some top_parents)
      [ Odoc.CPage package_version ]
      (Printf.sprintf "{0 %s}\n{!childpage:%s}\n" package_name package_version)
  in

  let version =
    Mld.v cwd package_version (Some package) [ Odoc.CPage "doc" ]
      (Printf.sprintf "{0 %s}\n{!childpage:doc}\n" package_version)
  in

  let content =
    match mld_index with
    | [] -> gen ~dune ~libraries ~error_log ~failed
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
      (Printf.sprintf "{0 %s %s}\n%s\n" package_name package_version content)
  in
  Mld.compile doc;
  doc
