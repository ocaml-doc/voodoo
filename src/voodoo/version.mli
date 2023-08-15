val gen_parent :
  Package.t ->
  blessed:bool ->
  modules:string list ->
  dune:Dune.t option ->
  libraries:Ocamlobjinfo.t list ->
  package_mlds:Fpath.t list ->
  error_log:Error_log.t ->
  failed:bool ->
  Mld.t
(** [gen_parent] generates the content of the version page. *)
