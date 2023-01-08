type package = { name : string; version : string }

val switch : string option ref
val dependencies : package -> package list
val all_opam_packages : unit -> package list
val find : string * string * string -> (Fpath.t, [> Rresult.R.msg ]) result
val lib : unit -> string
val prefix : unit -> string
val pkg_contents : string -> Fpath.t list
val opam_file : string -> string -> string list option
