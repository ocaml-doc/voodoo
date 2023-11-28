val run : Fpath.t -> string option -> (unit, Bos_setup.R.msg) Bos_setup.result
(** [run path file] copies [*.js] toplevel files, [*.cmi] and [*.cma] files.
    Write the configurations in [toplevels.json]. *)

val copy_files :
  Fpath.t ->
  (Package.t * Fpath.t list * Fpath.t list) list ->
  (unit, Bos_setup.R.msg) Bos_setup.result
