val process : Fpath.t list -> (string * string list) list
val find : Package.t -> (Fpath.t list, [> Rresult.R.msg ]) result
