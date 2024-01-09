val gen :
  output:Fpath.t -> libraries:Library_names.Without_dune.library list -> unit
(** [gen ~output ~dune ~libraries] generates a [package.json] describing the
    content of the package described by the dune file [dune], or the libraries
    [libraries]. *)
