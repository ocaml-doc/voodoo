val is_hidden : string -> bool
val lines_of_channel : in_channel -> string list
val lines_of_process : Bos.Cmd.t -> string list
val mkdir_p : Fpath.t -> unit
val copy : Fpath.t -> Fpath.t -> (unit, [> Rresult.R.msg ]) result
