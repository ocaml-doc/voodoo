module List : sig
  val concat_map : ('a -> 'b list) -> 'a list -> 'b list
  (** [concat_map f l] gives the same result as [List.concat (List.map f l)]. *)

  val find_opt : ('a -> bool) -> 'a list -> 'a option
  (** [find_opt f l] returns the first element of the list [l] that satisfies
      the predicate [f]. Returns [None] if there is no value that satisfies [f]
      in the list [l]. *)
end
