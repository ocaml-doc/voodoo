val read_org :
  Fpath.t ->
  Odoc_document.Url.Path.t ->
  (Odoc_document.Types.Page.t, [ `Msg of string ]) result
(** [read_org f url] returns the odoc page generated from the org file [f]
    having the url [url]. *)

val read_md :
  Fpath.t ->
  Odoc_document.Url.Path.t ->
  (Odoc_document.Types.Page.t, [ `Msg of string ]) result
(** [read_md f url] returns the odoc page generated from the markdown file [f]
    having the url [url]. *)

val read_plain :
  Fpath.t ->
  Odoc_document.Url.Path.t ->
  (Odoc_document.Types.Page.t, [ `Msg of string ]) result
(** [read_plain f url] returns the odoc page generated from the plain file [f]
    having the url [url]. *)
