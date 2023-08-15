val find : Package.t -> Fpath.t list * Fpath.t list
(** [find p] returns the list of [.mld] pages and other pages from the [doc/]
    directory in the prepped directory of package [p]. *)

val compile : parent:Mld.t -> Fpath.t list -> Mld.t list
(** [compile ~parent mlds] calls [odoc compile] on each mld file of [mlds]. *)

val include_paths : Mld.t list -> Fpath.set
(** [include_paths mlds] returns the paths of the parents of each mld file of
    [mlds]. *)
