type t = {
  path : Paths.t;
  name : string;
  contents : string list;
  parent : Mld.t;
}

val v : Fpath.t -> string -> Mld.t -> string list -> t
(** [v path name contents parent] builds the source file. *)

val output_file : t -> Fpath.t
(** Path of the [.odoc] file resulting from the compilation. *)

val output_odocl : t -> Fpath.t
(** Path of the [.odocl] file resulting from the linking. *)

val compile : t -> unit
(** [compile src] calls [odoc source-tree] on [src]. *)
