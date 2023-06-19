val find : string * string * string -> Fpath.t list * Fpath.t list
val compile : 'a -> Mld.t -> Fpath.t list -> Mld.t list
val include_paths : Mld.t list -> Fpath.set
