type t = Fpath.t

val compile : Fpath.t
(** [compile] is the root directory where the results of [odoc compile] are
    stored. *)

val prep : Fpath.t
(** [prep] is the root directory where the prepped packages are stored.

    Warning: it needs to stay in sync with [src/voodoo-prep/paths.ml] *)

val link : Fpath.t
(** [link] is the root directory where the results of [odoc link] are stored. *)
