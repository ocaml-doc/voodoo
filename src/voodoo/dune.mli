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

val ( >>= ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
val process_file : Fpath.t -> (t, [> `Msg of string ]) result
val find : Package.t -> (Fpath.t, [> Rresult.R.msg ]) result
