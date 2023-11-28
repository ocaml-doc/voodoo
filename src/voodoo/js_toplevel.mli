val find : Package.t -> Fpath.t list
(** [find pkg] returns the path to [*.js] toplevel files. *)

val copy : Fpath.t list -> Fpath.t -> unit
(** [copy files dest] copies the files [files] into directory [dest]. *)
