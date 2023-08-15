val render :
  output:(Fpath.t -> Odoc_odoc.Fs.File.t) ->
  Fpath.t ->
  (Odoc_document.Types.Page.t list, [ `Msg of string ]) result
(** [render ~output f] renders the [.odocl] file [f] as html by running
    [odoc html-generate]. [output] determines the output path from the input
    path. *)

val render_other :
  output:(Fpath.t -> Odoc_odoc.Fs.File.t) ->
  parent:Odoc_odoc.Fs.File.t ->
  otherdocs:Fpath.t list ->
  (unit, [ `Msg of string ]) result
(** [render_other ~output ~parent ~otherdocs] renders the documents [otherdocs]
    as html. [parent] is used to get the path to the document. [output]
    determines the output path from the input path. *)
