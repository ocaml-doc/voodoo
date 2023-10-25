type t = { package : Package.t; path : Fpath.t }

let name v = Fpath.basename v.path

let func_name vv =
  let n = name vv in
  Astring.String.cuts ~sep:"." n
  |> String.concat "_dot_"
  |> Astring.String.cuts ~sep:"-"
  |> String.concat "_dash_"

let pp fmt v =
  Format.fprintf fmt "{ path: %a; package: %a }" Fpath.pp v.path Package.pp
    v.package

let ext = ".jscma"
let cma_path vv = Fpath.(Package.prep_path vv.package // vv.path)

let meta_path vv =
  Fpath.(Package.prep_path vv.package // add_ext ext (v (name vv)))

let output_path vv =
  Fpath.(Package.jsoo_path vv.package // add_ext ".js" (v (name vv)))

let server_path vv = Fpath.(v "/toplevels" // output_path vv)

let runtime_path vv =
  Fpath.(
    Package.prep_path vv.package
    / "voodoo_js_files" / vv.package.name / "runtime.js")

let to_yojson t =
  let path = ("path", `String (server_path t |> Fpath.to_string)) in
  let function_ = ("function", `String (func_name t)) in
  `Assoc [ path; function_ ]

let marshal v =
  let path = meta_path v in
  let oc = open_out_bin (Fpath.to_string path) in
  Marshal.to_channel oc v [];
  close_out oc

let unmarshal path =
  let ic = open_in_bin path in
  let result = Marshal.from_channel ic in
  close_in ic;
  result

let cmd vv =
  let runtime_js = runtime_path vv in
  let has_runtime = Util.file_exists runtime_js in
  Logs.info (fun m ->
      m "runtime %a: %s" Fpath.pp runtime_js
        (if has_runtime then "found" else "not found"));
  Bos.Cmd.(
    v "js_of_ocaml"
    %% on has_runtime (v "--linkall" % p (runtime_path vv))
    % p (cma_path vv)
    % "--enable" % "effects" % "--pretty" % "--wrap-with-fun" % func_name vv
    % "-o"
    % p (output_path vv))

let findlib () =
  let findlib_pkgs = Ocamlfind.list () in
  List.filter_map
    (fun pkg ->
      match Ocamlfind.cma_of_package pkg with
      | Some cma -> Some (cma, pkg)
      | None -> None)
    findlib_pkgs

let process cma_fpath =
  let cma = unmarshal (Fpath.to_string cma_fpath) in
  let cmd = cmd cma in
  let dir = fst (Fpath.split_base (output_path cma)) in
  Util.mkdir_p dir;
  Logs.debug (fun m -> m "Cma: %a\n%!" Bos.Cmd.pp cmd);
  Util.run_silent cmd;
  Logs.info (fun m -> m "Built %a ✅%!" Fpath.pp (output_path cma))
