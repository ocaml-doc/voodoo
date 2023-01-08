type 'a library = {
  name : string;
  modules : 'a list;
  dependencies : string list option;
}
[@@deriving yojson]

type 'a t = { libraries : 'a library list } [@@deriving yojson]

val gen :
  output:Fpath.t ->
  dune:Dune.t option ->
  libraries:(string * string list) list ->
  unit ->
  unit
