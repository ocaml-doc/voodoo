type t = { universe_id : string; name : string; version : string }

let path ty p = Fpath.(ty / "universes" / p.universe_id / p.name / p.version)
let prep_path = path Paths.prep
let jsoo_path = path Paths.jsoo
let pp fmt t = Format.fprintf fmt "(%s,%s,%s)" t.universe_id t.name t.version

let compare x y =
  let xs = Format.asprintf "%a" pp x in
  let ys = Format.asprintf "%a" pp y in
  String.compare xs ys
