type package = { name : string; version : string }

val switch : string option ref
val prefix : unit -> string
val all_opam_packages : unit -> package list
val pkg_contents : string -> Fpath.t list
val opam_file : string -> string -> string list option
