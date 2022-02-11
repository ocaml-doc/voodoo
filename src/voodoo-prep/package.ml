type universe_id = string
and package_name = string
and package_version = string
and t = universe_id * package_name * package_version

let prep_path package =
  let universe, pkg_name, pkg_version = package in
  Fpath.(Paths.prep / "universes" / universe / pkg_name / pkg_version)
