type t = {
  package : Package.t;
  path : Paths.t;
  src_file : Fpath.t option;
  name : string;
  digest : string;
  parent : Mld.t;
  deps : Odoc.compile_dep list;
}

let output_dir ~base si =
  let segs = Fpath.segs si.path in
  match segs with
  | _prep :: _universe :: _package :: _version :: rest ->
      let fpath' = Fpath.v (String.concat "/" rest) in
      Fpath.append
        (Mld.output_dir ~base si.parent)
        (Fpath.split_base fpath' |> fst)
  | _ -> failwith "Invalid path"

let compile_dir = output_dir ~base:Paths.compile
let link_dir = output_dir ~base:Paths.link
let output_file si = Fpath.(compile_dir si / (si.name ^ ".odoc"))
let output_odocl si = Fpath.(link_dir si / (si.name ^ ".odocl"))
let output_linked_odoc_for_src si = Fpath.(link_dir si / (si.name ^ ".odoc"))
let is_hidden t = Util.is_hidden t.name
