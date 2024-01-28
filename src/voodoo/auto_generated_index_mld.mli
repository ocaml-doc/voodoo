val gen :
  Package.t ->
  blessed:bool ->
  modules:string list ->
  libraries:Library_names.t ->
  package_mlds:Fpath.t list ->
  error_log:Error_log.t ->
  failed:bool ->
  Mld.t
(** [gen] generates an index.mld file for packages that don't have one. *)
