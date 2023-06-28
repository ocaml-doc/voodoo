val switch : string option ref
(** [switch] returns the local opam switch name. *)

val find : Package.t -> (Fpath.t, [> Bos_setup.R.msg ]) Bos_setup.result
(** [find p] returns the path to the [opam] file of package [p], in the prepped
    directory of [p]. *)
