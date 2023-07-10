type t = { package : Package.t; path : Fpath.t }

val marshal : t -> unit
(** Serialize. *)

val pp : t Fmt.t
val findlib : unit -> (Fpath.t * string) list

val ext : string
(** [.jscma] file extension. *)

val server_path : t -> Fpath.t

val func_name : t -> string
(** [func_name t] changes the name of the name of the cma filename to a valid
    function name.

    - [.] are replaced with [_dot_]
    - [-] are replaced with [_dash_]. *)

val process : Fpath.t -> (unit, Bos_setup.R.msg) Bos_setup.result
(** [process path] deserializes the cma file located at [path], then runs
    [js_of_ocaml] on it. *)
