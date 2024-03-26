module Result = Bos_setup.R

type t = {
  path : Paths.t;
  name : string;
  parent : t option;
  children : Odoc.child list;
}

let rec pp fmt v =
  let child_pp fmt = function
    | Odoc.CModule m -> Format.fprintf fmt "CModule %s" m
    | CPage p -> Format.fprintf fmt "CPage %s" p
    | CSrc p -> Format.fprintf fmt "CSrc %s" p
  in
  Format.fprintf fmt "{ path: %a; name: %s; parent: %a; children: %a }" Fpath.pp
    v.path v.name (Fmt.option pp) v.parent
    (Fmt.list ~sep:(fun fmt () -> Format.fprintf fmt ",") child_pp)
    v.children

let rec output_dir : base:Fpath.t -> t -> Paths.t =
 fun ~base mld ->
  match mld.parent with
  | None -> base
  | Some p ->
      let pdir = output_dir ~base p in
      Fpath.(pdir / p.name)

let compile_dir = output_dir ~base:Paths.compile
let link_dir = output_dir ~base:Paths.link
let output_file mld = Fpath.(compile_dir mld / ("page-" ^ mld.name ^ ".odoc"))
let output_odocl mld = Fpath.(link_dir mld / ("page-" ^ mld.name ^ ".odocl"))

let rec compile mld =
  let () = Bos.OS.File.delete (output_file mld) |> Result.get_ok in
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

let of_fpath ~parent path =
  let _, name_ext = Fpath.split_base path in
  let name = Fpath.rem_ext name_ext |> Fpath.to_string in
  { path; name; parent = Some parent; children = [] }
