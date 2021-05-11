type t = {
  path : Paths.t;
  name : string;
  parent : t option;
  children : Odoc.child list;
}

let rec output_dir : base:Fpath.t -> t -> Paths.t =
 fun ~base mld ->
  match mld.parent with
  | None -> base
  | Some p ->
      let pdir = output_dir ~base p in
      Fpath.(pdir / p.name)

let compile_dir = output_dir ~base:Paths.compile

let link_dir = output_dir ~base:Paths.link

let output_file mld =
  Fpath.(output_dir ~base:Paths.compile mld / ("page-" ^ mld.name ^ ".odoc"))

let output_odocl mld =
  Fpath.(output_dir ~base:Paths.link mld / ("page-" ^ mld.name ^ ".odocl"))

let rec compile mld =
  if Bos.OS.File.exists (output_file mld) |> Util.get_ok then ()
  else
    let extra_include, parent =
      match mld.parent with
      | None -> ([], None)
      | Some parent ->
          compile parent;
          ([ compile_dir parent ], Some parent.name)
    in
    let includes = Fpath.Set.of_list extra_include in
    ignore
      (Odoc.compile ?parent ~output:(output_file mld) mld.path ~includes
         ~children:mld.children)

let write mld contents =
  let oc = open_out Fpath.(to_string mld.path) in
  Printf.fprintf oc "%s" contents;
  close_out oc

let v dir name parent children contents =
  let path = Fpath.(dir / (name ^ ".mld")) in
  let mld = { path; name; parent; children } in
  Util.mkdir_p dir;
  write mld contents;
  mld

let of_fpath parent path =
  let _, name_ext = Fpath.split_base path in
  let name = Fpath.rem_ext name_ext |> Fpath.to_string in
  { path; name; parent = Some parent; children = [] }
