val copy :
  Mld.t -> Fpath.t list -> Fpath.t option -> Fpath.t list * Fpath.t option
(** [copy version docs opam_file] copies the documentation files and the opam
    file from the package's link directory to a new directory named after the
    package.

    The [version] argument is a record containing the name and version of the
    package. The [docs] argument is a list of file paths to the package's
    documentation files. The [opam_file] argument is an optional file path to
    the package's opam file.

    The function returns a tuple containing the list of file paths to the copied
    documentation files, and the file path to the copied opam file (if it
    exists).

    {4 Examples}

    {[
      let version = { name = "lwt"; version = "2.6.2" } in
      let docs = [ Fpath.v "/path/to/lwt/doc1.txt"; Fpath.v "/path/to/lwt/doc2.txt" ] in
      let opam_file = Some (Fpath.v "/path/to/lwt/lwt.opam") in
      copy version docs opam_file
      - : Fpath.t list * Fpath.t option =
        ([Fpath.v "/path/to/lwt/2.6.2/doc1.txt"; Fpath.v "/path/to/lwt/2.6.2/doc2.txt"],
         Some (Fpath.v "/path/to/lwt/2.6.2/opam.txt"))
    ]} *)
