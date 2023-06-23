module Result = Stdlib.Result

type kind =
  [ `Module
  | `Page
  | `LeafPage
  | `ModuleType
  | `Parameter of int
  | `Class
  | `ClassType
  | `File ]
[@@deriving yojson]

type modul = { name : string; submodules : modul list; kind : kind }
[@@deriving yojson]

module StringMap = Map.Make (String)

let info_of_paths ~(info : string Voodoo_lib.Package_info.t) paths =
  let children = ref StringMap.empty in
  let kind = ref StringMap.empty in
  let path_to_string v =
    let remove_prefix = function
      | "p" :: _p :: _v :: "doc" :: v -> v
      | "u" :: _u :: _p :: _v :: "doc" :: v -> v
      | v -> v
    in
    v |> Odoc_document.Url.Path.to_list |> List.map snd |> remove_prefix
    |> String.concat "."
  in
  List.iter
    (fun (page : Odoc_document.Types.Page.t) ->
      let path = page.url in
      kind := StringMap.add (path_to_string path) path.kind !kind;
      Option.iter
        (fun (parent : Odoc_document.Url.Path.t) ->
          children :=
            StringMap.update (path_to_string parent)
              (function
                | None -> Some [ path.name ] | Some v -> Some (path.name :: v))
              !children)
        path.parent)
    paths;
  let rec get_tree root =
    let children =
      StringMap.find_opt root !children |> Option.value ~default:[]
    in
    let kind = StringMap.find root !kind in
    let submodules = List.map (fun c -> get_tree (root ^ "." ^ c)) children in
    let name =
      List.fold_left (fun _ -> Fun.id) root (String.split_on_char '.' root)
    in
    { name; kind; submodules }
  in
  List.map
    (fun { Voodoo_lib.Package_info.name; modules; dependencies } ->
      let modules =
        List.filter_map
          (fun t -> try Some (get_tree t) with Not_found -> None)
          modules
      in
      { Voodoo_lib.Package_info.name; modules; dependencies })
    info.libraries

let gen ~input ~output paths =
  let input = Fpath.(parent input / "package.json" |> to_string) in
  let info =
    Voodoo_lib.Package_info.t_of_yojson string_of_yojson
      (Yojson.Safe.from_file input)
  in
  let libraries = info_of_paths ~info paths in
  let _ = Bos.OS.Dir.create output |> Result.get_ok in
  let output = Fpath.(to_string (output / "package.json")) in
  Yojson.Safe.to_file output
    (Voodoo_lib.Package_info.yojson_of_t yojson_of_modul { libraries })
