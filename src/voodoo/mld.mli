type t = {
  path : Fpath.t;
  name : string;
  parent : t option;
  children : Odoc.child list;
}

val pp : t Fmt.t
val output_dir : base:Fpath.t -> t -> Fpath.t

val compile_dir : t -> Fpath.t
(** [compile_dir x] returns the directory containing the files produced by
    running [odoc compile] on [x]. *)

val link_dir : t -> Fpath.t
(** [link_dir x] returns the directory containing the files produced by running
    [odoc link] on [x]. *)

val output_file : t -> Fpath.t
(** [output_file x] returns the path of the [.odoc] file resulting of running
    [odoc compile] on [x]. *)

val output_odocl : t -> Fpath.t
(** [output_odocl x] returns the path of the [.odocl] file resulting of running
    [odoc link] on [x]. *)

val compile : t -> unit
(** [compile x] calls [odoc compile] on [x] and its parents. *)

val v : Fpath.t -> string -> t option -> Odoc.child list -> string -> t
val of_fpath : parent:t -> Fpath.t -> t
