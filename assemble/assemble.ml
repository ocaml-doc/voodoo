(** Prepare a "prep" tree for odocmkgen:
    - Add listing packages (universes, packages in universes, versions of packages)
    - Add default package page if there is not already one
      TODO: Not currently detecting user's package pages.
    - TODO: Add some informations to user's package pages ?
      (dependencies to other packages, list of modules and pages)
    *)

open Builder
open Util

let index_page_of_dir d =
  let parent, base = Fpath.split_base d in
  Fpath.( // ) parent (Fpath.set_ext ".mld" base)

let is_hidden s =
  let len = String.length s in
  let rec aux i =
    if i > len - 2 then false
    else if s.[i] = '_' && s.[i + 1] = '_' then true
    else aux (i + 1)
  in
  aux 0

(** {1 Interpret the directory tree} *)

let module_name_of_string = String.capitalize_ascii

(** This is an approximation. *)
let module_name_of_path f =
  if Fpath.mem_ext [ ".cmti"; ".cmt"; ".cmi" ] f then
    Some (module_name_of_string (Fpath.basename (Fpath.rem_ext f)))
  else None

type subpkg = { s_relpath : Fpath.t; s_modules : string list }
(** The path to modules is [universes/u_name/p_name/v_name/s_relpath/module]. *)

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

(** {1 Generating of pages} *)

(** Replace '-' by '_' and add the "page-" prefix. That's what [odocmkgen] is
    doing. *)
let page_name_of_string n =
  "page-" ^ String.concat "_" (String.split_on_char '-' n)

let pp_childpages out =
  List.iter (fun p -> fpf out "- {!childpage:%s}\n" (page_name_of_string p))

let pp_childmodules out = List.iter (fpf out "- {!childmodule:%s}\n")

let gen_universe_list universes out =
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

let gen_version_list pkg out =
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

let gen_blessed_package_list pkgs out =
  fpf out "{0 Packages}\n";
  pp_childpages out (List.map (fun p -> p.p_name) pkgs)

let gen_blessed_version_list = gen_version_list

(** {1 Assembling} *)

let fold_packages f acc universes =
  List.fold_left
    (fun acc u ->
      List.fold_left
        (fun acc p ->
          List.fold_left (fun acc v -> f acc u p v) acc p.p_versions)
        acc u.u_packages)
    acc universes

module Blessed_packages : sig
  type t

  val is_blessed : t -> universe -> package -> version -> bool

  val compute : universe list -> t
end = struct
  module S = Set.Make (struct
    type t = string * string * string [@@deriving ord]
    (** universe * name * version *)
  end)

  type t = S.t

  let is_blessed t uni pkg ver = S.mem (uni.u_name, pkg.p_name, ver.v_name) t

  let compute universes =
    let acc acc u p v = S.add (u.u_name, p.p_name, v.v_name) acc in
    fold_packages acc S.empty universes
end

let universes_root ~root = root / "universes"

let blessed_root ~root = root / "packages"

let package_root ~root u p v =
  universes_root ~root / u.u_name / p.p_name / v.v_name

let blessed_versions_list_root ~root p = blessed_root ~root / p.p_name

let blessed_package_root ~root p v = blessed_root ~root / p.p_name / v.v_name

let universe_page ~root u = index_page_of_dir (universes_root ~root / u.u_name)

let versions_list_page ~root u p =
  index_page_of_dir (universes_root ~root / u.u_name / p.p_name)

(** Generate listing pages for universes, packages in universes and versions of
    packages. *)
let assemble_listing_pages ~root universes =
  write_file
    (index_page_of_dir (universes_root ~root))
    (gen_universe_list universes);
  universes
  |> List.iter (fun uni ->
         write_file (universe_page ~root uni) (gen_universe_page uni);
         uni.u_packages
         |> List.iter (fun pkg ->
                write_file
                  (versions_list_page ~root uni pkg)
                  (gen_version_list pkg)))

(** Generate listing pages for blessed packages. *)
let assemble_blessed_listing_pages ~blessed_packages ~root universes =
  let blessed_pkgs =
    let cmp_pkg a b = String.compare a.p_name b.p_name in
    fold_packages
      (fun acc uni pkg ver ->
        if Blessed_packages.is_blessed blessed_packages uni pkg ver then
          pkg :: acc
        else acc)
      [] universes
    |> List.sort_uniq cmp_pkg
    (* |> Util.group_by ~cmp:cmp_pkg (fun (_, pkg, _) -> pkg) *)
  in
  write_file
    (index_page_of_dir (blessed_root ~root))
    (gen_blessed_package_list blessed_pkgs);
  blessed_pkgs
  |> List.iter (fun pkg ->
         write_file
           (index_page_of_dir (blessed_versions_list_root ~root pkg))
           (gen_blessed_version_list pkg))

(** Generate package pages. Handle blessed packages. Mutate the tree. *)
let assemble_package_pages ~blessed_packages ~deps ~root universes =
  let assemble_package_page uni pkg ver =
    if Blessed_packages.is_blessed blessed_packages uni pkg ver then (
      (* Blessed package. *)
      let dst = blessed_package_root ~root pkg ver in
      (* Move the package tree to [dst]. *)
      let src = package_root ~root uni pkg ver in
      Util.mv src ~dst;
      Deps.rename deps src ~dst;
      write_file (index_page_of_dir dst) (gen_package_page pkg.p_name ver);
      (* Update deps so the universe package page can still reference this. *)
      Deps.add deps
        (versions_list_page ~root uni pkg)
        [ blessed_versions_list_root ~root pkg ] )
    else
      write_file
        (index_page_of_dir (package_root ~root uni pkg ver))
        (gen_package_page pkg.p_name ver)
  in
  fold_packages (fun () -> assemble_package_page) () universes

(** Temporary: Will be done by [prep] when collecting object files. Collect deps
    for every object files. *)
let assemble_dep_file ~root deps dst =
  let print_relpath p =
    (* Make sure the paths are relative to [root]. *)
    match Fpath.relativize ~root p with
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

let run root =
  let deps = Compile_deps.of_dir_rec root in
  let universes = read_universes (root / "universes") in
  let blessed_packages = Blessed_packages.compute universes in
  assemble_listing_pages ~root universes;
  assemble_blessed_listing_pages ~blessed_packages ~root universes;
  assemble_package_pages ~blessed_packages ~deps ~root universes;
  assemble_dep_file ~root deps (root / "dep")

open Cmdliner

(** Example: [conv_compose Fpath.of_string Fpath.to_string Arg.dir] *)
let conv_compose ?docv parse to_string c =
  let open Arg in
  let docv = match docv with Some v -> v | None -> conv_docv c in
  let parse v = match conv_parser c v with Ok x -> parse x | Error _ as e -> e
  and print fmt t = conv_printer c fmt (to_string t) in
  conv ~docv (parse, print)

let a_top_path =
  let doc = "Root directory." in
  let fpath_dir = conv_compose Fpath.of_string Fpath.to_string Arg.dir in
  (* [some string] and not [some dir] because we don't need it to exist yet. *)
  Arg.(required & pos 0 (some fpath_dir) None & info [] ~doc)

let cmd = Term.(const run $ a_top_path)

let info =
  Term.info "assemble"
    ~doc:
      "Add package and listing pages to a prepared directory tree. Must be \
       called after $(b,prep) and before $(b,odocmkgen)."

let () = Term.exit (Term.eval (cmd, info))
