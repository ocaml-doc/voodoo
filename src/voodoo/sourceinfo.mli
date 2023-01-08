type t = {
  package : Package.t;
  path : Fpath.t;
  name : string;
  digest : string;
  parent : Mld.t;
  deps : Odoc.compile_dep list;
}

val compile_dir : t -> Fpath.t
val output_file : t -> Fpath.t
val output_odocl : t -> Fpath.t
val is_hidden : t -> bool
