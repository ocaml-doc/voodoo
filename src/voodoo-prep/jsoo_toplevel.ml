module Result = Bos_setup.R
open Result.Infix

type t = {
  package : Package.t;
  cma_fpath : Fpath.t;
  dep_cmas : Jsoo_cma.t list;
  cmis : Jsoo_cmi.t list;
  js_files : Fpath.t list;
  digest : Digest.t option;
}

let meta_ext = ".jstop"

let bc_exe_name vv =
  Printf.sprintf "top_worker_main_%s.bc" Fpath.(basename vv.cma_fpath)

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
let output_path vv = Fpath.(Package.jsoo_path vv.package / js_name vv)
let bc_exe_path vv = Fpath.(Package.prep_path vv.package / bc_exe_name vv)
let js_dest_path vv = Fpath.(Package.prep_path vv.package / "voodoo_js_files")

let digested_path vv =
  Util.O.to_result vv.digest ~none:(Bos_setup.R.msg "No digest")
  >>| fun digest ->
  Fpath.(Paths.jsoo / "toplevel-by-digest" / digest / "toplevel.js")

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

let build_toplevel vv =
  let path = Fpath.(Package.prep_path vv.package / "top_worker_main.ml") in
  Util.write_file path [ "let () = Js_top_worker.Worker.run ()" ];
  let bc_exe_fpath = bc_exe_path vv in
  let cmd =
    Bos.Cmd.(
      Ocamlfind.cmd % "ocamlc" % "-package" % "js_top_worker" % p path
      % "-linkpkg" % "-linkall" % "-o" % p bc_exe_fpath)
  in
  Logs.debug (fun m -> m "toplevel bc: %a\n%!" Bos.Cmd.pp cmd);
  Util.run_silent cmd;
  Logs.debug (fun m -> m "Produced %a%!" Fpath.pp bc_exe_fpath)

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

let cmd vv =
  let cmd =
    Bos.Cmd.(
      v "js_of_ocaml" % "--toplevel" % "--enable" % "effects" % "--pretty"
      % "--no-cmis")
  in
  let js f = Fpath.(js_dest_path vv // f |> to_string) in
  let cmd =
    List.fold_right
      (fun a cmd -> Bos.Cmd.(cmd % a))
      (List.map js vv.js_files @ [ "+toplevel.js"; "+dynlink.js" ])
      cmd
  in
  Bos.Cmd.(cmd % p (bc_exe_path vv) % "-o" % p (output_path vv))

let process toplevel_fpath =
  Logs.info (fun m -> m "Processing %a%!" Fpath.pp toplevel_fpath);
  let toplevel = unmarshal (Fpath.to_string toplevel_fpath) in
  let cmd = cmd toplevel in
  let dir = fst (Fpath.split_base (output_path toplevel)) in
  Util.mkdir_p dir;
  Logs.debug (fun m -> m "Toplevel: %a\n%!" Bos.Cmd.pp cmd);
  Util.run_silent cmd;
  let digest =
    Some (Digest.file (Fpath.to_string @@ output_path toplevel) |> Digest.to_hex)
  in
  let toplevel = { toplevel with digest } in
  digested_path toplevel >>| fun digested_path ->
  let digested_dir, _ = Fpath.split_base digested_path in
  Util.mkdir_p digested_dir;
  Util.mv (output_path toplevel) digested_path;
  { toplevel with digest }

let to_yojson t =
  let package = ("package", `String (Fpath.basename t.cma_fpath)) in
  let cma = ("cma", `String (js_name t)) in
  let dep_cmas = ("dep_cmas", `List (List.map Jsoo_cma.to_yojson t.dep_cmas)) in
  let cmis = ("cmis", `List (List.map Jsoo_cmi.to_yojson t.cmis)) in
  Util.O.to_result t.digest ~none:(Bos_setup.R.msg "No digest")
  >>| fun digest ->
  let digest = ("digest", `String digest) in
  `Assoc [ package; cma; dep_cmas; cmis; digest ]
