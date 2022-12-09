val opam : Bos.Cmd.t
val switch : string option ref

type package = { name : string; version : string }

val of_string : string -> package option
val get_switch : unit -> string
val pp_package : Format.formatter -> package -> unit

module S : sig
  include module type of Set.Make (struct
    type t = package

    let compare x y = compare x y
  end)
end

val deps_of_opam_result : string -> package list
val dependencies : package -> package list
val all_opam_packages : unit -> package list
val bind : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
val join : (('a, 'b) result, 'b) result -> ('a, 'b) result
val ( >>= ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
val process_file : Fpath.t -> (OpamFile.OPAM.t, 'a) result
val find : string * string * string -> (Fpath.t, [> Rresult.R.msg ]) result
