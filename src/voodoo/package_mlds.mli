val find : Package.t -> Fpath.t list * Fpath.t list
val compile : Mld.t -> Fpath.t list -> Mld.t list
val include_paths : Mld.t list -> Fpath.set
