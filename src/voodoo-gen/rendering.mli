val render :
  output:(Fpath.t -> Fpath.t) ->
  Fpath.t ->
  (Odoc_document.Types.Page.t list, [> Odoc_odoc.Or_error.msg ]) result

val render_other :
  output:(Fpath.t -> Fpath.t) ->
  parent:Fpath.t ->
  otherdocs:Fpath.t list ->
  (unit, [> Odoc_odoc.Or_error.msg ]) result
