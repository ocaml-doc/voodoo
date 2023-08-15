type t = string list option

val find : Package.t -> t
(** [find p] returns the contents of the [opam.err.log] file, if it exists,
    located in the prepped directory of package [p]. *)
