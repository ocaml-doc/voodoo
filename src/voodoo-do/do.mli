open Voodoo

module InputSelect : sig
  val order : Fpath.t -> int
  val select : Sourceinfo.t list -> Index.t
end

module IncludePaths : sig
  val get : Index.t -> Sourceinfo.t -> Fpath.set
  val link : Index.t -> Fpath.set
end

val get_source_info : Mld.t -> Fpath.t -> Sourceinfo.t list
val package_info_of_fpath : Fpath.t -> string * string * string
val find_universe_and_version : string -> (string * string) option
val run : string -> bool -> bool -> unit
val run_all : unit -> unit
