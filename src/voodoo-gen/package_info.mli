val gen :
  input:Fpath.t -> output:Fpath.t -> Odoc_document.Types.Page.t list -> unit
(** [gen ~input ~output paths] reads a [packags.json] located at [input] and
    generates a new [package.json] located at [output] describing the same
    package and using [paths] to add children information. *)
