module StringSet = Set.Make (String)

type t = { package : Package.t; path : Fpath.t }

let prep_path vv = Fpath.(Package.prep_path vv.package // vv.path)
let output_path vv = Fpath.(Package.jsoo_path vv.package // vv.path)
let server_path vv = Fpath.(v "/toplevels" // output_path vv)

let pp fmt v =
  Format.fprintf fmt "{ package: %a; path: %a }" Package.pp v.package Fpath.pp
    v.path

let compare v1 v2 =
  let s1 = Format.asprintf "%a" pp v1 in
  let s2 = Format.asprintf "%a" pp v2 in
  String.compare s1 s2

let to_yojson t = `String (server_path t |> Fpath.to_string)

let copy universes cmis =
  let cmis =
    List.filter
      (fun cmi -> StringSet.mem cmi.package.universe_id universes)
      cmis
  in
  let l = List.map (fun cmi -> (prep_path cmi, output_path cmi)) cmis in
  let dst_dirs =
    List.map
      (fun (_, f) ->
        let dir, _ = Fpath.split_base f in
        dir)
      l
    |> List.sort_uniq Fpath.compare
  in
  List.iter Util.mkdir_p dst_dirs;
  List.iter
    (fun (src, dst) -> if Fpath.has_ext ".cmi" src then Util.cp src dst)
    l

let stdlib pkgs =
  let root = Fpath.v @@ Opam.prefix () in
  let find_pkg s = List.find (fun { Package.name; _ } -> name = s) pkgs in
  let stdlib_pkg = find_pkg "ocaml-base-compiler" in
  let num_pkg = find_pkg "num" in
  let num_cmis =
    [ "arith_status.cmi"; "big_int.cmi"; "nat.cmi"; "num.cmi"; "ratio.cmi" ]
  in
  Ocamlfind.stdlib_path ()
  |> Bos.OS.Dir.fold_contents
       (fun path acc ->
         if Fpath.has_ext "cmi" path then
           match Fpath.relativize ~root path with
           | Some path ->
               let package =
                 let file = Fpath.filename path in
                 if List.mem file num_cmis then num_pkg else stdlib_pkg
               in
               { package; path } :: acc
           | None -> acc
         else acc)
       []
