type t = {
  path : Fpath.t;
  name : string;
  parent : t option;
  children : Odoc.child list;
}

val pp : t Fmt.t
(** [pp fmt v] pretty-prints the given t value [v] to the given Format.formatter
    [fmt].

    {4 Examples}

    {[
      let v = { path = Fpath.v "foo/bar.mld"; name = "bar"; parent = None; children = [] } in
      Format.asprintf "%a" pp v;
      - : string = "{ path: foo/bar.mld; name: bar; parent: None; children: [] }"
    ]} *)

val output_dir : base:Fpath.t -> t -> Fpath.t
(** [output_dir ~base mld] calculates the output directory for the given t value
    [mld] by starting from the given base directory [base] and appending the
    names of each parent module.

    {4 Examples}

    {[
      let v = {
          path = Fpath.v "foo/bar.mld";
          name = "bar";
          parent = Some {
            path = Fpath.v "foo/baz.mld";
            name = "baz";
            parent = None
            children = []
          };
          children = []
        }
      in
      output_dir ~base:Fpath.v "out" v
      - : Fpath.t = "out/baz/bar"
    ]} *)

val compile_dir : t -> Fpath.t
(** [compile_dir mld] calculates the compile directory for [mld] by calling
    [output_dir] with [Paths.compile] as the base directory. *)

val link_dir : t -> Fpath.t
(** [compile_dir mld] calculates the compile directory for [mld] by calling
    [output_dir] with [Paths.link] as the base directory. *)

val output_file : t -> Fpath.t
(** [output_file mld] calculates the output file path for [mld] by calling
    output_dir with [Paths.compile] as the base directory and appending the file
    name with the [.odoc] extension.

    {4 Examples}

    {[
      let v = { path = Fpath.v "foo/bar.mld"; name = "bar"; parent = None; children = [] }
      output_file v
      - : Fpath.t = "compile/page-bar.odoc"
    ]} *)

val output_odocl : t -> Fpath.t
(** [output_odocl mld] calculates the output path for an [odocl] file for [mld]
    by calling [output_dir] with [Paths.link] as the base directory and
    appending the file name with the [.odocl] extension.

    {4 Examples}

    {[
      let v = { path = Fpath.v "foo/bar.mld"; name = "bar"; parent = None; children = [] }
      output_file v
      - : Fpath.t = "link/page-bar.odocl"
    ]} *)

val compile : t -> unit
(** [compile mld] compiles the given [t] value [mld] into an [odoc] file by
    calling the [Odoc.compile] function with the output file path calculated by
    [output_file] and the list of child modules calculated by traversing [mld]'s
    [children] field.

    If [mld] has a parent, this function will recursively compile the parent
    module as well and pass the compile directory of the parent as an include
    directory to the [Odoc.compile] call.

    This function also deletes any existing output file at the calculated output
    file path before calling [Odoc.compile]. *)

val v : Fpath.t -> string -> t option -> Odoc.child list -> string -> t
(** [v dir name parent children contents] creates a new [t] value from the given
    directory [dir], file name [name], parent [parent], children [children], and
    file contents [contents].

    The function creates the directory [dir] if it does not already exist and
    writes the given [contents] to the file path [dir/name.mld].

    {4 Examples}

    {[
      let dir = Fpath.v "foo"
      let name = "bar"
      let parent = None
      let children = []
      let contents = "some content"
      v dir name parent children contents
      - : t = { path = Fpath.v "foo/bar.mld"; name = "bar"; parent = None; children = [] }
    ]} *)

val of_fpath : t -> Fpath.t -> t
