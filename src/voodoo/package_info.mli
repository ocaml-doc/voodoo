val gen :
  output:Fpath.t -> dune:Dune.t option -> libraries:Ocamlobjinfo.t list -> unit
(** [gen ~output ~dune ~libraries] generates a [package.json] describing the
    content of the package described by the dune file [dune], or the libraries
    [libraries]. *)
