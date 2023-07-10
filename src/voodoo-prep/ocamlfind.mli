val cmd : Bos.Cmd.t
val list : unit -> string list
val cma_of_package : string -> Fpath.t option

val stdlib_path : unit -> Fpath.t
(** [stdlib_path ()] returns the path to the stdlib [lib/ocaml/]. *)

val include_paths : string -> string list
val js_files : string -> (Fpath.t list, Bos_setup.R.msg) Bos_setup.result
val dep_cmas : string -> Fpath.t list
