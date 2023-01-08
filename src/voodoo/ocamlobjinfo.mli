val process : Fpath.t list -> (string * string list) list
val find : string * string * string -> (Fpath.t list, [> Rresult.R.msg ]) result
