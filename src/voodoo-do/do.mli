val run : string -> blessed:bool -> failed:bool -> unit
(** [run pkg ~blessed ~failed] runs [odoc compile] and [odoc link] on package
    [pkg]. If [failed] is set, a file named [failed] containing "failed" is also
    generated. *)
