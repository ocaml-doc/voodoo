type t = Fpath.t

val prep : t
(** [prep] is the root directory where the prepped packages are stored.

    Warning: it needs to stay in sync with [src/voodoo/paths.ml] *)

val jsoo : t
(** [jsoo] is the root directory where the toplevel files are stored. *)
