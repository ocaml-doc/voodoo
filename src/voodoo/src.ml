type t = {
  path : Paths.t;
  name : string;
  contents : string list;
  parent : Mld.t;
}

let output_dir ~base src =
  let pdir = Mld.output_dir ~base src.parent in
  Fpath.(pdir / src.parent.name)

let compile_dir = output_dir ~base:Paths.compile
let link_dir = output_dir ~base:Paths.link
let output_file src = Fpath.(compile_dir src / ("src-" ^ src.name ^ ".odoc"))
let output_odocl src = Fpath.(link_dir src / ("src-" ^ src.name ^ ".odocl"))

let compile src =
  let () = Bos.OS.File.delete (output_file src) |> Result.get_ok in
  let includes, parent = (Mld.compile_dir src.parent, src.parent.name) in
  Odoc.source_tree ~parent ~output:(output_file src) src.path ~includes

let write src =
  let contents = List.sort String.compare src.contents in
  let oc = open_out Fpath.(to_string src.path) in
  List.iter (fun line -> Printf.fprintf oc "%s\n" line) contents;
  close_out oc

let v dir name parent contents =
  let path = Fpath.(dir / (name ^ ".map")) in
  let src = { path; name; parent; contents } in
  Util.mkdir_p dir;
  src

let remove name =
  match Bos.OS.File.delete Fpath.(v (name ^ ".map")) with
  | Ok x -> x
  | Error (`Msg m) ->
      Format.eprintf "Failed to remove file: %s.map - %s\n%!" name m;
      ()

let compile src =
  remove src.name;
  write src;
  compile src
