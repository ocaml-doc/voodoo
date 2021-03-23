open Sexplib.Std

type universe_id = string
and package_name = string 
and package_version = string
and package = universe_id * package_name * package_version
[@@deriving sexp]

let prep_path = Fpath.v "prep"

type fpath = Fpath.t
let sexp_of_fpath fp = sexp_of_string (Fpath.to_string fp)
let fpath_of_sexp x = string_of_sexp x |> Fpath.of_string |> Result.get_ok


(** Module digest *)
type digest = Digest.t
let sexp_of_digest = sexp_of_string
let digest_of_sexp = string_of_sexp


(* Dependencies between cmt, cmti and cmi files that are all within this package *)
type intra_dep = { source_file : fpath; intra_deps : digest list }

and deps = {
  modules : (digest, fpath list) Hashtbl.t;
  (** Hashtbl mapping module digest to a list of files (cmti, cmt, cmi) representing that module hash *)

  intra : intra_dep list;
  (** Intra-package dependencies *)

  packages : (package * fpath) list;
  (** string list indicates directories containing required units within that
         package *)
}

and libraries = {
  name : string;
  (* stdlib -- from stdlib.cma *)
  ocamlobjinfo : string;
}

and meta = { package : package; libraries : libraries list; deps : deps }
[@@deriving sexp]



let package_path package =
  let (universe, pkg_name, pkg_version) = package in
  Fpath.(prep_path / "universes" / universe / pkg_name / pkg_version)


let save meta =
  let path = Fpath.(package_path meta.package / "meta.sexp") in
  let (dir, _) = Fpath.split_base path in
  Util.mkdir_p dir;
  let oc = open_out (Fpath.to_string path) in
  let fmt = Format.formatter_of_out_channel oc in    
  Format.fprintf fmt "%a\n%!" Sexplib.Sexp.pp_hum (sexp_of_meta meta);
  close_out oc

let load path =
  let ic = open_in (Fpath.to_string path) in
  let str = Util.lines_of_channel ic |> String.concat "\n" in
  let sexp = Sexplib.Sexp.of_string str in
  meta_of_sexp sexp
