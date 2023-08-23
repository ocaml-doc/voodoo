type t = { universe : string; name : string; version : string }

let prep_path p =
  Fpath.(Paths.prep / "universes" / p.universe / p.name / p.version)

let src_path p =
  Fpath.(Paths.prep / "universes" / p.universe / p.name / p.version / "src")
