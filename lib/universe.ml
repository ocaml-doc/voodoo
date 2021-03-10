(* Universe.ml *)

(* A universe is a set of packages at specific versions *)
module T = struct
  type t = Opam.package

  let compare x y =
    match String.compare x.Opam.name y.Opam.name with
    | 0 -> String.compare x.version y.version
    | n -> n

  let equal x y =
    String.compare x.Opam.name y.Opam.name = 0
    && String.compare x.version y.version = 0

  let hash x = Hashtbl.hash (x.Opam.name, x.version)
end

module S = Set.Make (T)

module StringHashtbl = Hashtbl.Make (struct
  type t = string

  let equal x y = String.compare x y = 0

  let hash x = Hashtbl.hash x
end)

type t = { id : Digest.t; packages : S.t }

let to_sexp v =
  let open Sexplib.Sexp in
  let ps =
    S.fold
      (fun package cur ->
        List [ Atom package.Opam.name; Atom package.Opam.version ] :: cur)
      v.packages []
  in
  List [ List [ Atom v.id ]; List ps ]

let pp fmt v = Sexplib.Sexp.pp_hum fmt (to_sexp v)

let compare x1 x2 = String.compare x1.id x2.id

let of_string str =
  let sexp = Sexplib.Sexp.of_string str in
  let id, packs_s =
    match sexp with
    | List [ List [ Atom id ]; List packs_s ] -> (id, packs_s)
    | _ -> failwith "bad sexp"
  in
  let packs =
    List.map
      (function
        | Sexplib.Sexp.List [ Atom name; Atom version ] ->
            { Opam.name; version }
        | _ -> failwith "bad sexp")
      packs_s
  in
  { id; packages = S.of_list packs }

let save fname v =
  let oc = open_out (Format.asprintf "%a" Fpath.pp fname) in
  let fmt = Format.formatter_of_out_channel oc in
  Format.fprintf fmt "%a%!" pp v;
  close_out oc

let load fname =
  let ic = open_in (Format.asprintf "%a" Fpath.pp fname) in
  let lines = Util.lines_of_channel ic in
  let str = String.concat "\n" lines in
  close_in ic;
  of_string str

let of_packages packages =
  let s = S.elements packages in
  let str =
    List.fold_left
      (fun acc p -> Format.asprintf "%s\n%a" acc Opam.pp_package p)
      "" s
  in
  let id = Digest.to_hex (Digest.string str) in
  { id; packages }

let package_version universe name =
  S.fold
    (fun pkg acc -> if pkg.Opam.name = name then Some pkg.Opam.version else acc)
    universe.packages None

(* Hashtbl of all package dependencies - maps from a package to a set of dependencies calculated
   via the transitive closure of all direct dependencies *)
module H = Hashtbl.Make (T)

let dependencies = H.create 111

let rec calc_deps package =
  if H.mem dependencies package then H.find dependencies package
  else
    let deps = Opam.dependencies package in
    let init = S.of_list deps in
    let all_deps =
      List.fold_left (fun acc dep -> S.union acc (calc_deps dep)) init deps
    in
    H.add dependencies package all_deps;
    all_deps

module Current = struct
  (* Current dependency universes - universes that exist embedded in our current one,
     indexed by the name of the package that depends upon that universe *)

  (* Only useful for a particular switch *)
  let h = StringHashtbl.create 111

  let init () =
    let packages = Opam.all_opam_packages () in
    List.iter
      (fun package ->
        let deps = calc_deps package in
        let u = (package, of_packages deps) in
        StringHashtbl.add h package.name u)
      packages

  let dep_universe package =
    if StringHashtbl.length h = 0 then
      ignore (Util.time "Depuniverse.init" init ());
    try StringHashtbl.find h package
    with Not_found ->
      Format.eprintf "Package '%s' not found\n%!" package;
      raise Not_found

  let save top =
    if StringHashtbl.length h = 0 then
      ignore (Util.time "Depuniverse.init" init ());
    StringHashtbl.iter
      (fun _ (package, u) ->
        Format.eprintf "saving universe %s\n%!" u.id;
        let dir = Fpath.(top / "universes" // v u.id) in
        Util.mkdir_p dir;
        save Fpath.(dir // v "packages.usexp") u;
        let v_str = Astring.String.cuts ~sep:"." package.Opam.version in
        let v_str = String.concat "_" v_str in
        let dir =
          Fpath.(top / "universes" // v u.id // v package.name // v v_str)
        in
        Util.mkdir_p dir;
        Opam.save Fpath.(dir // v "package.psexp") package)
      h;
    ()
end

module All = struct
  module H = Hashtbl.Make (T)

  let v = H.create 111

  let us = StringHashtbl.create 111

  let blessed = H.create 111

  let init () =
    let inputs = Inputs.find_files [ "usexp" ] Fpath.(v "prep" / "universes") in
    let universes = List.map (fun p -> load Fpath.(add_ext "usexp" p)) inputs in
    List.iter (fun u -> StringHashtbl.add us u.id u) universes;
    let packages =
      Inputs.find_files [ "psexp" ] Fpath.(v "prep" / "universes")
    in
    let read_package path =
      let universe =
        match Fpath.segs path with
        | "prep" :: "universes" :: universe :: _ -> universe
        | _ -> failwith "bad path"
      in
      let package = Opam.load (Fpath.add_ext "psexp" path) in
      let _ =
        match try Some (H.find v package) with _ -> None with
        | None ->
            Format.eprintf "Adding package %a\n%!" Opam.pp_package package;
            H.add v package [ StringHashtbl.find us universe ]
        | Some current ->
            Format.eprintf "Package %a exists in multiple universes! [%s]\n%!"
              Opam.pp_package package
              (String.concat ";"
                 (List.map
                    (fun u -> u.id)
                    (StringHashtbl.find us universe :: current)));
            H.replace v package (StringHashtbl.find us universe :: current)
      in
      let _ =
        match try Some (H.find blessed package) with _ -> None with
        | None -> H.replace blessed package universe
        | Some _ -> ()
      in
      ()
    in
    List.iter read_package packages

  let find_package_universe u p =
    match H.find v p with
    | universes -> List.find (fun u' -> u'.id = u) universes

  let find_universe u = StringHashtbl.find us u

  let is_blessed p u = H.find blessed p = u
end

(* *)
