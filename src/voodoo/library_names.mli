type library = {
  name : string;
  archive_name : string;
  mutable modules : string list;
}

type t = { libraries : library list }

val get_libraries : Package.t -> t
(** [get_libraries p] returns all libraries in the package, including their
    modules. *)
