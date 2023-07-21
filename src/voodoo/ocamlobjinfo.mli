type t = { library_name : string; units : string list }

val process : Fpath.t list -> t list
val find : Package.t -> (Fpath.t list, [> Bos_setup.R.msg ]) Bos_setup.result
