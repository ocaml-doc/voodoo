type t = { package : Package.t; path : Fpath.t }

val to_yojson : t -> Yojson.Safe.t

val marshal : t -> unit
(** Serialize. *)

val pp : t Fmt.t
val findlib : unit -> (Fpath.t * string) list

val ext : string
(** [.jscma] file extension. *)

val process : Fpath.t -> (unit, Bos_setup.R.msg) Bos_setup.result
(** [process path] deserializes the cma file located at [path], then runs
    [js_of_ocaml] on it. *)
