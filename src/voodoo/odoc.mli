type compile_dep = { c_unit_name : string; c_digest : string }

type link_dep = {
  l_package : string;
  l_name : string;
  l_digest : string;
  l_version : string;
  l_universe : string option;
}

val pp_link_dep : Format.formatter -> link_dep -> unit
val compile_deps : Fpath.t -> (string * string * compile_dep list) option

type child = CModule of string | CPage of string

val compile :
  ?parent:string ->
  ?output:Fpath.t ->
  Fpath.t ->
  includes:Fpath.set ->
  children:child list ->
  string list

val link : Fpath.t -> includes:Fpath.set -> output:Fpath.t -> string list
val html : Fpath.t -> Fpath.t -> unit
