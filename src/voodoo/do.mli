module InputSelect : sig
  val order : Fpath.t -> int
  (** Given a file path, returns an integer based on the file extension: 0 for
      .cmti, 1 for .cmt, 2 for .cmi, and 3 for anything else. *)

  val select : Sourceinfo.t list -> Index.t
  (** Given a list of Sourceinfo.t values, finds the "best" file for each and
      returns an Index.t of these files. *)
end

module IncludePaths : sig
  val get : Index.t -> Sourceinfo.t -> Fpath.set
  (** Given an Index.t and a Sourceinfo.t value, returns an Fpath.set of the
      include paths for the given source info. *)

  val link : Index.t -> Fpath.set
  (** Given an Index.t, returns an Fpath.set of the include paths for all the
      source info values in the index. *)
end

val get_source_info : Mld.t -> Fpath.t -> Sourceinfo.t list
val package_info_of_fpath : Fpath.t -> string * string * string
val find_universe_and_version : string -> (string * string) option
val run : string -> bool -> bool -> unit
val run_all : unit -> unit
