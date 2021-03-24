  (* Map of module digest to source info *)
  module M = Map.Make(String)

  type t = {
    intern : Sourceinfo.t M.t;
    extern : Fpath.t M.t;
  }

  let empty = { intern = M.empty; extern = M.empty }

  type serialisable = (string * Fpath.t) list

  let find_opt name t = try Some (M.find name t.intern) with | _ -> None

  let find_extern_opt name t = try Some (M.find name t.extern) with | _ -> None

  let write t package is_blessed =
    let (id, pkg_name, pkg_version) = package in
    let output_dir =
      if is_blessed
      then Fpath.(Paths.compile / "packages" / pkg_name / pkg_version)
      else Fpath.(Paths.compile / "universes" / id / pkg_name / pkg_version)
    in
    Util.mkdir_p output_dir;
    let oc = open_out Fpath.(to_string (output_dir / "index.m")) in
    (* Turn intern into extern for serialising *)
    let extern : serialisable = M.fold (fun k v acc -> M.add k (Sourceinfo.output_dir v) acc) t.intern M.empty |> M.bindings in
    Printf.fprintf oc "%s" (Marshal.to_string extern []);
    close_out oc

  let read f =
    let ic = open_in Fpath.(to_string f) in
    let extern_list = (Marshal.from_channel ic : serialisable) in
    let extern = List.fold_left (fun acc (k,v) -> M.add k v acc) M.empty extern_list in
    { intern = M.empty; extern }

  let combine : t -> t -> t = fun t1 t2 ->
    { intern = M.fold M.add t1.intern t2.intern;
      extern = M.fold M.add t1.extern t2.extern }

  let of_source_infos sis =
    let intern = List.fold_left (fun t si ->
      M.add si.Sourceinfo.digest si t) M.empty sis in
    { intern; extern=M.empty }
  
  let iter = M.iter
  