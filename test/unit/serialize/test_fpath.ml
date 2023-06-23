open Voodoo_serialize.Fpath_

let path = Alcotest.testable Fpath.pp Fpath.equal

let test str =
  let test_name = Format.sprintf "%S" str in
  ( str,
    `Quick,
    fun () ->
      let expected = Fpath.v str in
      let got = of_yojson @@ to_yojson @@ Fpath.v str in
      Alcotest.(check path) test_name got expected )

let inputs = [ "/"; "xx"; "`"; "   "; "  "; "\""; "//" ]
let suite = ("Fpath", List.map test inputs)
