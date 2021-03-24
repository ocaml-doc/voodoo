
type t = {
  package : Package.t;
  path : Paths.t;
  name : string;
  digest : string;
  parent : Mld.t;
  deps : Odoc.compile_dep list
}

let output_dir : t -> Fpath.t = function si ->
  let segs = Fpath.segs si.path in
  match segs with
  | _prep :: _universe :: _package :: _version :: rest ->
    let fpath' = Fpath.v (String.concat "/" rest) in
    Fpath.append (Mld.output_dir si.parent) (Fpath.split_base fpath' |> fst)
  | _ -> failwith "Invalid path"

let output_file : t -> Fpath.t = function si ->
  Fpath.(output_dir si / (si.name ^ ".odoc"))

let output_odocl : t -> Fpath.t = function si ->
  Fpath.(output_dir si / (si.name ^ ".odocl"))

let is_hidden t = Util.is_hidden t.name
