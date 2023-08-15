val generate_index :
  Odoc_odoc.Fs.directory list -> Fpath.t -> (unit, [ `Msg of string ]) result
(** [generate_index dirs output] reads the [*.odocl] files located in [dirs] and
    generates a JavaScript file [output] describing the contents of the
    [*.odocl] files. *)
