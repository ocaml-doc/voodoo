module M : sig
  include module type of Map.Make (String)
end

type t = { intern : Sourceinfo.t M.t; extern : Fpath.t M.t }

val empty : t
val find_opt : M.key -> t -> Sourceinfo.t option
val find_extern_opt : M.key -> t -> Fpath.t option
val write : t -> Mld.t -> unit
val read : Fpath.t -> t
val combine : t -> t -> t
val of_source_infos : Sourceinfo.t list -> t
