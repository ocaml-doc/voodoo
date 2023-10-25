val lines_of_channel : in_channel -> string list
(** [lines_of_channel c] returns lines read on channel [c]. *)

val lines_of_process : Bos.Cmd.t -> string list
(** [lines_of_process p] returns lines read from the output of process [p]. *)

val mkdir_p : Fpath.t -> unit
(** [mkdir_p x] recursively creates directory [x] and its parents. *)

val write_file : Fpath.t -> string list -> unit
(** [write_file f lines] writes [lines] into file [f]. *)

val cp : string -> string -> unit
(** [cp src dst] copies [src] to [dst]. *)

module R : sig
  val value : default:'a -> ('a, 'b) result -> 'a
end
