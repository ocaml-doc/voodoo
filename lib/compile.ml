open Listm

type source_info = {
  root : Fpath.t;  (** Root path in which this was found *)
  name : string;  (** 'Astring' *)
  dir : Fpath.t;
      (** full path to containing dir , e.g. /home/opam/.opam/4.10.0/lib/astring *)
  fname : Fpath.t;
  (* filename with extension *)
  digest : Digest.t;
  package : Opam.package;
  (* Package in which this file lives ("astring") *)
  deps : Odoc.compile_dep list;  (** dependencies of this file *)
  blessed : bool;
  universe : Universe.t;
}
(** Represents necessary information about a particular cmi/cmti/cmt file *)

let pp fmt s =
  Format.fprintf fmt
    "@[<v 2>{@,\
     root: %a@,\
     name: %s@,\
     dir: %a@,\
     fname: %a@,\
     digest: %s@,\
     package: %a@,\
     deps: [%s]@,\
     blessed: %b@,\
     universe: %s@,\
     }@]"
    Fpath.pp s.root s.name Fpath.pp s.dir Fpath.pp s.fname s.digest
    Opam.pp_package s.package
    (String.concat "," (List.map (fun o -> o.Odoc.c_unit_name) s.deps))
    s.blessed s.universe.id

module MLDChild = struct
  type t = Mld of Fpath.t | CU of source_info

  let compare t1 t2 =
    match (t1, t2) with
    | Mld p1, Mld p2 -> Fpath.compare p1 p2
    | CU s1, CU s2 -> Digest.compare s1.digest s2.digest
    | Mld _, CU _ -> 1
    | CU _, Mld _ -> -1
end

module ChildSet = Set.Make (MLDChild)

type mldtype =
  | Packages
  | Universes
  | Universe of string
  | Package of string
  | Version

and mld = {
  mldname : string;
  dir : Fpath.t;
  mld : Fpath.t;
  odoc : Fpath.t;
  children : ChildSet.t;
  parent : Fpath.t option;
  ty : mldtype;
}

let is_hidden x =
  let is_hidden s =
    let len = String.length s in
    let rec aux i =
      if i > len - 2 then false
      else if s.[i] = '_' && s.[i + 1] = '_' then true
      else aux (i + 1)
    in
    aux 0
  in
  is_hidden (Fpath.basename x)

let universe_and_package_of_relpath relpath =
  match Fpath.segs relpath with
  | "universes" :: universe :: pkg :: _version :: _rest -> (universe, pkg)
  | _ ->
      Format.eprintf "Invalid path, unable to determine package: %a\n%!"
        Fpath.pp relpath;
      failwith "Invalid path"

(* Given a base Fpath.t (a cmt, cmti or cmi, without extension), figure out the 'best' one - in order or preference
   cmti, cmt, cmi *)
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

(* Get info given a base file (cmt, cmti or cmi) *)
let get_info universe package root mod_file =
  let fname = best_source_file mod_file in
  let v =
    if package.Opam.name = "ocaml" || package.Opam.name = "ocaml-base-compiler"
    then package.version
    else
      match Universe.package_version universe "ocaml" with
      | Some v -> v
      | None ->
          Format.eprintf
            "Failed to find ocaml dependency for package %a (universe id %s)"
            Opam.pp_package package universe.Universe.id;
          failwith "erk"
  in
  let deps = Odoc.compile_deps v fname in
  let _, lname = Fpath.split_base mod_file in
  let name = Astring.String.Ascii.capitalize (Fpath.to_string lname) in
  let dir =
    match Fpath.relativize ~root fname with
    | Some p -> p
    | None -> failwith "odd"
  in
  try
    match List.partition (fun d -> d.Odoc.c_unit_name = name) deps with
    | self :: _, deps ->
        let digest = self.c_digest in
        let dir, fname = Fpath.split_base dir in
        [
          {
            root;
            name;
            dir;
            digest;
            deps;
            package;
            fname;
            universe;
            blessed = false;
          };
        ]
    | _ ->
        Format.eprintf "Failed to find digest for self (%s)\n%!" name;
        []
  with _ -> []

(* Returns the relative path to an odoc file based on an input file. For example, given
   `/home/opam/.opam/4.10.0/lib/ocaml/compiler-libs/lambda.cmi` it will return
   `odocs/ocaml/compiler-libs/lambda.odoc` *)
let pages = Hashtbl.create 100

let pp_mlchild fmt = function
  | MLDChild.CU _ -> Format.fprintf fmt "CU"
  | Mld p -> Format.fprintf fmt "%a" Fpath.pp p

let compile_basedir = Fpath.v "compile"

let set_child parent child =
  let p = Hashtbl.find pages parent.mld in
  if not (ChildSet.mem child p.children) then
    Hashtbl.replace pages parent.mld
      { p with children = ChildSet.add child p.children }
  else ()

let subdir_mld_odoc parent name ty =
  let f = Fpath.v (Printf.sprintf "%s.mld" name) in
  let basedir = match parent with None -> compile_basedir | Some p -> p.dir in
  let mld = Fpath.(basedir // f) in
  let child =
    match try Some (Hashtbl.find pages mld) with _ -> None with
    | Some p -> p
    | None ->
        let p =
          {
            mldname = name;
            dir = Fpath.(basedir // v name);
            mld;
            odoc = Fpath.(basedir // v (Printf.sprintf "page-%s.odoc" name));
            children = ChildSet.empty;
            parent =
              (match parent with
              | Some pparent -> Some pparent.mld
              | None -> None);
            ty;
          }
        in
        Hashtbl.replace pages mld p;
        p
  in
  match parent with
  | None -> child
  | Some pparent ->
      set_child pparent (Mld child.mld);
      child

let universes_page () = subdir_mld_odoc None "universes" Universes

let packages_page () = subdir_mld_odoc None "packages" Packages

let universe_page info =
  subdir_mld_odoc
    (Some (universes_page ()))
    info.universe.id (Universe info.universe.id)

let escape str =
  let s = String.concat "_" (Astring.String.cuts ~sep:"-" str) in
  String.concat "_" (Astring.String.cuts ~sep:"." s)

let package_page info =
  let name = escape info.package.name in
  let blessed = Universe.All.is_blessed info.package info.universe.id in
  if blessed then
    subdir_mld_odoc (Some (packages_page ())) name (Package info.package.name)
  else
    subdir_mld_odoc (Some (universe_page info)) name (Package info.package.name)

let version_page info =
  let v_str = escape info.package.version in
  subdir_mld_odoc (Some (package_page info)) v_str Version

let odoc_file_of_info info =
  Fpath.((version_page info).dir // set_ext "odoc" (v info.name))

let odocl_file_of_info info =
  Fpath.((version_page info).dir // set_ext "odocl" (v info.name))

module StringSet = Set.Make (String)
module StringMap = Map.Make (String)

let mld_contents mld =
  let child_format fmt = function
    | MLDChild.CU info -> Format.fprintf fmt "{!childmodule:%s}\n" info.name
    | Mld m ->
        let page = Hashtbl.find pages m in
        Format.fprintf fmt "{!childpage:%s}\n" page.mldname
  in
  let children =
    ChildSet.fold
      (fun c acc ->
        match c with
        | MLDChild.Mld _ -> c :: acc
        | CU info -> if is_hidden info.fname then acc else c :: acc)
      mld.children []
  in
  match mld.ty with
  | Universes ->
      [
        "{0 Universes}";
        "These universes are for those packages that are compiled against an \
         alternative set of dependencies than those in the 'packages' \
         hierarchy.";
        "";
      ]
      @ List.map (fun child -> Format.asprintf "%a" child_format child) children
  | Universe id ->
      let universe = Universe.All.find_universe id in
      let packs = Universe.S.elements universe.Universe.packages in
      let lines =
        List.fold_left
          (fun lines package ->
            Format.asprintf "%a" Opam.pp_package package :: lines)
          [] packs
      in
      [
        Printf.sprintf "{0 Universe %s}" id;
        "{1 Contents}";
        "The following packages form this dependency universe:";
      ]
      @ lines
      @ [
          "{1 Packages}";
          "This dependency universe has been used to compile the following \
           packages:";
        ]
      @ List.map (fun child -> Format.asprintf "%a" child_format child) children
  | Packages ->
      let name = function
        | MLDChild.CU info -> info.name
        | Mld m ->
            let page = Hashtbl.find pages m in
            page.mldname
      in
      let interpose_alphabet packages =
        let alpha_heading name =
          Printf.sprintf "{2 %c}" (Astring.Char.Ascii.uppercase name.[0])
        in

        let rec inner ps =
          match ps with
          | a :: b :: rest ->
              let na = name a in
              let nb = name b in
              if
                Astring.Char.Ascii.uppercase na.[0]
                <> Astring.Char.Ascii.uppercase nb.[0]
              then
                Format.asprintf "%a" child_format a
                :: alpha_heading nb :: inner (b :: rest)
              else Format.asprintf "%a" child_format a :: inner (b :: rest)
          | [ a ] -> [ Format.asprintf "%a" child_format a ]
          | [] -> []
        in
        let first = List.hd packages in
        alpha_heading (name first) :: inner packages
      in

      [ "{0 Packages}" ]
      @ interpose_alphabet
          (List.sort
             (fun c1 c2 ->
               String.compare
                 (Astring.String.Ascii.uppercase (name c1))
                 (Astring.String.Ascii.uppercase (name c2)))
             children)
  | Package p ->
      [ Printf.sprintf "{0 Package '%s'}" p; "{1 Versions}" ]
      @ List.map (fun child -> Format.asprintf "%a" child_format child) children
  | Version ->
      [ "{0 Modules}" ]
      @ List.map (fun child -> Format.asprintf "%a" child_format child) children

let parent_mld_fragment all_infos =
  List.iter
    (fun info ->
      let parent = version_page info in
      set_child parent (CU info))
    all_infos;
  let odocl_file trio = Fpath.set_ext "odocl" trio.odoc in
  let map_fn _ mld cur =
    let children = ChildSet.fold (fun c acc -> c :: acc) mld.children [] in
    let path, _ = Fpath.split_base mld.mld in
    Util.mkdir_p path;
    let oc = open_out (Fpath.to_string mld.mld) in
    let fmt = Format.formatter_of_out_channel oc in
    Format.fprintf fmt "%s\n%!" (String.concat "\n" (mld_contents mld));
    close_out oc;

    [
      Format.asprintf "%a : %a %s" Fpath.pp mld.odoc Fpath.pp mld.mld
        (match mld.parent with
        | None -> ""
        | Some p ->
            let page = Hashtbl.find pages p in
            Format.asprintf "%a" Fpath.pp page.odoc);
      Format.asprintf "\t/usr/bin/time -l odoc compile %a %a %s" Fpath.pp
        mld.mld
        (fun fmt -> function
          | None -> ()
          | Some p ->
              let page = Hashtbl.find pages p in
              Format.fprintf fmt "-I %a --parent %s" Fpath.pp
                (Fpath.split_base page.odoc |> fst)
                page.mldname)
        mld.parent
        (String.concat " "
           (List.map
              (function
                | MLDChild.Mld p ->
                    let page = Hashtbl.find pages p in
                    Format.asprintf "--child page-%s" page.mldname
                | CU p -> Format.asprintf "--child module-%s" p.name)
              children));
      Format.asprintf "compile : %a" Fpath.pp mld.odoc;
      Format.asprintf "%a : %a %a" Fpath.pp (odocl_file mld) Fpath.pp mld.odoc
        (Format.pp_print_list
           ~pp_sep:(fun fmt () -> Format.fprintf fmt " ")
           Fpath.pp)
        (List.map
           (function
             | MLDChild.Mld p ->
                 let page = Hashtbl.find pages p in
                 page.odoc
             | CU p -> odoc_file_of_info p)
           children);
      Format.asprintf "\todoc link %a -o %a %a" Fpath.pp mld.odoc Fpath.pp
        (odocl_file mld)
        (Format.pp_print_list (fun fmt p ->
             Format.fprintf fmt "-I %a" Fpath.pp p))
        (List.sort_uniq compare
           (List.map
              (fun p ->
                let p' =
                  match p with
                  | MLDChild.Mld p ->
                      let page = Hashtbl.find pages p in
                      page.odoc
                  | CU p -> odoc_file_of_info p
                in
                fst (Fpath.split_base p'))
              children));
      Format.asprintf "link: %a" Fpath.pp (odocl_file mld);
    ]
    :: cur
  in
  let result = Hashtbl.fold map_fn pages [] |> List.concat in
  ".PHONY: compile link" :: result

let total = ref 0

let n = ref 0

let get_deps all_infos info =
  info.deps >>= fun dep ->
  match StringMap.find dep.Odoc.c_digest all_infos with
  | exception Not_found ->
      Format.eprintf
        "Warning 1, couldn't find deps %s of file %a from universe %s\n"
        dep.Odoc.c_unit_name Fpath.pp
        Fpath.(info.dir // info.fname)
        info.universe.Universe.id;
      []
  | l -> (
      let own_universe =
        List.filter
          (fun x ->
            x.package = info.package && x.universe.id = info.universe.id)
          l
      in
      match own_universe with
      | l :: _ -> [ l ]
      | [] -> (
          let result =
            List.filter
              (fun x ->
                Universe.S.subset x.universe.packages info.universe.packages)
              l
          in
          let sorted =
            List.sort
              (fun x2 x1 ->
                compare
                  (Universe.S.cardinal x1.universe.Universe.packages)
                  (Universe.S.cardinal x2.universe.Universe.packages))
              result
          in
          try [ List.hd sorted ] with _ -> []))

module PandU = struct
  type t = Opam.package * Digest.t

  let equal (p1, d1) (p2, d2) =
    Digest.compare d1 d2 = 0
    && p1.Opam.name = p2.Opam.name
    && p1.version = p2.version

  let hash (p, d) = Hashtbl.hash (d, p.Opam.name, p.Opam.version)

  let compare (p1, d1) (p2, d2) =
    match String.compare d1 d2 with
    | (1 | -1) as x -> x
    | _ -> (
        match String.compare p1.Opam.name p2.Opam.name with
        | (1 | -1) as x -> x
        | _ -> String.compare p1.version p2.version)
end

module PH = Hashtbl.Make (PandU)
module PandUSet = Set.Make (PandU)

module PH2 = Hashtbl.Make (struct
  type t = Opam.package

  let equal p1 p2 = p1.Opam.name = p2.Opam.name && p1.version = p2.version

  let hash p = Hashtbl.hash (p.Opam.name, p.Opam.version)
end)

let stamp_of_package pkg universe =
  Format.asprintf ".compile_%s_%a" universe Opam.pp_package pkg

let makefile_of_package pkg universe =
  Format.asprintf "Makefile.%s_%a" universe Opam.pp_package pkg

(* Map of package to deps *)
let package_deps = PH.create 30000

let infos = PH2.create 30000

let fragments = PH.create 30000

(* Rules for compiling cm{t,ti,i} files into odoc files *)
let compile_fragment all_infos info =
  (* Get the filename of the output odoc file *)
  let odoc_path = odoc_file_of_info info in
  incr n;
  Format.eprintf "[%d/%d]\n%!" !n !total;
  (* Find by digest the [source_info] for each dependency in our source_info record *)
  let deps = get_deps all_infos info in

  (* Get a list of odoc files for the dependencies *)
  let dep_odocs =
    List.map
      (fun i ->
        if info.package = i.package then
          let odoc_file = odoc_file_of_info i in
          Fpath.to_string odoc_file
        else stamp_of_package i.package i.universe.id)
      deps
  in

  let dep_odocs = setify dep_odocs in

  (let key = (info.package, info.universe.id) in
   let value =
     List.map (fun dep -> (dep.package, dep.universe.id)) deps
     |> PandUSet.of_list
   in
   (match PH.find package_deps key with
   | exception Not_found -> PH.replace package_deps key value
   | xs -> PH.replace package_deps key (PandUSet.union xs value));
   match PH2.find infos info.package with
   | exception Not_found -> PH2.replace infos info.package [ info ]
   | xs -> PH2.replace infos info.package (info :: xs));

  let parent_trio = version_page info in
  let dep_odocs = Fpath.to_string parent_trio.odoc :: dep_odocs in

  let ocaml_version =
    match Universe.package_version info.universe "ocaml" with
    | Some v -> v
    | None ->
        if
          info.package.name = "ocaml"
          || info.package.name = "ocaml-base-compiler"
        then info.package.version
        else failwith "No ocaml version!"
  in

  (* Odoc requires the directories in which to find the odoc files of the dependencies *)
  let dep_dirs =
    Fpath.Set.of_list @@ List.map (fun i -> (version_page i).dir) deps
  in
  let include_str =
    String.concat " "
      (Fpath.Set.fold
         (fun dep_dir acc -> ("-I " ^ Fpath.to_string dep_dir) :: acc)
         dep_dirs [])
  in
  let home = Sys.getenv "HOME" in
  let frag =
    [
      Format.asprintf "%a : %a %s" Fpath.pp odoc_path Fpath.pp
        Fpath.(info.root // info.dir // info.fname)
        (String.concat " " dep_odocs);
      Format.asprintf
        "\t/usr/bin/time -l %s/.opam/%s/bin/odoc compile --parent %s -I %a $< \
         %s -o %a"
        home ocaml_version parent_trio.mldname Fpath.pp
        (Fpath.split_base parent_trio.odoc |> fst)
        include_str Fpath.pp odoc_path;
    ]
  in
  let key = (info.package, info.universe.id) in
  match PH.find fragments key with
  | exception Not_found -> PH.replace fragments key frag
  | xs -> PH.replace fragments key (frag @ xs)

let compile_stamps () =
  let cardinal = PH.length package_deps in
  let n = ref 0 in
  PH.iter
    (fun (package, universe_id) _deps ->
      incr n;
      Format.eprintf "stamp: [%d/%d]\n%!" !n cardinal;
      let stamp = stamp_of_package package universe_id in
      let infos = PH2.find infos package in
      let infos =
        List.filter
          (fun i -> i.package = package && i.universe.id = universe_id)
          infos
      in
      let odoc_files =
        List.map (fun i -> odoc_file_of_info i |> Fpath.to_string) infos
      in
      let frag =
        [
          Printf.sprintf "%s : %s" stamp (String.concat " " odoc_files);
          "\ttouch $@";
        ]
      in
      let key = (package, universe_id) in
      match PH.find fragments key with
      | exception Not_found -> PH.replace fragments key frag
      | xs -> PH.replace fragments key (frag @ xs))
    package_deps

let link_fragment () =
  let cardinal = PH.length package_deps in
  let n = ref 0 in
  PH.fold
    (fun (package, universe_id) deps acc ->
      incr n;
      Format.eprintf "link: [%d/%d]\n%!" !n cardinal;
      let deps = PandUSet.add (package, universe_id) deps in
      let extra =
        let u = Universe.All.find_universe universe_id in
        let missing =
          Universe.S.fold
            (fun pkg acc ->
              if not (PandUSet.exists (fun (pkg', _) -> pkg = pkg') deps) then
                match PH2.find infos pkg with
                | exception Not_found -> acc
                | _ -> pkg :: acc
              else acc)
            u.Universe.packages []
        in
        if List.length missing > 0 then
          (* Format.eprintf "Missing dependencies for package %a in universe %s\n%!" Opam.pp_package package universe_id; *)
          let extra =
            List.map
              (fun pkg ->
                let infos = PH2.find infos pkg in
                (* let universes = List.map (fun info -> info.universe.id) infos |> setify in *)
                (* Format.eprintf "Found %d infos for pkg %a in universes: %a\n%!" (List.length infos) Opam.pp_package pkg (Format.pp_print_list Format.pp_print_string) universes; *)
                let infos =
                  List.filter
                    (fun i ->
                      Universe.S.subset
                        (Universe.S.add i.package i.universe.packages)
                        u.packages)
                    infos
                in
                let sorted =
                  List.sort
                    (fun i1 i2 ->
                      compare
                        (Universe.S.cardinal i1.universe.packages)
                        (Universe.S.cardinal i2.universe.packages))
                    infos
                in
                try
                  let universe = (List.hd sorted).universe.id in
                  Result.Ok (pkg, universe)
                with _ -> Error pkg)
              missing
          in
          (* List.iter (fun m ->
             match m with
             | Ok (pkg, id) -> Format.eprintf "  Resolved dep - %a in universe %s\n%!" Opam.pp_package pkg id;
             | Error pkg -> Format.eprintf "  Unresolved dependency - %a\n%!" Opam.pp_package pkg) extra; *)
          List.fold_right
            (fun x acc -> match x with Result.Ok x -> x :: acc | _ -> acc)
            extra []
        else []
      in

      let deps = PandUSet.union deps (PandUSet.of_list extra) in
      let infos' = PH2.find infos package in
      let infos' =
        List.filter
          (fun i ->
            i.package = package
            && i.universe.id = universe_id
            && not (is_hidden i.fname))
          infos'
      in
      let deps =
        PandUSet.fold
          (fun (pkg, universe) acc ->
            match PH2.find infos pkg with
            | exception Not_found -> acc
            | xs -> List.filter (fun x -> x.universe.id = universe) xs @ acc)
          deps []
      in

      let dep_pkgs =
        setify @@ List.map (fun dep -> (dep.package, dep.universe.id)) deps
      in
      let dep_dirs =
        setify
        @@ List.map
             (fun dep ->
               let dir, _ = Fpath.split_base (odoc_file_of_info dep) in
               Fpath.to_string dir)
             deps
      in
      let include_str = "-I " ^ String.concat " -I " dep_dirs in
      let result =
        List.map
          (fun info ->
            let odocl_file = odocl_file_of_info info in
            let odoc_file = odoc_file_of_info info in
            [
              Format.asprintf "%a : %s" Fpath.pp odocl_file
                (String.concat " "
                   (List.map (fun (p, id) -> stamp_of_package p id) dep_pkgs));
              Format.asprintf "\todoc link %a %s -o %a" Fpath.pp odoc_file
                include_str Fpath.pp odocl_file;
              Format.asprintf "link : %a\n%!" Fpath.pp odocl_file;
            ])
          infos'
      in
      (Format.asprintf "# XXXXXX Package: %a universe %s" Opam.pp_package
         package)
        universe_id
      :: List.flatten result
      @ acc)
    package_deps []

let universe_path id = Fpath.(v "prep" / "universes" / id)

let packages_path id = Fpath.(universe_path id // v "packages.usexp")

let read_universe id =
  Format.eprintf "Reading universe: %s\n%!" id;
  let universe = Universe.load (packages_path id) in
  Inputs.(contents (universe_path id) >>= filter is_dir) >>= fun package_path ->
  Inputs.(contents package_path >>= filter is_dir) >>= fun version_path ->
  let package = Opam.load Fpath.(version_path / "package.psexp") in
  Inputs.find_files [ "cmi"; "cmt"; "cmti" ] version_path
  |> List.filter (fun f ->
         let segs = Fpath.segs f in
         not (List.mem ".private" segs))
  >>= get_info universe package version_path

let run _whitelist _roots =
  Universe.All.init ();
  let infos =
    Inputs.contents Fpath.(v "prep" / "universes") |> List.sort Fpath.compare
    >>= fun universe_fpath ->
    match Fpath.segs universe_fpath with
    | [ "prep"; "universes"; id ] -> read_universe id
    | _ -> []
  in
  let infos_map =
    List.fold_left
      (fun map info ->
        let before = try StringMap.find info.digest map with _ -> [] in
        StringMap.add info.digest (info :: before)
          (StringMap.remove info.digest map))
      StringMap.empty infos
  in
  total := List.length infos;
  let _ = List.iter (compile_fragment infos_map) infos in
  let _ = compile_stamps () in
  let oc = open_out "Makefile.gen" in
  PH.iter
    (fun (pkg, universe) frag ->
      let poc = open_out (makefile_of_package pkg universe) in
      List.iter (fun l -> Printf.fprintf poc "%s\n" l) frag;
      close_out poc;
      let pdeps =
        try PH.find package_deps (pkg, universe)
        with Not_found -> PandUSet.empty
      in
      let pdeps = PandUSet.remove (pkg, universe) pdeps in
      let pdeps =
        PandUSet.fold
          (fun (pkg, universe) acc -> stamp_of_package pkg universe :: acc)
          pdeps []
      in
      Printf.fprintf oc "%s : %s\n"
        (stamp_of_package pkg universe)
        (String.concat " " pdeps);
      Printf.fprintf oc "\tmake -f %s %s\n"
        (makefile_of_package pkg universe)
        (stamp_of_package pkg universe);
      Printf.fprintf oc "compile : %s\n" (stamp_of_package pkg universe))
    fragments;
  close_out oc;

  let oc = open_out "Makefile.link" in
  let links = link_fragment () in
  List.iter (fun line -> Printf.fprintf oc "%s\n" line) links;
  close_out oc;

  let oc = open_out "Makefile.mlds" in
  let lines = parent_mld_fragment infos in
  List.iter (fun line -> Printf.fprintf oc "%s\n" line) lines;
  close_out oc;
  ignore infos;
  ()
