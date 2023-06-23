open Voodoo_serialize.Package_info

module Kind = struct
  include Kind

  let kind = Alcotest.testable pp equal

  let test k =
    let test_name = Format.asprintf "%a" pp k in
    ( test_name,
      `Quick,
      fun () ->
        let expected = k in
        let got = of_yojson @@ to_yojson @@ k in
        Alcotest.(check kind) test_name got expected )

  let inputs =
    [
      `Module;
      `Page;
      `LeafPage;
      `ModuleType;
      `Parameter 1;
      `Class;
      `ClassType;
      `File;
    ]

  let suite = ("Package_info.Kind", List.map test inputs)
end

module Module = struct
  include Module

  let module_ = Alcotest.testable pp equal

  let test k =
    let test_name = Format.asprintf "%a" pp k in
    ( test_name,
      `Quick,
      fun () ->
        let expected = k in
        let got = of_yojson @@ to_yojson @@ k in
        Alcotest.(check module_) test_name got expected )

  let inputs =
    [
      { name = ""; submodules = []; kind = `Module };
      {
        name = "foo";
        submodules = [ { name = "bar"; submodules = []; kind = `Class } ];
        kind = `Page;
      };
    ]

  let suite = ("Package_info.Module", List.map test inputs)
end

module Library = struct
  include Library

  let library = Alcotest.testable (pp Module.pp) (equal Module.equal)

  let test k =
    let test_name = Format.asprintf "%a" (pp Module.pp) k in
    ( test_name,
      `Quick,
      fun () ->
        let expected = k in
        let got =
          of_yojson Module.of_yojson @@ to_yojson Module.to_yojson @@ k
        in
        Alcotest.(check library) test_name got expected )

  let inputs =
    [
      { name = ""; modules = []; dependencies = [] };
      { name = "foo"; modules = Module.inputs; dependencies = [ "bar" ] };
    ]

  let suite = ("Package_info.Library", List.map test inputs)
end

let package_info = Alcotest.testable (pp Module.pp) (equal Module.equal)

let test x =
  let test_name = Format.asprintf "%a" (pp Module.pp) x in
  ( test_name,
    `Quick,
    fun () ->
      let expected = x in
      let got = of_yojson Module.of_yojson @@ to_yojson Module.to_yojson @@ x in
      Alcotest.(check package_info) test_name got expected )

let inputs = [ { libraries = [] }; { libraries = Library.inputs } ]
let suite = ("Package_info", List.map test inputs)
