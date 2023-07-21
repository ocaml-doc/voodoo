val process : Fpath.t list -> (string * string list) list
val find : Package.t -> (Fpath.t list, [> Bos_setup.R.msg ]) Bos_setup.result
