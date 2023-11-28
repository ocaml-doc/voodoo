val lines_of_channel : in_channel -> string list
(** [lines_of_channel c] returns lines read on channel [c]. *)

val lines_of_process : Bos.Cmd.t -> string list
(** [lines_of_process p] returns lines read from the output of process [p]. *)

val run_silent : Bos.Cmd.t -> unit

val mkdir_p : Fpath.t -> unit
(** [mkdir_p x] recursively creates directory [x] and its parents. *)

val write_file : Fpath.t -> string list -> unit
(** [write_file f lines] writes [lines] into file [f]. *)

val cp : Fpath.t -> Fpath.t -> unit
(** [cp src dst] copies [src] to [dst]. *)

val mv : Fpath.t -> Fpath.t -> unit
(** [mv src dst] moves [src] to [dst]. *)

val file_exists : Fpath.t -> bool

module O : sig
  val to_result : none:'e -> 'a option -> ('a, 'e) Bos_setup.result
end

module R : sig
  val combine_list :
    ('a, 'e) Bos_setup.result list -> ('a list, 'e) Bos_setup.result
  (** [combine_list lx] returns a single result from a list of results. *)

  val iter_list :
    f:('a -> (unit, 'e) Bos_setup.result) ->
    'a list ->
    (unit, 'e) Bos_setup.result
  (** [iter_list ~f lx] applies [f] to every element of [lx] and returns the
      result. *)
end
