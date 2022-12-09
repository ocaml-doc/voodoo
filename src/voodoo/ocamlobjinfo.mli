(** Module that provides functions for processing and querying information about
    OCaml libraries and their units. *)

val bind : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
(** [bind r f] is a monadic bind operation for the 'a result type. It applies
    the function [f] to the value contained in [r] if [r] is an [Ok] value,
    otherwise it returns the [Error] value contained in [r]. *)

val ( >>= ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
(** An infix version of [bind] that allows for chaining operations on result
    values. *)

val process_one : Fpath.t -> string * string list
(** [process_one file] processes a single [.cma] file and returns a tuple
    containing the library name and a list of unit names.

    {4 Examples}

    {[
      process_one (Fpath.v "foo.ocamlobjinfo")
      - : string * string list = ("foo", ["Foo"; "Foo.Bar"])
    ]} *)

val process : Fpath.t list -> (string * string list) list
(** [process packages] processes a list of ocamlobjinfo files and returns an
    'Ok' value containing a list of tuples with the library name and a list of
    unit names, or an 'Error' value if there was an error processing any of the
    files.

    {4 Examples}

    {[
      process ["foo.ocamlobjinfo"; "bar.ocamlobjinfo"]
      - : (string * string list) list result =
      Ok [("foo", ["Foo"; "Foo.Bar"]); ("bar", ["Bar"; "Bar.Baz"])]
    ]} *)

val find : string * string * string -> (Fpath.t list, [> Rresult.R.msg ]) result
(** [find package] searches for [.ocamlobjinfo] files in the directory specified
    by [package], where [package] is a tuple of strings containing the universe,
    package, and version information. *)
