type t = {
  package : Package.t;
  path : Fpath.t;
  name : string;
  digest : string;
  parent : Mld.t;
  deps : Odoc.compile_dep list;
}

val compile_dir : t -> Fpath.t
(** [compile_dir x] returns the directory containing the files produced by
    running [odoc compile] on [x]. *)

val output_file : t -> Fpath.t
(** [output_file x] returns the path of the [.odoc] file resulting of running
    [odoc compile] on [x]. *)

val output_odocl : t -> Fpath.t
(** [output_odocl x] returns the path of the [.odocl] file resulting of running
    [odoc link] on [x]. *)

val is_hidden : t -> bool
