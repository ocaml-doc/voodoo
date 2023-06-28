(** Map of module digest to source info *)
module M : sig
  include module type of Map.Make (String)
end

type t = { intern : Sourceinfo.t M.t; extern : Fpath.t M.t }

val empty : t
val find_opt : M.key -> t -> Sourceinfo.t option
val find_extern_opt : M.key -> t -> Fpath.t option

val write : t -> Mld.t -> unit
(** [write x parent_mld] writes the index file [x] into
    'packages/<pkg_name>/<version>/index.m' or
    'universes/<universe>/<pkg_name>/<version>/index.m' *)

val read : Fpath.t -> t
val combine : t -> t -> t
val of_source_infos : Sourceinfo.t list -> t
