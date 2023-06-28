type t = { library_name : string; units : string list }

val process : Fpath.t list -> t list
(** [process lx] processes the [*.ocamlobjinfo] files [lx]. *)

val find : Package.t -> (Fpath.t list, [> Bos_setup.R.msg ]) Bos_setup.result
(** [find p] looks for the [*.ocamlobjinfo] files in the prepped directory of
    package [p]. *)
