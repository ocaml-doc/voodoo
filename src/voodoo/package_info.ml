let gen ~output ~libraries =
  let libraries =
        libraries
        |> List.map (fun { Library_names.Without_dune.name; modules; _ } ->
               {
                 Voodoo_serialize.Package_info.Library.name;
                 modules;
                 dependencies = [];
               })
  in

  let output = Fpath.(to_string (output / "package.json")) in
  Yojson.Safe.to_file output
    (Voodoo_serialize.Package_info.to_yojson Voodoo_serialize.String_.to_yojson
       { libraries })
