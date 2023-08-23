type compile_dep = { c_unit_name : string; c_digest : string }
(** The name and optional digest of a dependency. Modules compiled with
    [--no-alias-deps] don't have digests for purely aliased modules. *)

type link_dep = {
  l_package : string;
  l_name : string;
  l_digest : string;
  l_version : string;
  l_universe : string option;
}

val pp_link_dep : Format.formatter -> link_dep -> unit
val compile_deps : Fpath.t -> (string * string * compile_dep list) option

type child =
  | CModule of string  (** module name, e.g. 'String' *)
  | CPage of string  (** page name, e.g. 'packages' *)
  | CSrc of string (* 'src' *)

val compile :
  ?parent:string ->
  ?output:Fpath.t ->
  ?source:Fpath.t * Fpath.t ->
  Fpath.t ->
  includes:Fpath.set ->
  children:child list ->
  unit
(** [compile p ?parent ?output ~includes ~children] runs [odoc compile] on path
    [p]. *)

val source_tree :
  parent:string -> Fpath.t -> includes:Fpath.t -> output:Fpath.t -> unit
(** [source_tree ~parent p ~includes ~output] runs [odoc source-tree] on path
    [p]. *)

val link : Fpath.t -> includes:Fpath.set -> output:Fpath.t -> unit
(** [link p ~includes ~output] runs [odoc link] on path [p]. *)

val html : Fpath.t -> output:Fpath.t -> unit
(** [html p ~output] runs [odoc html-generate] on path [p]. *)

val html_gen_source : Fpath.t -> output:string -> root:Fpath.t -> unit
