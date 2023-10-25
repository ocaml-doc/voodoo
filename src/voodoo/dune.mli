module Library : sig
  type wrapped_t = {
    main_module_name : string;
    modules : string list;
    alias_module : string;
  }

  type unwrapped_t = { modules : string list }
  type singleton_t = string

  type wrapping =
    | Wrapped of wrapped_t
    | Unwrapped of unwrapped_t
    | Singleton of singleton_t

  type t = {
    name : singleton_t;
    dependencies : singleton_t list;
    ty : wrapping;
  }
end

type t = { name : string; version : string option; libraries : Library.t list }

val assoc_list :
  Sexplib.Sexp.t ->
  ((string * Sexplib.Sexp.t list) list, [> Bos_setup.R.msg ]) Bos_setup.result

val sexp_of_file :
  Fpath.t -> (Sexplib.Sexp.t, [> Bos_setup.R.msg ]) Bos_setup.result

val process_file : Fpath.t -> (t, [> Bos_setup.R.msg ]) Bos_setup.result
(** [process_file f] processes the [dune-package] file located at [f]. *)

val find : Package.t -> (Fpath.t, [> Bos_setup.R.msg ]) Bos_setup.result
(** [find p] returns the path to the [dune-package], if it exists, in the
    prepped directory of package [p]. *)
