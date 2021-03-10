(* Generate the Makefile.<package>.link files *)

open Listm

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

let filter_by_package all_files package =
  let name =
    let n_str = Astring.String.cuts ~sep:"-" package in
    String.concat "_" n_str
  in
  List.filter
    (fun file ->
      match Fpath.(segs (normalize file)) with
      | "compile" :: "universes" :: _universe :: pkg :: _version :: _ :: _
        when pkg = name ->
          true
      | "compile" :: "packages" :: pkg :: _version :: _ :: _ when pkg = name ->
          true
      | _ -> false)
    all_files

let filter_by_version all_files version =
  List.filter
    (fun file ->
      match Fpath.(segs (normalize file)) with
      | "compile" :: "universes" :: _universe :: _pkg :: version' :: _ :: _
        when version = version' ->
          true
      | "compile" :: "packages" :: _pkg :: version' :: _ :: _
        when version = version' ->
          true
      | _ -> false)
    all_files

let filter_by_universe all_files universe =
  List.filter
    (fun file ->
      match Fpath.(segs (normalize file)) with
      | "compile" :: "universes" :: universe' :: _pkg :: _version :: _ :: _
        when Some universe' = universe ->
          true
      | "compile" :: "packages" :: _pkg :: _version' :: _ :: _
        when universe = None ->
          true
      | _ -> false)
    all_files

let get_dir f = fst (Fpath.split_base f)

let paths_of_package all_files (package, version, universe) =
  let package_files = filter_by_universe all_files universe in
  let package_files = filter_by_package package_files package in
  let package_files = filter_by_version package_files version in
  let dirs = List.map get_dir package_files in
  setify dirs

module M = Map.Make (String)

type files = { dirs : Fpath.t list; files : Fpath.t list }

type versions = { versions : files M.t (* Indexed by version *) }

type packages = { packages : versions M.t (* Indexed by package name *) }

type all = {
  universed : packages M.t;
  (* Indexed by universe *)
  non_universed : packages;
}

let empty_all = { universed = M.empty; non_universed = { packages = M.empty } }

let empty_packages = { packages = M.empty }

let empty_versions = { versions = M.empty }

let empty_files = { dirs = []; files = [] }

let run _toppath package =
  (* Find all odoc files, result is list of Fpath.t with no extension *)
  let all_files = Inputs.find_files [ "odoc" ] Fpath.(v "compile") in

  let sorted = List.sort Fpath.compare all_files in

  let u_of f =
    let _, file = Fpath.split_base f in
    if Astring.String.is_prefix ~affix:"page-" (Fpath.to_string file) then None
    else
      let segs = Fpath.segs f in
      match segs with
      | "compile" :: "universes" :: u :: pkg :: version :: _ ->
          Some (Some u, pkg, version, f)
      | "compile" :: "packages" :: pkg :: version :: _ ->
          Some (None, pkg, version, f)
      | _ -> None
  in

  let all =
    List.fold_right
      (fun x acc -> match u_of x with Some y -> y :: acc | None -> acc)
      sorted []
  in

  let h =
    let rec inner all packages versions files fs =
      let update_files f =
        let dir = fst @@ Fpath.split_base f in
        if List.mem dir files.dirs then { files with files = f :: files.files }
        else { files = f :: files.files; dirs = dir :: files.dirs }
      in
      let update_versions v f =
        let files = update_files f in
        { versions = M.add v files versions.versions }
      in
      let update_packages p v f =
        let versions = update_versions v f in
        { packages = M.add p versions packages.packages }
      in
      let update_universe u p v f =
        let packages = update_packages p v f in
        match u with
        | None -> { all with non_universed = packages }
        | Some u -> { all with universed = M.add u packages all.universed }
      in
      match fs with
      | [ (u, p, v, f) ] -> update_universe u p v f
      | (u, p, v, f) :: ((u2, _, _, _) as xx) :: rest when u <> u2 ->
          let all = update_universe u p v f in
          inner all empty_packages empty_versions empty_files (xx :: rest)
      | (_, p, v, f) :: ((_, p2, _, _) as xx) :: rest when p <> p2 ->
          let packages = update_packages p v f in
          inner all packages empty_versions empty_files (xx :: rest)
      | (_, _, v, f) :: ((_, _, v2, _) as xx) :: rest when v <> v2 ->
          let versions = update_versions v f in
          inner all packages versions empty_files (xx :: rest)
      | (_, _, _, f) :: rest ->
          let files = update_files f in
          inner all packages versions files rest
      | [] -> empty_all
    in
    inner empty_all empty_packages empty_versions empty_files all
  in

  let package_makefile = Printf.sprintf "Makefile.%s.link" package in

  let oc = open_out package_makefile in

  let all_versions =
    M.fold
      (fun _ p acc ->
        try M.find package p.packages :: acc with Not_found -> acc)
      h.universed
      (try [ M.find package h.non_universed.packages ] with Not_found -> [])
  in

  let _ =
    all_versions
    |> List.iter (fun versions ->
           versions.versions
           |> M.iter (fun _version files ->
                  let pkg_files = files.files in
                  (* get rid of hidden files *)
                  let files =
                    pkg_files >>= filter (fun f -> not (is_hidden f))
                  in

                  Format.eprintf "Files under consideration: %d %a\n%!"
                    (List.length files)
                    (Format.pp_print_list Fpath.pp)
                    files;

                  (* Find the set of directories that contain all of the files *)
                  let dirs =
                    Fpath.Set.of_list
                      (List.map (fun f -> fst (Fpath.split_base f)) pkg_files)
                  in

                  Format.eprintf "Dirs under consideration: %d\n%!"
                    (Fpath.Set.cardinal dirs);

                  (* For each directory, use odoc to find the union of the set of packages each odoc file requires *)
                  let odoc_deps =
                    Fpath.Set.fold
                      (fun dir acc ->
                        Fpath.Map.add dir (Odoc.link_deps dir) acc)
                      dirs Fpath.Map.empty
                  in

                  Format.eprintf "odoc_deps: %a\n%!"
                    (Fpath.Map.pp (fun fmt (path, packages) ->
                         Format.fprintf fmt "@[<v>dir: %a@,[@[<v>%a@]]@]"
                           Fpath.pp path
                           (Format.pp_print_list ~pp_sep:Format.pp_print_cut
                              Odoc.pp_link_dep)
                           packages))
                    odoc_deps;

                  let iterfn file =
                    Format.eprintf "handling file: %a\n%!" Fpath.pp file;
                    (* The directory containing the odoc file *)
                    let dir = fst (Fpath.split_base file) in

                    (* Find the corresponding entry in the map of package dependencies odoc has calculated *)
                    let deps =
                      match Fpath.Map.find dir odoc_deps with
                      | Some x -> x
                      | None -> failwith "odoc_deps"
                    in

                    (* Extract the packages and remove duplicates *)
                    let dep_packages =
                      setify
                      @@ List.map
                           (fun dep ->
                             (dep.Odoc.l_package, dep.l_version, dep.l_universe))
                           deps
                    in

                    Format.eprintf "dep packages: [%s]\n%!"
                      (String.concat ","
                         (List.map
                            (fun (p, v, u) ->
                              Printf.sprintf "%s %s %s" p v
                                (match u with
                                | Some u -> Printf.sprintf "(%s)" u
                                | None -> ""))
                            dep_packages));
                    (* Find the directories that contain these packages - note the mapping of package ->
                       directory is one-to-many *)
                    let dirs =
                      setify @@ dep_packages >>= fun (p, v, u_opt) ->
                      let versions =
                        match u_opt with
                        | None -> (M.find p h.non_universed.packages).versions
                        | Some u ->
                            (M.find p (M.find u h.universed).packages).versions
                      in
                      (M.find v versions).dirs
                    in
                    let output_file =
                      match Fpath.segs file with
                      | "compile" :: rest ->
                          Fpath.(v (String.concat dir_sep ("link" :: rest)))
                      | path :: _ ->
                          Format.eprintf
                            "odoc file unexpectedly found in path %s\n%!" path;
                          exit 1
                      | _ ->
                          Format.eprintf
                            "Something odd happening with the odoc paths\n%!";
                          exit 1
                    in
                    let str =
                      Format.asprintf
                        "%a.odocl : %a.odoc\n\
                         \t@odoc link %a.odoc -o %a.odocl %s\n\
                         link: %a.odocl\n\
                         %!"
                        Fpath.pp output_file Fpath.pp file Fpath.pp file
                        Fpath.pp output_file
                        (String.concat " "
                           (List.map
                              (fun dir -> Format.asprintf "-I %a" Fpath.pp dir)
                              (dir :: dirs)))
                        Fpath.pp output_file
                    in

                    Printf.fprintf oc "%s" str
                  in
                  List.iter iterfn files))
  in
  close_out oc
