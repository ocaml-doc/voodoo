Generate the base documentation

  $ voodoo-prep
  Warning: No universes have been specified: will generate dummy universes
  $ voodoo-do -p base -b
  Got dune
  Found 1 mld pages and 3 other pages
  compile command: odoc compile ./p.mld -o compile/page-p.odoc --child
                     page-"base"
  compile command: odoc compile ./base.mld -o compile/p/page-base.odoc --parent
                     "p" -I compile --child page-"v0.15.1"
  File "./base.mld", line 2, characters 18-19:
  Warning: Child label is not allowed in the last component of a reference path.
  Suggestion: 'child-1' should be first.
  compile command: odoc compile ./v0.15.1.mld -o
                     compile/p/base/page-v0.15.1.odoc --parent "base" -I
                     compile/p --child page-"doc"
  compile command: odoc compile ./doc.mld -o
                     compile/p/base/v0.15.1/page-doc.odoc --parent "v0.15.1" -I
                     compile/p/base --child module-base__ --child
                     module-base__Invariant --child module-base__Error --child
                     module-base__Either_intf --child module-base__Int0 --child
                     module-base__Random_repr --child module-base__List0
                     --child module-base__Sign0 --child
                     module-base__Hashable_intf --child module-base__Hasher
                     --child module-base__Int_intf --child
                     module-base__Floatable --child
                     module-base__Sexp_with_comparable --child
                     module-base__Uchar0 --child module-base__Hash_set_intf
                     --child module-base__List1 --child module-base__Monad_intf
                     --child module-base__Stack --child
                     module-base__Comparable_intf --child
                     module-base__Source_code_position --child module-base
                     --child module-base__Nothing --child module-base__Char
                     --child module-base__Binary_searchable_intf --child
                     module-base__Queue_intf --child module-base__Float0
                     --child module-base__Either0 --child
                     module-base__Ordered_collection_common --child
                     module-base__Uniform_array --child module-base__Variant
                     --child module-base__Array_permute --child
                     module-base__Linked_queue0 --child module-base__String
                     --child module-base__Invariant_intf --child
                     module-base__Applicative_intf --child
                     module-base__Info_intf --child module-base__Lazy --child
                     module-base__Binary_searchable --child module-base__Set
                     --child module-base__Import0 --child module-base__Bytes0
                     --child module-base__Int64 --child module-base__Staged
                     --child module-base__Sequence --child
                     module-base__Set_intf --child module-base__Option --child
                     module-base__Hash_set --child module-base__Backtrace
                     --child module-base__Buffer_intf --child
                     module-base__Int_conversions --child
                     module-base__Blit_intf --child module-base__Sexpable
                     --child module-base__Source_code_position0 --child
                     module-base__Stack_intf --child module-base__Intable
                     --child module-base__Hashtbl_intf --child
                     module-base__Variantslib --child module-base__Int_math
                     --child module-base__Indexed_container_intf --child
                     module-base__Sys0 --child module-base__Type_equal --child
                     module-base__Identifiable --child module-base__Maybe_bound
                     --child module-base__Array0 --child module-base__Random
                     --child module-base__Nativeint --child
                     module-base__Pretty_printer --child
                     module-base__Container_intf --child module-base__Or_error
                     --child module-base__Bytes --child module-base__Sexp
                     --child module-base__Word_size --child module-base__Ref
                     --child module-base__Avltree --child
                     module-base__Stringable --child module-base__Container
                     --child module-base__String0 --child
                     module-base__Sign_or_nan --child module-base__Either
                     --child module-base__Applicative --child module-base__Exn
                     --child module-base__Map --child module-base__Ppx_hash_lib
                     --child module-base__Popcount --child
                     module-base__Linked_queue --child module-base__Bool
                     --child module-base__Result --child
                     module-base__Comparable --child module-base__Blit --child
                     module-base__Bytes_tr --child module-base__Equal --child
                     module-base__Char0 --child module-base__Hashtbl --child
                     module-base__Fieldslib --child module-base__Float --child
                     module-base__Option_array --child module-base__Comparator
                     --child module-base__Buffer --child module-base__Array
                     --child module-base__Int32 --child
                     module-base__Binary_search --child
                     module-base__Indexed_container --child
                     module-base__Pow_overflow_bounds --child
                     module-base__Formatter --child module-base__Ordering
                     --child module-base__Hashable --child
                     module-base__Ppx_compare_lib --child module-base__Monad
                     --child module-base__Printf --child
                     module-base__With_return --child module-base__Int63
                     --child module-base__Ordered_collection_common0 --child
                     module-base__Info --child module-base__Sys --child
                     module-base__Hex_lexer --child module-base__Map_intf
                     --child module-base__Hash_intf --child module-base__Uchar
                     --child module-base__List --child module-base__Queue
                     --child module-base__Poly0 --child module-base__Hash
                     --child module-base__Int --child module-base__Int63_emul
                     --child module-base__Identifiable_intf --child
                     module-base__Sign --child module-base__Obj_array --child
                     module-base__Import --child module-base__Field --child
                     module-base__T --child module-base__Ppx_enumerate_lib
                     --child module-base__Comparisons --child module-base__Fn
                     --child module-base__Unit --child
                     module-base_internalhash_types --child
                     module-shadow_stdlib --child module-caml --child
                     module-md5_lib
  File "./doc.mld", line 2, characters 0-8:
  Warning: '{0': heading level should be lower than top heading level '0'.
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__.odoc
                     --parent "doc" -I compile/p/base/v0.15.1
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/shadow_stdlib/shadow_stdlib.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/Shadow_stdlib.odoc
                     --parent "doc" -I compile/p/base/v0.15.1
  File "shadow-stdlib/src/shadow_stdlib.mli", line 535, character 0 to line 539, character 47:
  Warning: Alert deprecated not expected here.
  File "shadow-stdlib/src/shadow_stdlib.mli", line 635, character 0 to line 637, character 35:
  Warning: Alert deprecated not expected here.
  File "shadow-stdlib/src/shadow_stdlib.mli", line 640, character 0 to line 642, character 36:
  Warning: Alert deprecated not expected here.
  File "shadow-stdlib/src/shadow_stdlib.mli", line 761, character 0 to line 765, character 49:
  Warning: Alert deprecated not expected here.
  File "shadow-stdlib/src/shadow_stdlib.mli", line 961, character 0 to line 965, character 43:
  Warning: Alert deprecated not expected here.
  File "shadow-stdlib/src/shadow_stdlib.mli", line 996, character 0 to line 998, character 25:
  Warning: Alert deprecated not expected here.
  File "shadow-stdlib/src/shadow_stdlib.mli", line 1001, character 0 to line 1005, character 47:
  Warning: Alert deprecated not expected here.
  File "shadow-stdlib/src/shadow_stdlib.mli", line 1008, character 0 to line 1012, character 47:
  Warning: Alert deprecated not expected here.
  File "shadow-stdlib/src/shadow_stdlib.mli", line 1015, character 0 to line 1019, character 46:
  Warning: Alert deprecated not expected here.
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/caml/caml.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/Caml.odoc
                     --parent "doc" -I compile/p/base/v0.15.1
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base_internalhash_types/base_internalhash_types.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/Base_internalhash_types.odoc
                     --parent "doc" -I compile/p/base/v0.15.1
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Poly0.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Poly0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Import0.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Import0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hash_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hash_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hash.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hash.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Ppx_hash_lib.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Ppx_hash_lib.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sexp.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sexp.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Ppx_compare_lib.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Ppx_compare_lib.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Import.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Import.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Monad_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Monad_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Monad.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Monad.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Printf.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Printf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/printf.mli", line 113, characters 4-43:
  Warning: '6': bad heading level (0-5 allowed).
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sys0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sys0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Bytes0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Bytes0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Comparator.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Comparator.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Field.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Field.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Formatter.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Formatter.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__String0.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__String0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Source_code_position0.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Source_code_position0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Lazy.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Lazy.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Invariant_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Invariant_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Info_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Info_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Info.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Info.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hex_lexer.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hex_lexer.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Comparisons.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Comparisons.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Floatable.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Floatable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Applicative_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Applicative_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Applicative.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Applicative.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sign0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sign0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Either0.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Either0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Result.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Result.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Error.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Error.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Invariant.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Invariant.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Or_error.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Or_error.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Comparable_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Comparable_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Comparable.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Comparable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hashable_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hashable_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hashable.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hashable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Stringable.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Stringable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Pretty_printer.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Pretty_printer.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Identifiable_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Identifiable_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Identifiable.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Identifiable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Intable.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Intable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int64.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int64.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/int64.mli", line 68, characters 11-18:
  Warning: 'modtype' is deprecated, use 'module-type' instead.
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Equal.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Equal.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Ordering.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Ordering.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Blit_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Blit_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Blit.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Blit.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Ordered_collection_common0.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Ordered_collection_common0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printexc ce1d04478ff0e3403b8c05aa790a9f79
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Exn.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Exn.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sexp_with_comparable.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sexp_with_comparable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Source_code_position.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Source_code_position.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Ppx_enumerate_lib.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Ppx_enumerate_lib.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Char.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Char.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Bytes_tr.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Bytes_tr.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int32.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int32.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/int32.mli", line 48, characters 11-18:
  Warning: 'modtype' is deprecated, use 'module-type' instead.
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int_conversions.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int_conversions.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Variantslib.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Variantslib.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Container_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Container_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Container.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Container.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Stack_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Stack_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Unit.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Unit.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__T.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__T.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Indexed_container_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Indexed_container_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Indexed_container.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Indexed_container.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Staged.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Staged.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__String.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__String.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sign.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sign.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sign_or_nan.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sign_or_nan.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sexpable.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sexpable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sequence.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sequence.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Ref.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Ref.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Random.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Random.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/random.mli", line 23, characters 4-23:
  Warning: '6': bad heading level (0-5 allowed).
  File "src/random.mli", line 41, characters 53-67:
  Warning: '@before' should begin on its own line.
  File "src/random.mli", line 87, characters 4-26:
  Warning: '6': bad heading level (0-5 allowed).
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Option.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Option.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Nativeint.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Nativeint.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/nativeint.mli", line 27, characters 11-18:
  Warning: 'modtype' is deprecated, use 'module-type' instead.
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__List.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__List.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int63_emul.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int63_emul.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int63.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int63.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/int63.mli", line 58, characters 11-18:
  Warning: 'modtype' is deprecated, use 'module-type' instead.
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Float.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Float.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/float.mli", line 301, characters 4-52:
  Warning: '6': bad heading level (0-5 allowed).
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Bytes.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Bytes.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Bool.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Bool.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Binary_searchable_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Binary_searchable_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Binary_searchable.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Binary_searchable.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printexc ce1d04478ff0e3403b8c05aa790a9f79
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Backtrace.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Backtrace.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Array.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Array.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Printexc ce1d04478ff0e3403b8c05aa790a9f79
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile prep/universes/7/base/v0.15.1/lib/base/base.cmt
                     -o compile/p/base/v0.15.1/v0.15.1/lib/base/Base.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__ArrayLabels 9339f43d84ccaf20c589fc6964fd4658
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Array0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Array0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__With_return.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__With_return.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Either_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Either_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Either.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Either.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hashtbl_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hashtbl_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hashtbl.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hashtbl.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hash_set_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hash_set_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Ordered_collection_common.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Ordered_collection_common.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/md5/md5_lib.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/md5/Md5_lib.odoc
                     --parent "doc" -I compile/p/base/v0.15.1
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hasher.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hasher.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Random 3f2ddc04bb28ff1050c0c8d7cf5a8d57
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Lazy ca3d5c326131437daef18ae34e7f4aa9
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Complex d5f041ccbe9783af90ca38337002fb4e
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Bigarray 55a812d9a3c89e7a8ebb917e63e4beea
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalLazy 2c797917c31a980b79e9d16d84057b70
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Random_repr.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Random_repr.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Uchar0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Uchar0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Uchar.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Uchar.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Int_math.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Int_math.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Uniform_array.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Uniform_array.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Binary_search.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Binary_search.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Pow_overflow_bounds.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Pow_overflow_bounds.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Option_array.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Option_array.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Buffer_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Buffer_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Buffer.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Buffer.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Queue_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Queue_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Fieldslib.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Fieldslib.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__List0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__List0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__List1.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__List1.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Nothing.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Nothing.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Maybe_bound.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Maybe_bound.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Float 609c17e2e32fc58995201e5342ac2ce4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Float0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Float0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Map_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Map_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/map_intf.ml", line 2179, characters 2-68:
  Warning: Alert deprecated not expected here.
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Set_intf.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Set_intf.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  File "src/set_intf.ml", line 1024, characters 2-68:
  Warning: Alert deprecated not expected here.
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Queue 7c394795afe79287e9401b5c6c36e64d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Linked_queue.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Linked_queue.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__ArrayLabels 9339f43d84ccaf20c589fc6964fd4658
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Array_permute.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Array_permute.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Fn.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Fn.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Set.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Set.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Char 71d01c936f35204d25fbdc2a38153066
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Char0.cmt -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Char0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Popcount.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Popcount.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Type_equal.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Type_equal.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Avltree.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Avltree.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Variant.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Variant.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Map.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Map.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Sys.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Sys.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Word_size.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Word_size.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Hash_set.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Hash_set.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Obj_array.cmti
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Obj_array.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Queue 7c394795afe79287e9401b5c6c36e64d
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Linked_queue0.cmt
                     -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Linked_queue0.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Stack.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Stack.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_error 3bc3ae46e5f4c0d9b288a2e6dfeb0040
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexpable 42224f0375c087da1ae0b6996e56d761
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Int32 1db604c2106f996ea47a572773a5ff7f
  Missing dependency: Stdlib__Int64 7ab3f2ace09cfcc67be8a7133d18f0e2
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__MoreLabels 842db5d3b6f466cc5efc37f07c8ab1ba
  Missing dependency: Stdlib__Nativeint 627e6e1768175d0dea895dfbcbc11457
  Missing dependency: Stdlib__Obj 85655eceec5bcd6c7c4ef5dd6758b19d
  Missing dependency: Stdlib__Printf 8debea255efc834da5c1bc2e73f09214
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  compile command: odoc compile
                     prep/universes/7/base/v0.15.1/lib/base/base__Queue.cmti -o
                     compile/p/base/v0.15.1/v0.15.1/lib/base/Base__Queue.odoc
                     --parent "doc" -I compile/p/base/v0.15.1 -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/base_internalhash_types/
                     -I compile/p/base/v0.15.1/v0.15.1/lib/base/caml/ -I
                     compile/p/base/v0.15.1/v0.15.1/lib/base/shadow_stdlib/
  package mlds: [prep/universes/7/base/v0.15.1/doc/base/odoc-pages/index.mld]
  File "src/monad_intf.ml", line 143, characters 18-22:
  Warning: While resolving the expansion of include at File "src/sequence.mli", line 463, character 2
  Failed to resolve reference unresolvedroot(S) Couldn't find "S"
  File "src/monad_intf.ml", line 143, characters 18-22:
  Warning: Failed to resolve reference unresolvedroot(S) Couldn't find "S"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/monad_intf.ml", line 149, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 129, character 4
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/monad_intf.ml", line 148, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 143, characters 18-22:
  Warning: While resolving the expansion of include at File "src/result.mli", line 35, character 0
  Failed to resolve reference unresolvedroot(S) Couldn't find "S"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/result.mli", line 35, character 0
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/result.mli", line 35, character 0
  While resolving the expansion of include at File "src/monad_intf.ml", line 149, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 129, character 4
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/result.mli", line 35, character 0
  While resolving the expansion of include at File "src/monad_intf.ml", line 148, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/random.mli", line 84, characters 30-37:
  Warning: Reference to 'char' is ambiguous. Please specify its kind: type-char, val-char.
  File "src/random.mli", line 81, characters 30-37:
  Warning: Reference to 'char' is ambiguous. Please specify its kind: type-char, val-char.
  File "src/list.mli", line 74, characters 59-76:
  Warning: Failed to resolve reference unresolvedroot(ListLabels).map Parent_sig: Unresolved module path unresolvedroot(Stdlib).ListLabels (Parent_module: Lookup failure (root module): Stdlib)
  File "src/monad_intf.ml", line 143, characters 18-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  Failed to resolve reference unresolvedroot(S) Couldn't find "S"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 149, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 129, character 4
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 148, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 143, characters 18-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  Failed to resolve reference unresolvedroot(S) Couldn't find "S"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 149, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 129, character 4
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 148, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 143, characters 18-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  Failed to resolve reference unresolvedroot(S) Couldn't find "S"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 149, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 129, character 4
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/either.mli", line 1, character 0
  While resolving the expansion of include at File "src/either_intf.ml", line 15, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 148, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/bytes.mli", line 216, characters 17-38:
  Warning: Failed to resolve reference unresolvedroot(Marshal).from_bytes Parent_sig: Unresolved module path unresolvedroot(Stdlib).Marshal (Parent_module: Lookup failure (root module): Stdlib)
  File "src/binary_search.mli", line 6, characters 4-60:
  Warning: Failed to resolve reference unresolvedroot(Base).Binary_searchable_intf Couldn't find "Binary_searchable_intf"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/applicative.mli", line 1, character 0
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/applicative.mli", line 1, character 0
  While resolving the expansion of include at File "src/monad_intf.ml", line 149, character 2
  While resolving the expansion of include at File "src/monad_intf.ml", line 129, character 4
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "src/monad_intf.ml", line 114, characters 14-22:
  Warning: While resolving the expansion of include at File "src/applicative.mli", line 1, character 0
  While resolving the expansion of include at File "src/monad_intf.ml", line 148, character 2
  Failed to resolve reference unresolvedroot(Infix) Couldn't find "Infix"
  File "./doc.mld", line 24, characters 5-12:
  Warning: Failed to resolve reference unresolvedroot(Core) Couldn't find "Core"
  File "./doc.mld", line 17, characters 0-24:
  Warning: Failed to resolve reference unresolvedroot(Stdio) Parent_module: Lookup failure (root module): Stdio
  3 other files to copy
  dst: linked/p/base/v0.15.1/doc/opam
  dst: linked/p/base/v0.15.1/doc/LICENSE.md
  dst: linked/p/base/v0.15.1/doc/CHANGES.md
  dst: linked/p/base/v0.15.1/doc/README.org
  dest: linked/p/base/v0.15.1/doc/LICENSE.md
  dest: linked/p/base/v0.15.1/doc/CHANGES.md
  dest: linked/p/base/v0.15.1/doc/README.org
  dest: linked/p/base/v0.15.1/doc/README.md
  Warning, resolved hidden path: Base__.Hash_set_intf.M_sexp_grammar
  Warning, resolved hidden path: Base__.Hash_set_intf.M_sexp_grammar
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t
  $ voodoo-gen -o output
  0 other versons, 1 packages
  Found 6 files
  Warning, resolved hidden path: Base__.Hash_set_intf.M_sexp_grammar
  Warning, resolved hidden path: Base__.Hash_set_intf.M_sexp_grammar
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t
  Warning, resolved hidden path: Base__.Either0.t

Generates a status.json file
  $ cat output/p/base/v0.15.1/status.json
  "Built"

Converted the README.org file in markdown
  $ ls output/p/base/v0.15.1/
  CHANGES.md.html.json
  LICENSE.md.html.json
  README.md.html.json
  README.org.html.json
  doc
  package.json
  package.json.html.json
  status.json

Generate a README.md file with the tables formatted in HTML
  $ cat output/p/base/v0.15.1/README.md.html.json
  {"uses_katex":false,"breadcrumbs":[{"name":"p","href":"../../","kind":"page"},{"name":"base","href":"../","kind":"page"},{"name":"v0.15.1","href":"","kind":"page"},{"name":"README.md","href":"#","kind":"leaf-page"}],"toc":[],"preamble":"<h2>Base</h2>","content":"<p><a href=\"https://github.com/janestreet/base/actions\"></a></p><p>Base is a standard library for OCaml. It provides a standard set of general purpose modules that are well-tested, performant, and fully-portable across any environment that can run OCaml code. Unlike other standard library projects, Base is meant to be used as a wholesale replacement of the standard library distributed with the OCaml compiler. In particular it makes different choices and doesn't re-export features that are not fully portable such as I/O, which are left to other libraries.</p><p>You also might want to browse the <a href=\"https://ocaml.janestreet.com/ocaml-core/latest/doc/base/index.html\">API Documentation</a>.</p><h3>Installation</h3><p>Install Base via <a href=\"https://opam.ocaml.org\">OPAM</a>:</p><pre class=\"language-markdown\"><code>$ opam install base\u000A</code></pre><p>Base has no runtime dependencies and is fast to build. Its sole build dependencies are <a href=\"https://github.com/ocaml/dune\">dune</a>, which itself requires nothing more than the compiler, and <a href=\"https://github.com/janestreet/sexplib0\">sexplib0</a>.</p><h3>Using the OCaml standard library with Base</h3><p>Base is intended as a full stdlib replacement. As a result, after an <code>open Base</code>, all the modules, values, types, ... coming from the OCaml standard library that one normally gets in the default environment are deprecated.</p><p>In order to access these values, one must use the <code>Caml</code> library, which re-exports them all through the toplevel name <code>Caml</code>: <code>Caml.String</code>, <code>Caml.print_string</code>, ...</p><h3>Differences between Base and the OCaml standard library</h3><p>Programmers who are used to the OCaml standard library should read through this section to understand major differences between the two libraries that one should be aware of when switching to Base.</p><h4>Comparison operators</h4><p>The comparison operators exposed by the OCaml standard library are polymorphic:</p><pre class=\"language-markdown\"><code>val compare : 'a -&gt; 'a -&gt; int\u000Aval ( &lt;= ) : 'a -&gt; 'a -&gt; bool\u000A...\u000A</code></pre><p>What they implement is structural comparison of the runtime representation of values. Since these are often error-prone, i.e. they don't correspond to what the user expects, they are not exposed directly by Base.</p><p>To use polymorphic comparison with Base, one should use the <code>Poly</code> module. The default comparison operators exposed by Base are the integer ones, just like the default arithmetic operators are the integer ones.</p><p>The recommended way to compare arbitrary complex data structures is to use the specific <code>compare</code> functions. For instance:</p><pre class=\"language-markdown\"><code>List.compare String.compare x y\u000A</code></pre><p>The <a href=\"https://github.com/janestreet/ppx_compare\">ppx~compare~</a> rewriter offers an alternative way to write this:</p><pre class=\"language-markdown\"><code>[%compare: string list] x y\u000A</code></pre><h3>Base and ppx code generators</h3><p>Base uses a few ppx code generators to implement:</p><ul><li><p>reliable and customizable comparison of OCaml values</p></li><li><p>reliable and customizable hash of OCaml values</p></li><li><p>conversions between OCaml values and s-expression</p></li></ul><p>However, it doesn't need these code generators to build. What it does instead is use ppx as a code verification tool during development. It works in a very similar fashion to <a href=\"https://github.com/janestreet/ppx_expect\">expectation tests</a>.</p><p>Whenever you see this in the code source:</p><pre class=\"language-markdown\"><code>type t = ... [@@deriving_inline sexp_of]\u000Alet sexp_of_t = ...\u000A[@@@end]\u000A</code></pre><p>the code between the <code>[@@deriving_inline]</code> and the <code>[@@@end]</code> is generated code. The generated code is currently quite big and hard to read, however we are working on making it look like human-written code.</p><p>You can put the following elisp code in your <code>~/.emacs</code> file to hide these blocks:</p><pre class=\"language-markdown\"><code>(defun deriving-inline-forward-sexp (&amp;optional arg)\u000A  (search-forward-regexp &quot;\\\\[@@@end\\\\]&quot;) nil nil arg)\u000A\u000A(defun setup-hide-deriving-inline ()\u000A  (inline)\u000A  (hs-minor-mode t)\u000A  (let ((hs-hide-comments-when-hiding-all nil))\u000A    (hs-hide-all)))\u000A\u000A(require 'hideshow)\u000A(add-to-list 'hs-special-modes-alist\u000A             '(tuareg-mode &quot;\\\\[@@deriving_inline[^]]*\\\\]&quot; &quot;\\\\[@@@end\\\\]&quot; nil\u000A                           deriving-inline-forward-sexp nil))\u000A(add-hook 'tuareg-mode-hook 'setup-hide-deriving-inline)\u000A</code></pre><p>Things are not yet setup in the git repository to make it convenient to change types and update the generated code, but they will be setup soon.</p><h3>OCaml Version Support</h3><p>Base will maintain compatibility with the latest OCaml release, and the three prior minor version releases. Because of this, there will be a lag of four minor versions before features introduced in the Stdlib will reach Base.</p><h3>Base coding rules</h3><p>There are a few coding rules across the code base that are enforced by lint tools.</p><p>These rules are:</p><ul><li><p>Opening the <code>Caml</code> module is not allowed. Inside Base, the OCaml stdlib is shadowed and accessible through the <code>Caml</code> module. We forbid opening <code>Caml</code> so that we know exactly where things come from.</p></li><li><p><code>Caml.Foo</code> modules cannot be aliased, one must use <code>Caml.Foo</code> explicitly. This is to avoid having to remember a list of aliases at the beginning of each file.</p></li><li><p>For some modules that are both in the OCaml stdlib and Base, such as <code>String</code>, we define a module <code>String0</code> for common functions that cannot be defined directly in <code>Base.String</code> to avoid creating a circular dependency. Except for <code>String</code> itself, other modules are not allowed to use <code>Caml.String</code> and must use either <code>String</code> or <code>String0</code> instead.</p></li><li><p>Indentation is exactly the one of <code>ocp-indent</code>.</p></li><li><p>A few other coding style rules enforced by <a href=\"https://github.com/janestreet/ppx_js_style\">ppx~jsstyle~</a>.</p></li></ul><p>The Base specific coding rules are checked by <code>ppx_base_lint</code>, in the <code>lint</code> subfolder. The indentation rules are checked by a wrapper around <code>ocp-indent</code> and the coding style rules are checked by <code>ppx_js_style</code>.</p><p>These checks are currently not run by <code>dune</code>, but it will soon get a <code>-dev</code> flag to run them automatically.</p><h3>Sexp (de-)serializers</h3><p>Most types in Base have <code>sexp_of_t</code> and <code>t_of_sexp</code> functions for converting between values of that type and their sexp representations.</p><p>One pair of functions deserves special attention: <code>String.sexp_of_t</code> and <code>String.t_of_sexp</code>. These functions have the same types as <code>Sexp.of_string</code> and <code>Sexp.to_string</code> but very different behavior.</p><p><code>String.sexp_of_t</code> and <code>String.t_of_sexp</code> are used to encode and decode strings &quot;embedded&quot; in a sexp representation. On the other hand, <code>Sexp.of_string</code> and <code>Sexp.to_string</code> are used to encode and decode the textual form of s-expressions.</p><p>The following example demonstrates the two pairs of functions in action:</p><pre class=\"language-markdown\"><code>open! Base\u000Aopen! Stdio\u000A\u000A(* Embed a string in a sexp *)\u000A\u000Alet example_sexp : Sexp.t = List.sexp_of_t String.sexp_of_t [ &quot;hello&quot;; &quot;world&quot; ]\u000A\u000Alet () =\u000A  assert (Sexp.equal example_sexp (Sexp.List [ Sexp.Atom &quot;hello&quot;; Sexp.Atom &quot;world&quot; ]))\u000A;;\u000A\u000Alet () =\u000A  assert (\u000A    List.equal\u000A      String.equal\u000A      [ &quot;hello&quot;; &quot;world&quot; ]\u000A      (List.t_of_sexp String.t_of_sexp example_sexp))\u000A;;\u000A\u000A(* Embed a sexp in text (string) *)\u000A\u000Alet write_sexp_to_file sexp =\u000A  Out_channel.write_all &quot;/tmp/file&quot; ~data:(Sexp.to_string example_sexp)\u000A;;\u000A\u000A(* /tmp/file now contains:\u000A\u000A   {v\u000A     (hello world)\u000A   v} *)\u000A\u000Alet () =\u000A  assert (Sexp.equal example_sexp (Sexp.of_string (In_channel.read_all &quot;/tmp/file&quot;)))\u000A;;\u000A</code></pre>"}
