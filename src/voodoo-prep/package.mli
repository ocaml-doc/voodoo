type t = { universe_id : string; name : string; version : string }

val pp : t Fmt.t
val compare : t -> t -> int

val prep_path : t -> Fpath.t
(** [prep_path p] is the directory where the prepped package [p] is stored.

    Warning: it needs to stay in sync with [src/voodoo/package.ml] *)

val jsoo_path : t -> Fpath.t
(** [jsoo_path p] is the directory where the toplevel files for package [p] are
    stored. *)
