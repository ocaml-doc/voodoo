type t = { universe : string; name : string; version : string }

let prep_path p =
  Fpath.(Paths.prep / "universes" / p.universe / p.name / p.version)

let of_path p =
  match Fpath.segs p with
  | "prep" :: "universes" :: universe :: name :: version :: _ ->
      Ok { universe; name; version }
  | _ ->
      Error
        (`Msg
          (Format.asprintf "Could not determine package for path: %a" Fpath.pp p))
