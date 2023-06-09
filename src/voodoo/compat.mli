module List : sig
  val concat_map : ('a -> 'b list) -> 'a list -> 'b list
  (** [concat_map f l] gives the same result as [List.concat (List.map f l)]. *)
end
