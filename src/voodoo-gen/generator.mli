open Odoc_document

val render : indent:bool -> Types.Page.t -> Renderer.page

val doc :
  xref_base_uri:string ->
  Types.Block.t ->
  Html_types.flow5_without_sectioning_heading_header_footer Tyxml.Html.elt list
