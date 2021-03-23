(* do! *)
open Sexplib.Std

open Listm
open Meta

module Paths = struct
  type t = Fpath.t

  let sexp_of_t fp = sexp_of_string (Fpath.to_string fp)
  let t_of_sexp x = string_of_sexp x |> Fpath.of_string |> Result.get_ok
  
  let compile = Fpath.v "compile"
  let prep = Fpath.v "prep"
end

module Mld = struct
  type t = {
    path : Paths.t;
    name : string;
    parent : t option;
    children : Odoc.child list;
  } [@@deriving sexp]

  let rec output_dir : t -> Paths.t = fun mld ->
    match mld.parent with
    | None -> Paths.compile
    | Some p -> Fpath.(output_dir p / p.name)
  
  let output_file mld = Fpath.(output_dir mld / ("page-" ^ mld.name ^ ".odoc"))

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

end

module Package = struct
  type universe_id = string
  and package_name = string 
  and package_version = string
  and t = universe_id * package_name * package_version
  [@@deriving sexp]

  let gen_parent : t -> blessed:bool -> modules:string list -> Mld.t =
    fun package ~blessed ~modules ->
      let cwd = Fpath.v "." in
      let children = List.map (fun m -> Odoc.CModule m) modules in
      let childrentxt = List.map (fun m -> Printf.sprintf "{!childmodule:%s}\n" m) modules in
      let (universe,package_name,package_version) = package in
      let top_parents =
        if blessed
        then begin
          let packages = Mld.v cwd "packages" None [Odoc.CPage package_name]
            (Printf.sprintf "{0 Packages}\n{!childpage:%s}\n" package_name) in
          packages
        end else begin
          let universes = Mld.v cwd "universes" None [Odoc.CPage universe]
            (Printf.sprintf "{0 Universes}\n{!childpage:%s}\n" universe) in
          let universe = Mld.v cwd universe (Some universes) [Odoc.CPage package_name]
            (Printf.sprintf "{0 %s}\n{!childpage:%s}\n" universe package_name) in
          universe
        end
      in
      let package = Mld.v cwd package_name (Some top_parents) [Odoc.CPage package_version]
        (Printf.sprintf "{0 %s}\n{!childpage:%s}\n" package_name package_version) in
      let version = Mld.v cwd package_version (Some package) children
        (Printf.sprintf "{0 %s}\n%s\n" package_version (String.concat "\n" childrentxt)) in
      Mld.compile version;
      version

end

module SourceInfo = struct
  type t = {
    package : package;
    path : Paths.t;
    name : string;
    digest : string;
    parent : Mld.t;
    deps : Odoc.compile_dep list
  }
  [@@deriving sexp]

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
  
  let is_hidden t =
    let s = t.name in
    let len = String.length s in
    let rec aux i =
      if i > len - 2 then false
      else if s.[i] = '_' && s.[i + 1] = '_' then true
      else aux (i + 1)
    in
    aux 0
  
end

module Index = struct
  (* Map of module digest to source info *)
  module M = Map.Make(String)

  type t = SourceInfo.t M.t

  let empty = M.empty

  type serialisable = (string * SourceInfo.t) list [@@deriving sexp]

  let sexp_of_t t =
    let x = M.bindings t in sexp_of_serialisable x 

  let t_of_sexp s =
    serialisable_of_sexp s |> List.to_seq |> M.of_seq

  let find_opt = M.find_opt

  let write t package is_blessed =
    let (id, pkg_name, pkg_version) = package in
    let output_dir =
      if is_blessed
      then Fpath.(Paths.compile / "packages" / pkg_name / pkg_version)
      else Fpath.(Paths.compile / "universes" / id / pkg_name / pkg_version)
    in
    Util.mkdir_p output_dir;
    let oc = open_out Fpath.(to_string (output_dir / "index.sexp")) in
    Printf.fprintf oc "%s" (Sexplib.Sexp.to_string_hum (sexp_of_t t));
    close_out oc

  let read f =
    let ic = open_in Fpath.(to_string f) in
    let lines = Util.lines_of_channel ic in
    t_of_sexp (Sexplib.Sexp.of_string (String.concat "\n" lines))

  let combine : t -> t -> t = fun t1 t2 ->
    M.fold M.add t1 t2

  let of_source_infos sis =
    List.fold_left (fun t si ->
      M.add si.SourceInfo.digest si t) M.empty sis
  
  let iter = M.iter
end



module InputSelect = struct

  let order path = 
    let ext = Fpath.get_ext path in
    match ext with
    | ".cmti" -> 0
    | ".cmt" -> 1
    | ".cmi" -> 2
    | _ -> 3

  (* Given a list of SourceInfo.t values, we need to find the 'best'
     file for each, and return an Index.t of these *)
  let select sis =
    let h = Hashtbl.create (List.length sis) in
    List.iter (fun (si : SourceInfo.t) ->
      let cur =
        try Hashtbl.find h si.digest with _ -> []
      in
      Hashtbl.replace h si.digest (si :: cur)) sis;
    let result =
      Hashtbl.fold (fun _k v acc ->
        let best = List.sort (fun v1 v2 -> compare (order v1.SourceInfo.path) (order v2.path)) v |> List.hd in
        best::acc) h []
    in Index.of_source_infos result

end

module IncludePaths = struct
  let get : Index.t -> SourceInfo.t -> Fpath.Set.t =
    fun index si ->
      let s = Mld.output_dir si.parent in
      let set = Fpath.Set.of_list [s] in
      List.fold_left (fun paths dep ->
        match Index.find_opt dep.Odoc.c_digest index with
        | Some si -> Fpath.Set.add SourceInfo.(output_dir si) paths
        | None ->
          Format.eprintf "Missing dependency: %s %s\n%!" dep.c_unit_name dep.c_digest;
          paths) set si.deps        
end


let best_source_file base_path =
  let file_preference =
    List.map (fun ext -> Fpath.add_ext ext base_path) [ "cmti"; "cmt"; "cmi" ]
  in
  let exists s =
    try
      let (_ : Unix.stats) = Unix.stat (Fpath.to_string s) in
      true
    with _ -> false
  in
  List.find exists file_preference

let get_source_info parent path =
  match Fpath.segs path with
  | "prep" :: "universes" :: id :: pkg_name :: version :: _ -> begin
    match Odoc.compile_deps path with
    | Some (name, digest, deps) ->
      [ SourceInfo.{ package = (id, pkg_name, version); path; name; digest; deps; parent } ]
    | None ->
      Format.eprintf "Badness here\n%!";
      []
    end
  | _ ->
    Format.eprintf "No, badness here\n%!"; []

(* let calculate_deps index source_infos =
  let (inter, intra) =
    List.fold_left (fun (inter,intra) si ->
      let deps = si.SourceInfo.deps in
      let (si_inter, intra') =
        List.fold_left (fun (inter, intra) dep ->
          let digest = dep.Odoc.c_digest in
          match List.find_opt (fun si -> si.SourceInfo.digest = digest) source_infos with
          | Some dep_si -> (inter, dep_si.digest :: intra)
          | None ->
            match Index.find_opt digest index with
            | Some p ->
              let path = SourceInfo.output_dir p in
              (path :: inter, intra)
            | None ->
              Format.eprintf "Not found handling %a (digest %s, module %s)\n%!" Fpath.pp si.path digest dep.Odoc.c_unit_name;
              (inter, intra)
          ) ([],[]) deps
      in
      let intra_dep = (si.path, intra') in
      ((si.digest, si_inter)::inter, intra_dep :: intra)) ([],[]) source_infos
  in
(inter, intra) *)

let package_info_of_fpath p =
  match Fpath.segs p with
  | "prep" :: "universes" :: id :: pkg_name :: pkg_version :: _ ->
    (id, pkg_name, pkg_version)
  | _ ->
    Format.eprintf "%s\n%!" (Fpath.to_string p);
    failwith "Bad path"

let run pkg_name is_blessed =
  let is_interesting p = List.mem (Fpath.get_ext p) [".cmti"; ".cmt"; ".cmi"] in
  (* Remove old pages *)
  let () = Bos.OS.File.delete (Fpath.v "compile/page-packages.odoc") |> Result.get_ok in
  let () = Bos.OS.File.delete (Fpath.v "compile/page-universes.odoc") |> Result.get_ok in

  let right_package p = let (_, n, _) = package_info_of_fpath p in n=pkg_name in
    let prep =
      Bos.OS.Dir.fold_contents ~dotfiles:true
        (fun p acc ->
          if is_interesting p && right_package p
          then p::acc
          else acc) [] Paths.prep
      |> Result.get_ok
    in
    let modules = List.fold_left (fun acc f ->
      let (_, name) = Fpath.split_base f in
      let name = Fpath.rem_ext name |> Fpath.to_string in
      if List.mem name acc then acc else name :: acc) [] prep
    in
    if List.length prep = 0 then exit 0;
    let package = package_info_of_fpath (List.hd prep) in
    let index_res =
      Bos.OS.Dir.fold_contents ~dotfiles:true
        (fun p acc ->
          let (_, name) = Fpath.split_base p in
          if name = Fpath.v "index.sexp"
          then Index.(combine (read p) acc)
          else acc) Index.empty Paths.compile in
    let index =
      match index_res with Ok index -> index | Error _ -> Index.empty in
    let parent = Package.gen_parent package ~blessed:is_blessed ~modules in
    let sis = prep >>= get_source_info parent in
    let this_index = InputSelect.select sis in
    Index.write this_index package is_blessed;
    let index = Index.combine this_index index in
    let rec compile h si compiled =
      if List.mem si.SourceInfo.path compiled then compiled else
        let compiled =
          List.fold_left (fun (compiled : fpath list) dep ->
            match Index.find_opt dep.Odoc.c_digest this_index with
            | Some si ->  
              compile h si compiled
            | None ->
              compiled) compiled si.deps in
        let includes = IncludePaths.get index si in
        let output = SourceInfo.output_file si in
        ignore(Odoc.compile ~parent:parent.Mld.name ~output si.path ~includes ~children:[]);
        si.path :: compiled
    in
    let _ = ignore(Index.M.fold compile this_index []) in
    let all_includes = Index.M.fold (fun _ si includes ->
      let i = IncludePaths.get index si in
      Fpath.Set.union i includes) this_index Fpath.Set.empty in
    Index.M.iter (fun _ si ->
      if SourceInfo.is_hidden si then () else
      ignore(Odoc.link (SourceInfo.output_file si) ~includes:all_includes);
      ignore(Odoc.html (SourceInfo.output_odocl si) Fpath.(v "html"))) this_index;
    
    

