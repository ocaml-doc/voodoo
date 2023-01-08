type universe_id = string
type package_name = string
type package_version = string
type t = universe_id * package_name * package_version

val prep_path : string * string * string -> Fpath.t
val name : t -> package_name
