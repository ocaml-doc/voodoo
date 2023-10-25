module M : module type of Map.Make (Fpath)

type t = {
  installed : Fpath.t M.t;
      (* Map from install location to source-tree location.
         For the above, contains a binding mapping [either/either__Either_intf.cmt]
         to [src/.either.objs/byte/either__Either_intf.cmt] *)
  src : Fpath.t M.t;
      (* Map from build tree location to ml file. For the above, contains
         a binding mapping [src/.either.objs/byte/either__Either_intf.cmt]
         to [src/either_intf.ml] *)
}

val read : Fpath.t -> t
val ml_of_cmt : t -> Fpath.t -> Fpath.t option
