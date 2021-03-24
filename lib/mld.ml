type t = {
  path : Paths.t;
  name : string;
  parent : t option;
  children : Odoc.child list;
}

let rec output_dir : t -> Paths.t = fun mld ->
  match mld.parent with
  | None -> Paths.compile
  | Some p -> Fpath.(output_dir p / p.name)

let output_file mld = Fpath.(output_dir mld / ("page-" ^ mld.name ^ ".odoc"))

let output_odocl mld = Fpath.(output_dir mld / ("page-" ^ mld.name ^ ".odocl"))

let rec compile mld =
  if Bos.OS.File.exists (output_file mld) |> Result.get_ok then () else begin
    let extra_include, parent =
      match mld.parent with
      | None -> [], None
      | Some parent ->
        compile parent;
        [output_dir parent], Some parent.name
    in
    let includes = Fpath.Set.of_list extra_include in
    ignore(Odoc.compile ?parent ~output:(output_file mld) mld.path ~includes ~children:mld.children)
  end

let write mld contents =
  let oc = open_out Fpath.(to_string mld.path) in
  Printf.fprintf oc "%s" contents;
  close_out oc

let v dir name parent children contents =
  let path = Fpath.(dir / (name ^ ".mld")) in
  let mld = {
    path;
    name;
    parent;
    children;
  } in
  Util.mkdir_p dir;
  write mld contents;
  mld    