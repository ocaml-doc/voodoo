let gen ~output ~(dune : Dune.t option) ~libraries =
  let dune_modules = function
    | Dune.Library.Singleton m -> [ m ]
    | Unwrapped { modules; _ } -> modules
    | Wrapped { main_module_name; _ } -> [ main_module_name ]
  in
  let libraries =
    match dune with
    | None ->
        libraries
        |> List.map (fun { Ocamlobjinfo.library_name; units } ->
               {
                 Voodoo_serialize.Package_info.Library.name = library_name;
                 modules = units;
                 dependencies = [];
               })
    | Some { libraries; _ } ->
        List.map
          (fun (v : Dune.Library.t) ->
            {
              Voodoo_serialize.Package_info.Library.name = v.name;
              modules = dune_modules v.ty;
              dependencies = v.dependencies;
            })
          libraries
  in

  let output = Fpath.(to_string (output / "package.json")) in
  Yojson.Safe.to_file output
    (Voodoo_serialize.Package_info.to_yojson Voodoo_serialize.String_.to_yojson
       { libraries })
