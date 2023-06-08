(* Generate a package.json describing the content of that package *)

type 'a library = {
  name : string;
  modules : 'a list;
  dependencies : string list option;
}
[@@deriving yojson]

type 'a t = { libraries : 'a library list } [@@deriving yojson]

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
  Yojson.Safe.to_file output (yojson_of_t yojson_of_string { libraries })
