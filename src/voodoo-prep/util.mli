val lines_of_channel : in_channel -> string list
val lines_of_process : Bos.Cmd.t -> string list
val mkdir_p : Fpath.t -> unit
val write_file : Fpath.t -> string list -> unit
val cp : string -> string -> unit
