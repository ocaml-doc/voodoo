type t = {
  path : Fpath.t;
  name : string;
  parent : t option;
  children : Odoc.child list;
}

val pp : t Fmt.t
val output_dir : base:Fpath.t -> t -> Fpath.t
val compile_dir : t -> Fpath.t
val link_dir : t -> Fpath.t
val output_file : t -> Fpath.t
val output_odocl : t -> Fpath.t
val compile : t -> unit
val v : Fpath.t -> string -> t option -> Odoc.child list -> string -> t
val of_fpath : t -> Fpath.t -> t
