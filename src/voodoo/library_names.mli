module Dune : sig
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

  type t = {
    name : string;
    version : string option;
    libraries : Library.t list;
  }

  val process_file : Fpath.t -> (t, [> `Msg of string ]) Bos_setup.result
  (** [process_file f] processes the [dune-package] file located at [f]. *)

  val find : Package.t -> (Fpath.t, [> Bos_setup.R.msg ]) Bos_setup.result
  (** [find p] returns the path to the [dune-package], if it exists, in the
      prepped directory of package [p]. *)
end

module Without_dune : sig
  type library = {
    name : string;
    archive_name : string;
    mutable modules : string list;
  }

  type t = { libraries : library list }

  val get_libraries : Package.t -> t
  (** [get_libraries p] returns all libraries in the package, including their
      modules. *)
end
