(** Module that provides functions for processing and querying information about
    OCaml libraries and their units. *)

val bind : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
(** Takes a result value and a function and applies the function to the result
    value if it is an Ok value, otherwise returns the error value. *)

val ( >>= ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
(** An infix version of [bind] that allows for chaining operations on result
    values. *)

val process_one : Fpath.t -> string * string list
(** Given an Fpath.t, returns a tuple containing the library name and a list of
    unit names from the file at the given path. *)

val process : Fpath.t list -> ((string * string list) list, 'a) result
(** Given a list of Fpath.t values, returns a list of tuples containing the
    library names and unit names for the files at the given paths. *)

val find : string * string * string -> (Fpath.t list, [> Rresult.R.msg ]) result
(** Given a tuple of strings containing the universe, package, and version
    information, returns a list of Fpath.t values for the files with the
    ".ocamlobjinfo" extension in the package's directory. *)
