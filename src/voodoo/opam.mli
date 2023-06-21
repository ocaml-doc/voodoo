type package = { name : string; version : string }

val switch : string option ref
val dependencies : package -> package list
val all_opam_packages : unit -> package list
val find : Package.t -> (Fpath.t, [> Rresult.R.msg ]) result
