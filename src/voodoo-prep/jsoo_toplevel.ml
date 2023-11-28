type t = {
  package : Package.t;
  cma_fpath : Fpath.t;
  dep_cmas : Jsoo_cma.t list;
  cmis : Jsoo_cmi.t list;
  js_files : Fpath.t list;
}

let meta_ext = ".jstop"
let js_name vv = Fpath.basename vv.cma_fpath ^ ".worker.js"
let meta_name vv = js_name vv ^ meta_ext

let pp fmt v =
  Format.fprintf fmt "{ package: %a; bc_exe_fpath: %a; js_files: [%a] }"
    Package.pp v.package Fpath.pp v.cma_fpath
    (Format.pp_print_list
       ~pp_sep:(fun fmt () -> Format.fprintf fmt ";")
       Fpath.pp)
    v.js_files

let meta_path vv = Fpath.(Package.prep_path vv.package / meta_name vv)
let js_dest_path vv = Fpath.(Package.prep_path vv.package / "voodoo_js_files")

let marshal v =
  let path = meta_path v in
  let oc = open_out_bin (Fpath.to_string path) in
  Marshal.to_channel oc v [];
  close_out oc

let unmarshal path : t =
  let ic = open_in_bin path in
  let result = Marshal.from_channel ic in
  close_in ic;
  result

let copy_js_files root vv =
  let dest_path = js_dest_path vv in
  Util.mkdir_p dest_path;
  List.iter
    (fun js ->
      let src = Fpath.(root / "lib" // js) in
      let dst = Fpath.(dest_path // js) in
      let dir, _ = Fpath.split_base dst in
      Util.mkdir_p dir;
      Util.cp src dst)
    vv.js_files

let process toplevel_fpath = unmarshal (Fpath.to_string toplevel_fpath)

let to_yojson t =
  let package = ("package", `String (Fpath.basename t.cma_fpath)) in
  let cma = ("cma", `String (js_name t)) in
  let dep_cmas = ("dep_cmas", `List (List.map Jsoo_cma.to_yojson t.dep_cmas)) in
  let cmis = ("cmis", `List (List.map Jsoo_cmi.to_yojson t.cmis)) in
  let js_files =
    ( "js_files",
      `List (List.map (fun s -> `String (Fpath.to_string s)) t.js_files) )
  in
  `Assoc [ package; cma; dep_cmas; cmis; js_files ]
