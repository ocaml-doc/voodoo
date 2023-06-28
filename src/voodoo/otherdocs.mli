val copy :
  Mld.t -> Fpath.t list -> Fpath.t option -> Fpath.t list * Fpath.t option
(** [copy version docs opam_file] copies the other docs [docs] and [opam_file]
    into the [version] directory, returns paths to the successfully copied
    files. *)
