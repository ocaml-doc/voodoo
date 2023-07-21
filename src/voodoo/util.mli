val is_hidden : string -> bool
val lines_of_channel : in_channel -> string list
val lines_of_process : Bos.Cmd.t -> string list
val run_silent : Bos.Cmd.t -> unit
val mkdir_p : Fpath.t -> unit
val copy : Fpath.t -> Fpath.t -> (unit, [> Bos_setup.R.msg ]) Bos_setup.result
