module M = Map.Make (String)

type t = { intern : Sourceinfo.t M.t; extern : Fpath.t M.t }

let empty = { intern = M.empty; extern = M.empty }

type serialisable = (string * Fpath.t) list

let find_opt name t = try Some (M.find name t.intern) with _ -> None
let find_extern_opt name t = try Some (M.find name t.extern) with _ -> None

let write t parent_mld =
  let output_dir = Mld.compile_dir parent_mld in
  Util.mkdir_p Fpath.(output_dir / parent_mld.name);
  let oc =
    open_out Fpath.(to_string (output_dir / parent_mld.name / "index.m"))
  in
  (* Turn intern into extern for serialising *)
  let extern : serialisable =
    M.fold
      (fun k v acc -> M.add k (Sourceinfo.compile_dir v) acc)
      t.intern M.empty
    |> M.bindings
  in
  Printf.fprintf oc "%s" (Marshal.to_string extern []);
  close_out oc

let read f =
  let ic = open_in Fpath.(to_string f) in
  let extern_list = (Marshal.from_channel ic : serialisable) in
  close_in ic;
  let extern =
    List.fold_left (fun acc (k, v) -> M.add k v acc) M.empty extern_list
  in
  { intern = M.empty; extern }

let combine t1 t2 =
  {
    intern = M.fold M.add t1.intern t2.intern;
    extern = M.fold M.add t1.extern t2.extern;
  }

let of_source_infos sis =
  let intern =
    List.fold_left (fun t si -> M.add si.Sourceinfo.digest si t) M.empty sis
  in
  { intern; extern = M.empty }
