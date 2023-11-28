type package = { name : string; version : string }
(** Equivalent of type [Package.t] when the universe is not yet known. *)

val switch : string option ref
(** [switch] returns the local opam switch name. *)

val prefix : unit -> string
(** [prefix ()] returns the root directory of the local opam switch. *)

val all_opam_packages : unit -> package list
(** [all_opam_packages ()] returns the list of installed packages. *)

val pkg_contents : Package.t -> Fpath.t list
(** [pkg_contents p] returns the list of files installed by package [p]. *)

val opam_file : Package.t -> string list option
(** [opam_file p] returns the contents of the opam file of package [p]. *)

val exec : unit -> Bos.Cmd.t
