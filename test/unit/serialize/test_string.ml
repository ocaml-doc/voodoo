open Voodoo_serialize.String_

let test str =
  let test_name = Format.sprintf "%S" str in
  ( str,
    `Quick,
    fun () ->
      let expected = str in
      let got = of_yojson @@ to_yojson str in
      Alcotest.(check string) test_name got expected )

let inputs = [ ""; "xx"; "`"; "   "; "  "; "\"" ]
let suite = ("String", List.map test inputs)
