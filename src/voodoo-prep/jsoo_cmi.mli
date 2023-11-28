module StringSet : Set.S with type elt = string

type t = { package : Package.t; path : Fpath.t }

val pp : t Fmt.t
val compare : t -> t -> int
val to_yojson : t -> Yojson.Safe.t

val stdlib : Package.t list -> (t list, Bos_setup.R.msg) Bos_setup.result
(** [stdlib pkgs] returns the [*.cmi] files from the stdlib. The cmi files are
    linked to the [ocaml-base-compiler] package found among [pkgs]. *)

val copy : StringSet.t -> t list -> unit
(** [copy universes cmis] copies [cmis] files whose [universe_id] is included in
    [universes] from [prep/] to [jsoo/]. *)
