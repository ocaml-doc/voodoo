type package = { name : string; version : string }

module S : sig
  include module type of Set.Make (struct
    type t = package

    let compare x y = compare x y
  end)
end

val opam : Bos.Cmd.t
val switch : string option ref
val of_string : string -> package option
val get_switch : unit -> string
val pp_package : Format.formatter -> package -> unit
val dependencies : package -> package list
val lib : unit -> string
val prefix : unit -> string
val deps_of_opam_result : string -> package list
val all_opam_packages : unit -> package list
val pkg_contents : string -> Fpath.t list
val opam_file : string -> string -> string list option
val bind : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
val join : (('a, 'b) result, 'b) result -> ('a, 'b) result
val ( >>= ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
val process_file : Fpath.t -> (OpamFile.OPAM.t, 'a) result
val find : Package.t -> (Fpath.t, [> Rresult.R.msg ]) result
