val render :
  output:(Fpath.t -> Odoc_odoc.Fs.File.t) ->
  Fpath.t ->
  (Odoc_document.Types.Page.t list, [ `Msg of string ]) result

val render_other :
  output:(Fpath.t -> Odoc_odoc.Fs.File.t) ->
  parent:Odoc_odoc.Fs.File.t ->
  otherdocs:Fpath.t list ->
  (unit, [ `Msg of string ]) result
