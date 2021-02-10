type t
(** Mutable data-structure storing dependencies. The main feature is {!rename}. *)

val create : unit -> t

val add : t -> Fpath.t -> Fpath.t list -> unit
(** Incrementally add dependencies [deps] to [target]. Paths are internally
    normalized. *)

val rename : t -> Fpath.t -> dst:Fpath.t -> unit
(** Rename a record and every records for which [src] is a prefix. Paths are
    internally normalized. *)

val fold : (Fpath.t -> Fpath.t list -> 'a -> 'a) -> t -> 'a -> 'a
