open Voodoo_serialize.Status

module Otherdocs = struct
  include Otherdocs

  let otherdocs = Alcotest.testable pp equal

  let test k =
    let test_name = Format.asprintf "%a" pp k in
    ( test_name,
      `Quick,
      fun () ->
        let expected = k in
        let got = of_yojson @@ to_yojson @@ k in
        Alcotest.(check otherdocs) test_name got expected )

  let dummy =
    {
      readme = [ Fpath.v "/a" ];
      license = [ Fpath.v "/b" ];
      changes = [ Fpath.v "/c" ];
      others = [ Fpath.v "/d" ];
    }

  let inputs = [ empty; dummy ]
  let suite = ("Status.Otherdocs", List.map test inputs)
end

let status = Alcotest.testable pp equal

let test x =
  let test_name = Format.asprintf "%a" pp x in
  ( test_name,
    `Quick,
    fun () ->
      let expected = x in
      let got = of_yojson @@ to_yojson @@ x in
      Alcotest.(check status) test_name got expected )

let inputs =
  [
    { failed = true; universe = "0"; otherdocs = Otherdocs.empty };
    { failed = false; universe = "1"; otherdocs = Otherdocs.dummy };
  ]

let suite = ("Status", List.map test inputs)
