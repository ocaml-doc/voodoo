(* Generate a package.json describing the content of that package *)

type library = {
  name : string;
  modules : string list;
  dependencies : string list option;
}

type info = { libraries : library list }

let library_to_yojson { name; modules; dependencies } =
  let list_string v = `List (List.map (fun m -> `String m) v) in
  let name = ("name", `String name) in
  let modules = ("modules", list_string modules) in
  let dependencies =
    match dependencies with
    | None -> []
    | Some dependencies -> [ ("dependencies", list_string dependencies) ]
  in
  `Assoc (name :: modules :: dependencies)

let info_to_yojson { libraries } =
  `Assoc [ ("libraries", `List (List.map library_to_yojson libraries)) ]

let gen ~output ~(dune : Dune.t option) ~libraries () =
  let dune_modules = function
    | Dune.Library.Singleton m -> [ m ]
    | Unwrapped { modules; _ } -> modules
    | Wrapped { main_module_name; _ } -> [ main_module_name ]
  in
  let libraries =
    match dune with
    | None ->
        libraries
        |> List.map (fun (name, modules) ->
               { name; modules; dependencies = None })
    | Some { libraries; _ } ->
        List.map
          (fun (v : Dune.Library.t) ->
            {
              name = v.name;
              modules = dune_modules v.ty;
              dependencies = Some v.dependencies;
            })
          libraries
  in

  let output = Fpath.(to_string (output / "package.json")) in
  Yojson.Basic.to_file output (info_to_yojson { libraries })
