(* Universe.ml *)

(* A universe is a set of packages at specific versions *)
module T = struct
  type t = Opam.package 
  let compare x y =
    match String.compare x.Opam.name y.Opam.name with
    | 0 -> String.compare x.version y.version
    | n -> n
  
  let equal x y =
    String.equal x.Opam.name y.Opam.name && String.equal x.version y.version

  let hash x =
    Hashtbl.hash (x.Opam.name, x.version)
end

module S = Set.Make(T)
module M = Map.Make(struct type t = string let compare x y = String.compare x y end)
module StrHtbl = Hashtbl.Make(struct type t = string let equal x y = String.equal x y let hash x = Hashtbl.hash x end)

type t = {
  id : Digest.t;
  packages : string M.t
}

  
let to_sexp v =
  let open Sexplib.Sexp in
  let ps = M.fold (fun name version cur -> 
    (List [ Atom name; Atom version ]) :: cur) v.packages [] in
  List [
    List [ Atom v.id ];
    List ps
  ]

let pp fmt v =
  Sexplib.Sexp.pp_hum fmt (to_sexp v)
let compare x1 x2 = String.compare x1.id x2.id

let of_string str =
  let sexp = Sexplib.Sexp.of_string str in
  let id, packs_s = match sexp with
  | List [
    List [ Atom id ];
    List packs_s ] -> id, packs_s
  | _ -> failwith "bad sexp"
  in
  let packs = List.fold_left (fun acc pkg -> match pkg with | Sexplib.Sexp.List [ Atom name; Atom version ] -> M.add name version acc | _ -> failwith "bad sexp") M.empty packs_s in
  { id; packages = packs }

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

let digest packages =
  let s = M.to_seq packages in
  let str = Seq.fold_left (fun acc (n,v) -> Format.asprintf "%s\n%s.%s" acc n v) "" s in
  Digest.to_hex (Digest.string str)

let of_packages packages =
  let id = digest packages in
  { id; packages }

let add u pkg =
  let packages = M.add pkg.Opam.name pkg.version u.packages in
  let id = digest packages in
  { id; packages }

let package_version universe name =
  M.find_opt name universe.packages
  
(* Hashtbl of all package dependencies - maps from a package to a set of dependencies calculated
   via the transitive closure of all direct dependencies *)
module H = Hashtbl.Make(T)
let dependencies = H.create 111

let rec calc_deps package =
  if H.mem dependencies package
  then H.find dependencies package
  else begin
    let deps = Opam.dependencies package in
    let init = List.fold_left (fun acc pkg -> M.add pkg.Opam.name pkg.Opam.version acc) M.empty deps in
    let all_deps = List.fold_left (fun acc dep -> M.union (fun _k v1 v2 -> assert(v1=v2); Some v1) acc (calc_deps dep)) init deps in
    H.add dependencies package all_deps;
    all_deps
  end

module Current = struct
(* Current dependency universes - universes that exist embedded in our current one,
   indexed by the name of the package that depends upon that universe *)

   (* Only useful for a particular switch *)
  let h = StrHtbl.create 111

  let init () =
    let packages = Opam.all_opam_packages () in
    List.iter (fun package ->
      let deps = calc_deps package in
      let u = (package, of_packages deps) in
      StrHtbl.add h package.name u) packages
  
  let dep_universe package =
    if StrHtbl.length h = 0 then ignore (Util.time "Depuniverse.init" init ());
    try StrHtbl.find h package
    with Not_found ->
      Format.eprintf "Package '%s' not found\n%!" package;
      raise Not_found
  
  let save top =
    if StrHtbl.length h = 0 then ignore (Util.time "Depuniverse.init" init ());
    StrHtbl.iter (fun _ (package,u) ->
      Format.eprintf "saving universe %s\n%!" u.id;
      let dir = Fpath.(top / "universes" // v u.id ) in
      Util.mkdir_p dir;
      save Fpath.(dir // v "packages.usexp") u;
      let v_str = Astring.String.cuts ~sep:"." package.Opam.version in
      let v_str = String.concat "_" v_str in  
      let dir = Fpath.(top / "universes" // v u.id // v package.name // v v_str ) in
      Util.mkdir_p dir;
      Opam.save Fpath.(dir // v "package.psexp") package
      ) h;
    ()

  end

module All = struct
  let v = H.create 111
  let us : t StrHtbl.t = StrHtbl.create 111
  let blessed : string H.t = H.create 111

  let add pkg universe =
    match H.find v pkg with
    | exception Not_found ->
      H.replace v pkg [universe]
    | ls ->
      if List.exists (fun u -> M.equal (fun x y -> x = y) universe.packages u.packages) ls
      then ()
      else 
        H.replace v pkg (universe :: ls)

  let find_package_universe u p =
    match H.find_opt v p with
    | Some universes ->
      List.find (fun u' -> u'.id = u) universes
    | None ->
      failwith "bah"

  let find_universe u =
    StrHtbl.find us u

  let is_blessed p u =
    H.find blessed p = u

end

  (* *)
