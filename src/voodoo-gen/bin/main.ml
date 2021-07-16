open Cmdliner

let docs = "ARGUMENTS"

let process_opam_file f =
  let ic = open_in (Fpath.to_string f) in
  let result = OpamFile.OPAM.read_from_channel ic in
  close_in ic;
  result

let files = Arg.(non_empty & pos_all file [] & info [] ~docv:"FILE")

let convert_directory ?(create = false) () :
    Odoc_odoc.Fs.Directory.t Arg.converter =
  let dir_parser, dir_printer = Arg.string in
  let odoc_dir_parser str =
    let () = if create then Odoc_odoc.Fs.Directory.(mkdir_p (of_string str)) in
    match dir_parser str with
    | `Ok res -> `Ok (Odoc_odoc.Fs.Directory.of_string res)
    | `Error e -> `Error e
  in
  let odoc_dir_printer fmt dir =
    dir_printer fmt (Odoc_odoc.Fs.Directory.to_string dir)
  in
  (odoc_dir_parser, odoc_dir_printer)

let output =
  let doc = "Output directory where the HTML tree is expected to be saved." in
  Arg.(
    required
    & opt (some (convert_directory ~create:true ())) None
    & info ~docs ~docv:"DIR" ~doc [ "o"; "output-dir" ])

let opt_map f = function Some x -> Some (f x) | None -> None

type files = {
  opam : Fpath.t option;
  otherdocs : Fpath.t list;
  odocls : Fpath.t list;
}

let empty = { opam = None; otherdocs = []; odocls = [] }

let get_ok = function
  | Result.Ok x -> x
  | Error (`Msg m) ->
      Format.eprintf "get_ok: Failure! msg=%s\n%!" m;
      failwith "get_ok: Not OK"

let generate_pkgver output name_filter version_filter =
  let linkedpath = Fpath.(v "linked") in
  match
    Bos.OS.Dir.fold_contents ~elements:`Dirs
      (fun p (pkgs, othervers) ->
        let optmatch opt v = match opt with Some x -> x = v | None -> true in
        match Fpath.segs p with
        | [ "linked"; "packages"; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name
               && optmatch version_filter pkg_version ->
            ((p, true, pkg_name, pkg_version) :: pkgs, othervers)
        | [ "linked"; "packages"; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name ->
            (pkgs, pkg_version :: othervers)
        | [ "linked"; "universes"; _; pkg_name; pkg_version ]
          when optmatch name_filter pkg_name
               && optmatch version_filter pkg_version ->
            ((p, false, pkg_name, pkg_version) :: pkgs, othervers)
        | _ -> (pkgs, othervers))
      ([], []) linkedpath
  with
  | Error (`Msg m) ->
      Format.eprintf "Failed to find any packages: %s\n%!" m;
      exit 1
  | Ok (pkgs, vs) ->
      Format.eprintf "%d other versons, %d packages\n%!" (List.length vs)
        (List.length pkgs);
      let handle_package (pkg_path, blessed, pkg_name, ver) =
        let failed =
          Bos.OS.File.exists Fpath.(pkg_path / "failed") |> function
          | Ok x -> x
          | _ -> false
        in
        match
          Bos.OS.Dir.fold_contents ~elements:`Files ~dotfiles:false
            (fun p files ->
              match Fpath.get_ext p with
              | ".odocl" -> { files with odocls = p :: files.odocls }
              | _ -> (
                  match Fpath.basename p with
                  | "opam" -> { files with opam = Some p }
                  | _ -> { files with otherdocs = p :: files.otherdocs }))
            empty pkg_path
        with
        | Error (`Msg m) ->
            Format.eprintf "Failed to handle package %s.%s: %s\n%!" pkg_name ver
              m;
            exit 1
        | Ok files ->
            let opam = opt_map process_opam_file files.opam in
            let namever = pkg_name ^ "." ^ ver in
            let parent = Fpath.(pkg_path / ".." / ("page-" ^ ver ^ ".odocl")) in
            let otherdocs = files.otherdocs in
            let files = parent :: files.odocls in
            Format.eprintf "Found %d files\n%!" (List.length files);
            ignore
            @@ List.map
                 (Odoc_thtml.render ~opam ~pkg_name ~namever ~parent ~otherdocs
                    ~vs ~output)
                 files;
            Odoc_thtml.render_other ~parent ~otherdocs ~output |> get_ok;
            let foutput = Fpath.v (Odoc_odoc.Fs.Directory.to_string output) in
            if blessed then
              Bos.OS.File.write
                Fpath.(foutput / "packages" / pkg_name / ver / "status.json")
                (if failed then {|"Failed"|} else {|"Built"|})
              |> get_ok
      in

      List.iter handle_package pkgs

let generate_named_package output package_name =
  (* Fs.Directory.t is actually an fpath, so this should never fail *)
  let output_path =
    Fpath.(of_string (Odoc_odoc.Fs.Directory.to_string output)) |> get_ok
  in
  let dir = Fpath.(output_path / "packages" / package_name) in
  let file = Fpath.(dir / "index.html") in
  (* stoopid *)
  Odoc_odoc.Fs.Directory.(mkdir_p (of_string Fpath.(to_string dir)));
  let v = Odoc_thtml.Pages.Package.v package_name in
  Bos.OS.File.write file (Fmt.to_to_string (Tyxml.Html.pp ~indent:true ()) v)
  |> get_ok

let read_packages output_path =
  let rec sub l1 l2 =
    match (l1, l2) with
    | l1 :: l1s, l2 :: l2s when l1 = l2 -> sub l1s l2s
    | [], _ | _, [] -> Some l2
    | _ -> None
  in
  let output_segs = Fpath.segs output_path |> List.filter (fun x -> x <> "") in
  match
    Bos.OS.Dir.fold_contents ~elements:`Dirs
      (fun p packages ->
        match sub output_segs (Fpath.segs p) with
        | Some [ "packages"; pkg_name ] -> pkg_name :: packages
        | Some _ -> packages
        | None -> packages)
      [] output_path
  with
  | Error (`Msg m) ->
      Format.eprintf "Failed to find list of packages: %s\n%!" m;
      exit 1
  | Ok pkgs -> pkgs

let generate_package output package_name_opt =
  let output_path =
    Fpath.(of_string (Odoc_odoc.Fs.Directory.to_string output)) |> get_ok
  in
  match package_name_opt with
  | Some p -> generate_named_package output p
  | None ->
      let pkgs = read_packages output_path in
      List.iter (generate_named_package output) pkgs

let generate_packages output packages_json_opt =
  let output_path =
    Fpath.(of_string (Odoc_odoc.Fs.Directory.to_string output)) |> get_ok
  in
  let dir = Fpath.(output_path / "packages") in
  let file = Fpath.(dir / "index.html") in
  let packages =
    match packages_json_opt with
    | None -> read_packages output_path
    | Some packages_json -> (
        let packages_json =
          match Fpath.of_string packages_json with
          | Ok x -> x
          | Error (`Msg m) ->
              Format.eprintf "Failed to parse packages.json filename: %s\n%!" m;
              exit 1
        in
        match Bos.OS.File.read packages_json with
        | Error (`Msg m) ->
            Format.eprintf "Failed to read packages_json: %s\n%!" m;
            exit 1
        | Ok json -> (
            match Yojson.Safe.from_string json with
            | `List l ->
                let packages =
                  List.fold_right
                    (fun a acc ->
                      match a with `String s -> s :: acc | _ -> acc)
                    l []
                in
                packages
            | _ ->
                Format.eprintf "Unexpected contents in packages.json\n%!";
                exit 1))
  in
  let v = Odoc_thtml.Pages.Packages.v packages in
  Odoc_odoc.Fs.Directory.(mkdir_p (of_string Fpath.(to_string dir)));
  Bos.OS.File.write file (Fmt.to_to_string (Tyxml.Html.pp ~indent:true ()) v)
  |> get_ok;
  List.iter (fun pkg -> generate_named_package output pkg) packages;
  let foutput = Fpath.v (Odoc_odoc.Fs.Directory.to_string output) in
  let pkg_dir =
    Odoc_odoc.Fs.Directory.of_string Fpath.(to_string (foutput / "packages"))
  in
  Odoc_odoc.Fs.Directory.mkdir_p pkg_dir;
  Bos.OS.File.write
    Fpath.(foutput / "packages" / "tailwind.css")
    Odoc_thtml.Static.tailwind_css
  |> get_ok;
  Bos.OS.File.write
    Fpath.(foutput / "packages" / "extra.css")
    Odoc_thtml.Static.extra_css
  |> get_ok;
  Bos.OS.File.write
    Fpath.(foutput / "packages" / "highlight.pack.js")
    Odoc_thtml.Static.highlight_pack_js
  |> get_ok;
  Bos.OS.File.write
    Fpath.(foutput / "packages" / "colour-logo.svg")
    Odoc_thtml.Static.colour_logo_svg
  |> get_ok;
  Bos.OS.File.write
    Fpath.(foutput / "packages" / "colour-transparent-icon.svg")
    Odoc_thtml.Static.colour_transparent_icon_svg
  |> get_ok;
  Bos.OS.File.write
    Fpath.(foutput / "packages" / "voodoo_client.js")
    Odoc_thtml.Static.voodoo_client_js
  |> get_ok

module SMap = Map.Make (String)

let generate_json output =
  let linkedpath = Fpath.(v "linked") in
  let output_path =
    Fpath.(of_string (Odoc_odoc.Fs.Directory.to_string output)) |> get_ok
  in
  match
    Bos.OS.Dir.fold_contents ~elements:`Dirs
      (fun p map ->
        match Fpath.segs p with
        | [ "linked"; "packages"; pkg_name; pkg_version ] ->
            let l = try SMap.find pkg_name map with _ -> [] in
            let m = SMap.remove pkg_name map in
            SMap.add pkg_name (pkg_version :: l) m
        | _ -> map)
      SMap.empty linkedpath
  with
  | Error (`Msg m) ->
      Format.eprintf "Failed to find any packages: %s\n%!" m;
      exit 1
  | Ok map ->
      SMap.iter
        (fun pkg versions ->
          let file = Fpath.(output_path / "packages" / pkg / "package.json") in
          let json = `A (List.map (fun x -> `String x) versions) in
          Bos.OS.File.write file (OpamJson.to_string json) |> get_ok)
        map

let version = "v0.0.1"

let package_name_opt =
  let doc =
    "Package name (e.g. voodoo) - will only handle the named package if set"
  in
  Arg.(
    value
    & opt (some string) None
    & info ~docs ~docv:"NAME" ~doc [ "n"; "name" ])

let package_version_opt =
  let doc =
    "Package version (e.g. 0.0.1) - will only handle the specified version \
     package if set"
  in
  Arg.(
    value
    & opt (some string) None
    & info ~docs ~docv:"VERSION" ~doc [ "pkg-version" ])

let package_name =
  let doc = "Package name (e.g. voodoo)" in
  Arg.(
    required
    & opt (some string) None
    & info ~docs ~docv:"NAME" ~doc [ "n"; "name" ])

let packages_json_opt =
  let doc = "Packages json file" in
  Arg.(
    value
    & opt (some string) None
    & info ~docs ~docv:"FILE" ~doc [ "j"; "json" ])

let pkgver_cmd =
  let doc = "Generate HTML pages from odocl files" in
  ( Term.(
      const generate_pkgver $ output $ package_name_opt $ package_version_opt),
    Term.info "pkgver" ~version ~doc ~exits:Term.default_exits )

let package_cmd =
  let doc = "Generate a package page" in
  ( Term.(const generate_package $ output $ package_name_opt),
    Term.info "package" ~version ~doc ~exits:Term.default_exits )

let packages_cmd =
  let doc = "Generate a packages page" in
  ( Term.(const generate_packages $ output $ packages_json_opt),
    Term.info "packages" ~version ~doc ~exits:Term.default_exits )

let default_cmd =
  let doc = "Documentation generator" in
  ( Term.(ret (const (fun _ -> `Help (`Pager, None)) $ package_name)),
    Term.info "voodoo-gen" ~version ~doc ~exits:Term.default_exits )

let generate_json_cmd =
  let doc = "Generate opam JSON" in
  ( Term.(const generate_json $ output),
    Term.info "generate-json" ~version ~doc ~exits:Term.default_exits )

let cmds = [ pkgver_cmd; package_cmd; packages_cmd; generate_json_cmd ]

let () = Term.(exit @@ eval_choice default_cmd cmds)
