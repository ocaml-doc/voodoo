type t = {
  package : Package.t;
  path : Paths.t;
  name : string;
  digest : string;
  parent : Mld.t;
  deps : Odoc.compile_dep list;
}

let output_dir : base:Fpath.t -> t -> Fpath.t =
 fun ~base si ->
  let segs = Fpath.segs si.path in
  match segs with
  | _prep :: _universe :: _package :: _version :: rest ->
      let fpath' = Fpath.v (String.concat "/" rest) in
      Fpath.append
        (Mld.output_dir ~base si.parent)
        (Fpath.split_base fpath' |> fst)
  | _ -> failwith "Invalid path"

let compile_dir : t -> Fpath.t = output_dir ~base:Paths.compile

let output_file : t -> Fpath.t = function
  | si -> Fpath.(output_dir ~base:Paths.compile si / (si.name ^ ".odoc"))

let output_odocl : t -> Fpath.t = function
  | si -> Fpath.(output_dir ~base:Paths.link si / (si.name ^ ".odocl"))

let is_hidden t = Util.is_hidden t.name
