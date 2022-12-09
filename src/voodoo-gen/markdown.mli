val read_org :
  Fpath.t ->
  Odoc_document.Url.Path.t ->
  (Odoc_document.Types.Page.t, [> Rresult.R.msg ]) result

val read_md :
  Fpath.t ->
  Odoc_document.Url.Path.t ->
  (Odoc_document.Types.Page.t, [> Rresult.R.msg ]) result

val read_plain :
  Fpath.t ->
  Odoc_document.Url.Path.t ->
  (Odoc_document.Types.Page.t, [> Rresult.R.msg ]) result
