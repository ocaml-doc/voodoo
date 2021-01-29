(** Prepare a "prep" tree for odocmkgen:
    - Add listing packages (universes, packages in universes, versions of packages)
    - Add default package page if there is not already one
    - TODO: Add some informations to user's package pages ?
      (dependencies to other packages, list of modules and pages)
    *)

open Builder

let ( / ) = Fpath.( / )

let fpf = Printf.fprintf

(* TODO: Take this as CLI argument. *)
let top_path = Fpath.v "prep"

module Deps : sig
  type t
  (** Mutable data-structure storing dependencies. *)

  val create : unit -> t

  val add : t -> target:Fpath.t -> Fpath.t list -> unit
  (** Paths are internally normalized. [target] must be a path to a file, deps
      can be paths to files or directories. *)

  val fold : (Fpath.t -> Fpath.t list -> 'a -> 'a) -> t -> 'a -> 'a
end = struct
  module Tbl = Hashtbl.Make (struct
    type t = Fpath.t

    let equal = Fpath.equal

    let hash = Hashtbl.hash
  end)

  type t = Fpath.t list Tbl.t

  let create () = Tbl.create 50

  let add tbl ~target extra_deps =
    let target = Fpath.normalize target in
    let deps = match Tbl.find_opt tbl target with Some d -> d | None -> [] in
    let extra_deps = List.rev_map Fpath.normalize extra_deps in
    Tbl.replace tbl target (List.rev_append extra_deps deps)

  let fold = Tbl.fold
end

let write_file p f =
  let out = open_out (Fpath.to_string p) in
  Format.eprintf "Create '%a'\n" Fpath.pp p;
  Fun.protect ~finally:(fun () -> close_out out) (fun () -> f out)

let index_page_of_dir d =
  let parent, base = Fpath.split_base d in
  Fpath.( // ) parent (Fpath.set_ext ".mld" base)

let is_dir (_, p) = Sys.is_directory (Fpath.to_string p)

let is_hidden s =
  let len = String.length s in
  let rec aux i =
    if i > len - 2 then false
    else if s.[i] = '_' && s.[i + 1] = '_' then true
    else aux (i + 1)
  in
  aux 0

(** Replace '-' by '_' and add the "page-" prefix. That's what [odocmkgen] is
    doing. *)
let page_name_of_string n =
  "page-" ^ String.concat "_" (String.split_on_char '-' n)

let module_name_of_string = String.capitalize_ascii

(** This is an approximation. *)
let module_name_of_path f =
  if Fpath.mem_ext [ ".cmti"; ".cmt"; ".cmi" ] f then
    Some (module_name_of_string (Fpath.basename (Fpath.rem_ext f)))
  else None

type subpkg = { s_relpath : Fpath.t; s_modules : string list }

type version = { v_name : string; v_subpkgs : subpkg list }

type package = { p_name : string; p_versions : version list }

type universe = { u_name : string; u_packages : package list }

(** Search recursively for sub-packages, a directory = a sub package.
    TODO: this is not working in most cases. *)
let rec read_subpkgs prefix p =
  let get_module (_, p) =
    match module_name_of_path p with
    | Some m as m' when not (is_hidden m) -> m'
    | _ -> None
  in
  let dirs, files = List.partition is_dir (Util.list_dir p) in
  let s_modules =
    List.sort_uniq String.compare (List.filter_map get_module files)
  in
  { s_relpath = prefix; s_modules }
  :: List.concat_map (fun (s, p') -> read_subpkgs (prefix / s) p') dirs

let read_versions p =
  Util.list_dir p |> List.filter is_dir
  |> List.map (fun (v_name, p') ->
         { v_name; v_subpkgs = read_subpkgs (Fpath.v "lib") (p' / "lib") })

let read_packages p =
  Util.list_dir p |> List.filter is_dir
  |> List.map (fun (p_name, p') -> { p_name; p_versions = read_versions p' })

let read_universes p =
  Util.list_dir p |> List.filter is_dir
  |> List.map (fun (u_name, p') -> { u_name; u_packages = read_packages p' })

let pp_childpages out =
  List.iter (fun p -> fpf out "- {!childpage:%s}\n" (page_name_of_string p))

let pp_childmodules out = List.iter (fpf out "- {!childmodule:%s}\n")

let gen_universes_list universes out =
  fpf out
    "{0 Universes}\n\
     These universes are for those packages that are compiled against an \
     alternative set of dependencies than those in the 'packages' hierarchy.\n";
  pp_childpages out (List.map (fun u -> u.u_name) universes);
  ()

let gen_universe_page universe out =
  fpf out
    "{0 Universe %s}\n\
     {1 Packages}\n\
     This dependency universe has been used to compile the following packages:\n"
    universe.u_name;
  pp_childpages out (List.map (fun p -> p.p_name) universe.u_packages);
  ()

let gen_versions_list pkg out =
  fpf out "{0 Package '%s'}\n{1 Versions}\n" pkg.p_name;
  pp_childpages out (List.map (fun v -> v.v_name) pkg.p_versions);
  ()

let gen_package_page pkg_name ver out =
  let gen_subpkg subpkg =
    let segs = match Fpath.segs subpkg.s_relpath with _ :: tl | tl -> tl in
    let name = String.concat "." (pkg_name :: segs) in
    fpf out "{1 [%s]}\n" name;
    pp_childmodules out subpkg.s_modules;
    ()
  in
  fpf out "{0 Package '%s' version %s}\n" pkg_name ver.v_name;
  List.iter gen_subpkg ver.v_subpkgs;
  ()

let assemble_package p pkg_name ver =
  let p = p / ver.v_name in
  write_file (index_page_of_dir p) (gen_package_page pkg_name ver)

let assemble_package_versions p pkg =
  let p = p / pkg.p_name in
  write_file (index_page_of_dir p) (gen_versions_list pkg);
  List.iter (assemble_package p pkg.p_name) pkg.p_versions

let assemble_universe p universe =
  let p = p / universe.u_name in
  write_file (index_page_of_dir p) (gen_universe_page universe);
  List.iter (assemble_package_versions p) universe.u_packages

let assemble_universes p universes =
  write_file (index_page_of_dir p) (gen_universes_list universes);
  List.iter (assemble_universe p) universes

let query_comple_deps p =
  let process_line line =
    match Astring.String.cuts ~sep:" " line with
    | [ c_name; c_digest ] -> Some (c_name, c_digest)
    | _ -> None
  in
  Util.lines_of_process "odoc" [ "compile-deps"; Fpath.to_string p ]
  |> List.filter_map process_line

let rec list_dir_rec acc p =
  Util.list_dir p
  |> List.fold_left
       (fun acc ((_, f) as f') ->
         if is_dir f' then list_dir_rec acc f else f :: acc)
       acc

module DigestMap = Map.Make (Digest)

let compute_compile_deps paths =
  let deps_and_digest f =
    (* Query [odoc compile-deps]. *)
    if not (Fpath.mem_ext [ ".cmti"; ".cmt"; ".cmi" ] f) then None
    else
      let unit_name =
        String.capitalize_ascii Fpath.(to_string (rem_ext (base f)))
      in
      match
        List.partition (fun (name, _) -> name = unit_name) (query_comple_deps f)
      with
      | [ self ], deps -> Some (snd self, List.map snd deps)
      | _ ->
          Format.eprintf "Failed to find digest for self (%a)\n%!" Fpath.pp f;
          None
  in
  let deps_and_digests = List.rev_map deps_and_digest paths in
  let inputs_by_digest =
    List.fold_left2
      (fun acc f -> function Some (digest, _) -> DigestMap.add digest f acc
        | None -> acc)
      DigestMap.empty paths deps_and_digests
  in
  let find_dep dep = DigestMap.find_opt dep inputs_by_digest in
  let deps_tbl = Deps.create () in
  List.iter2
    (fun target -> function
      | Some (_, deps) ->
          Deps.add deps_tbl ~target (List.filter_map find_dep deps)
      | None -> ())
    paths deps_and_digests;
  deps_tbl

(** Temporary: Will be done by [prep] when collecting object files. Collect deps
    for every object files. *)
let assemble_dep_file deps dst =
  let print_relpath p =
    (* Make sure the paths are relative to [top_path]. *)
    match Fpath.relativize ~root:top_path p with
    | Some r -> Fpath.to_string r
    | None -> assert false
  in
  write_file dst (fun out ->
      Deps.fold
        (fun target deps () ->
          if deps = [] then ()
          else (
            fpf out "%s" (print_relpath target);
            List.iter (fun p -> fpf out " %s" (print_relpath p)) deps;
            fpf out "\n" ))
        deps ())

let run () =
  let deps = list_dir_rec [] top_path |> compute_compile_deps in
  let universes = read_universes (top_path / "universes") in
  assemble_universes (top_path / "universes") universes;
  assemble_dep_file deps (top_path / "dep")

open Cmdliner

let cmd = Term.(const run $ const ())

let info =
  Term.info "assemble"
    ~doc:
      "Add package and listing pages to a prepared directory tree. Must be \
       called after $(b,prep) and before $(b,odocmkgen)."

let () = Term.exit (Term.eval (cmd, info))
