type universe_id = string
and package_name = string
and package_version = string
and t = universe_id * package_name * package_version

val prep_path : t -> Fpath.t
val name : t -> package_name
