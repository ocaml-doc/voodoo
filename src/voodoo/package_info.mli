val gen :
  output:Fpath.t ->
  dune:Dune.t option ->
  libraries:(string * string list) list ->
  unit ->
  unit
