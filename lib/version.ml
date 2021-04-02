(* Version page *)

(* Used to calculate the contents of the version page *)

let gen_with_opam (opam : OpamFile.OPAM.t) =
  let descr =
    match opam.descr with
    | Some d ->
        [
          Printf.sprintf "{b %s}" (OpamFile.Descr.synopsis d);
          "";
          OpamFile.Descr.body d;
        ]
    | None -> []
  in

  descr
  @ [
      "{4 Author}";
      String.concat ", " (OpamFile.OPAM.author opam);
      "";
      "{4 Homepage}";
    ]
  @ List.map (fun s -> Printf.sprintf "{:%s}" s) (OpamFile.OPAM.homepage opam)
  @ [ "{4 Issue tracker}" ]
  @ List.map
      (fun s -> Printf.sprintf "{:%s}" s)
      (OpamFile.OPAM.bug_reports opam)
  @ [ "{4 Maintainer}" ]
  @ OpamFile.OPAM.maintainer opam

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
                        (String.concat " " w.modules);
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
            [ "{2 " ^ l.name ^ "}" ] @ a @ "" :: deps)
          dune.libraries
        |> List.flatten
      in
      [ "{1 Libraries}"; "This package provides the following libraries:" ] @ x
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
      [ "{1 Libraries}"; "This package provides the following libraries:" ] @ x
  in
  libraries

let gen :
    dune:Dune.t option ->
    opam:OpamFile.OPAM.t option ->
    libraries:(string * string list) list ->
    string =
 fun ~dune ~opam ~libraries ->
  Format.eprintf "libraries: [%s]\n%!"
    (String.concat "," (List.map fst libraries));
  match (dune, opam) with
  | Some d, Some o -> String.concat "\n" (gen_with_opam o @ gen_with_dune d)
  | None, Some o ->
      Format.eprintf "opam only...!\n%!";
      String.concat "\n" (gen_with_opam o @ gen_with_libraries libraries)
  | _ -> String.concat "\n" (gen_with_libraries libraries)

let gen_parent :
    Package.t ->
    blessed:bool ->
    modules:string list ->
    docs_child:bool ->
    dune:Dune.t option ->
    opam:OpamFile.OPAM.t option ->
    libraries:(string * string list) list ->
    Mld.t =
 fun package ~blessed ~modules ~docs_child ~dune ~opam ~libraries ->
  let cwd = Fpath.v "." in
  let children = List.map (fun m -> Odoc.CModule m) modules in
  let children =
    if docs_child then Odoc.CPage "docs" :: children else children
  in
  let universe, package_name, package_version = package in
  let top_parents =
    if blessed then
      let packages =
        Mld.v cwd "packages" None
          [ Odoc.CPage package_name ]
          (Printf.sprintf "{0 Packages}\n{!childpage:%s}\n" package_name)
      in
      packages
    else
      let universes =
        Mld.v cwd "universes" None [ Odoc.CPage universe ]
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
  let content = gen ~dune ~opam ~libraries in
  let version =
    Mld.v cwd package_version (Some package) children
      (Printf.sprintf "{0 %s %s}\n%s\n" package_name package_version content)
  in
  Mld.compile version;
  version
