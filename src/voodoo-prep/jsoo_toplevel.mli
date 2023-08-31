type t = {
  package : Package.t;
  cma_fpath : Fpath.t;
  dep_cmas : Jsoo_cma.t list;
  cmis : Jsoo_cmi.t list;
  js_files : Fpath.t list;
}

val pp : t Fmt.t

val copy_js_files : Fpath.t -> t -> unit
(** [copy_js_files root t] copies the [*.js] files from the [root/lib] directory
    into [prep/voodoo_js_files]. *)

val marshal : t -> unit
(** Serialize. *)

val meta_ext : string
(** [.jstop] file extension. *)

val process : Fpath.t -> t
(** [process path] deserializes the toplevel file located at [path], then runs
    [js_of_ocaml] on it. *)

val to_yojson : t -> Yojson.Safe.t
