type t = { universe_id : string; name : string; version : string }

let prep_path p =
  Fpath.(Paths.prep / "universes" / p.universe_id / p.name / p.version)
