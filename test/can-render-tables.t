Generate the ppx_deriving_yaml documentation

  $ voodoo-prep
  Warning: No universes have been specified: will generate dummy universes
  $ voodoo-do -p ppx_deriving_yaml -b
  Got dune
  Found 0 mld pages and 3 other pages
  libraries: [ppx_deriving_yaml]
  compile command: odoc compile ./p.mld -o compile/page-p.odoc --child
                     page-"ppx_deriving_yaml"
  compile command: odoc compile ./ppx_deriving_yaml.mld -o
                     compile/p/page-ppx_deriving_yaml.odoc --parent "p" -I
                     compile --child page-"0.2.1"
  File "./ppx_deriving_yaml.mld", line 2, characters 16-17:
  Warning: Child label is not allowed in the last component of a reference path.
  Suggestion: 'child-1' should be first.
  compile command: odoc compile ./0.2.1.mld -o
                     compile/p/ppx_deriving_yaml/page-0.2.1.odoc --parent
                     "ppx_deriving_yaml" -I compile/p --child page-"doc"
  compile command: odoc compile ./doc.mld -o
                     compile/p/ppx_deriving_yaml/0.2.1/page-doc.odoc --parent
                     "0.2.1" -I compile/p/ppx_deriving_yaml --child
                     module-ppx_deriving_yaml__ --child
                     module-ppx_deriving_yaml__Value --child
                     module-ppx_deriving_yaml --child
                     module-ppx_deriving_yaml__Helpers --child
                     module-ppx_deriving_yaml__Attrs
  compile command: odoc compile
                     prep/universes/99/ppx_deriving_yaml/0.2.1/lib/ppx_deriving_yaml/ppx_deriving_yaml__.cmt
                     -o
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/Ppx_deriving_yaml__.odoc
                     --parent "doc" -I compile/p/ppx_deriving_yaml/0.2.1
  Missing dependency: Astlib 90658f1797af1277c30c69c330d6bb64
  Missing dependency: Astlib__ 8529cc06dbe8f25097db832c23258d2e
  Missing dependency: Astlib__Ast_402 57edac28fb53a7d8ac6c12acea5f0ba9
  Missing dependency: Astlib__Ast_403 257d49ea564d33ed7cf2843090df1b0b
  Missing dependency: Astlib__Ast_404 80696cd192c79b2b0d0b19a3e04e314c
  Missing dependency: Astlib__Ast_405 0a9481c55537907c60707483eed03ff6
  Missing dependency: Astlib__Ast_406 e4b8a0d6d01cdd78df85afe0ec12ba64
  Missing dependency: Astlib__Ast_407 692db1481f2c9cf8cdb3935a1b07dc65
  Missing dependency: Astlib__Ast_408 f3d21228d47cf65418935f442a16b081
  Missing dependency: Astlib__Ast_409 40ea351fa29e12337dff68e862e3dff7
  Missing dependency: Astlib__Ast_410 7af3ae6f9833b486a3ac458a7f67ef99
  Missing dependency: Astlib__Ast_411 0b2d2e081deb993002c8f75f3c55be06
  Missing dependency: Astlib__Ast_412 0c1a066e66b3e6cfe48f28125a6e8d4d
  Missing dependency: Astlib__Ast_413 db5254da5a8c60e03e4b7bdefe0d30d5
  Missing dependency: Astlib__Ast_414 eba8aa3d1764c0c0f42a06a5f44f3663
  Missing dependency: Astlib__Ast_500 95708acd0a14e3baf2516080c91cefe1
  Missing dependency: Astlib__Location b3a642c5f486a00399bfa64e035e6185
  Missing dependency: Astlib__Longident 8b605cca08297643b91aeed43bbdcca8
  Missing dependency: Astlib__Parse 01f793e2a5c46e489684c5cc94ffaae7
  Missing dependency: Asttypes 8e13c3e1e619d609f06d4cb969510b9f
  Missing dependency: Build_path_prefix_map 6707300ead09f98da0d1118ecedeaa84
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: CamlinternalLazy 2c797917c31a980b79e9d16d84057b70
  Missing dependency: Clflags 5e86cc480f089a8f4cd25e4692045ec1
  Missing dependency: Cmi_format 37a0eaddfc453dfffd0d5d0c40c1905c
  Missing dependency: Compmisc e0d55a71a450aef521b84cff11fa6f06
  Missing dependency: Env 2545caf02c46d162f1307da4705adf6d
  Missing dependency: Ident 51215e6391ba6c7232e809326eece57b
  Missing dependency: Identifiable 85bd9a5ac9afff88896e3f793f976cd5
  Missing dependency: Load_path a5e6ad168a3c17969b575d048d5c8d06
  Missing dependency: Location 4bbcd6f7d16357931ebbfdbf9f5267c8
  Missing dependency: Longident 0e755e8e24e8c8ac7f2ee4a4985076be
  Missing dependency: Misc c160e2ac60e89d9c314767d73c2482ac
  Missing dependency: Ocaml_common 0c37b028a7f44c942842627324144863
  Missing dependency: Ocaml_shadow 410069ea51a25f0174f9bf302e14bed3
  Missing dependency: Outcometree 2451f651b280a341dfd80bf3f712896b
  Missing dependency: Parsetree 096f58e4312ad224f22d21960d40384d
  Missing dependency: Path 909feea88de1b1f5f503b21a91822338
  Missing dependency: Ppxlib 7f9d88dc25352f94b9155326ae0ef55a
  Missing dependency: Ppxlib__ d8f6d0539b76e5819435be027910d8ed
  Missing dependency: Ppxlib__Ast_pattern 51ee582e34c95f438c62b65b3a22cc1f
  Missing dependency: Ppxlib__Ast_pattern0 59ac56151c04a0bb5af45e26eddf9366
  Missing dependency: Ppxlib__Ast_pattern_generated e581e359cc11d048ff7b4f2caf5e9c3e
  Missing dependency: Ppxlib__Ast_traverse 82453fbf00b15739cf27dfa242e3a6d2
  Missing dependency: Ppxlib__Ast_traverse0 2c1129e62d22313d4eb26790e85e9fef
  Missing dependency: Ppxlib__Attribute 56d0551bbff77a39e8c89f1970f04fb0
  Missing dependency: Ppxlib__Code_path 780bc9c11970af3809381fc9073118c2
  Missing dependency: Ppxlib__Common 0e24b1cf478e949a0c3dd0a4691e79b1
  Missing dependency: Ppxlib__Expansion_context 4674f00e046d5d9592e0cf0d24c33d8b
  Missing dependency: Ppxlib__Import f2f43f89bc25b95955c94fef002f3925
  Missing dependency: Ppxlib__Loc a8d671d0f8d40e84d3c84c1d8b5998e7
  Missing dependency: Ppxlib__Location 2b804a717a038c5439b5b34c8e476e47
  Missing dependency: Ppxlib__Longident 8d79836df1295f1cff4c57e0afa429b9
  Missing dependency: Ppxlib__Name c09143cd70519d75becab9fbb267c932
  Missing dependency: Ppxlib__Utils e1f8c03e859fa531b444dd32706e47ec
  Missing dependency: Ppxlib_ast 78f863d73c4233bacb9b7dcdfc403e9e
  Missing dependency: Ppxlib_ast__ 8c3eb8e361ec4b030bcd7cb8ab0e48ae
  Missing dependency: Ppxlib_ast__Ast 5debff47c4464193af5a86034ebb1fb2
  Missing dependency: Ppxlib_ast__Import e7dc82a7ee09250ca43357b5061dde9e
  Missing dependency: Ppxlib_ast__Versions 382e74672b0fbec198ec58ae9970fc29
  Missing dependency: Ppxlib_traverse_builtins c0ac095fb9f6a04e437dde5da6be6641
  Missing dependency: Primitive 0f9fa482c8cbc2feccc780e00f936c39
  Missing dependency: Profile cd54d8773a52beceaf573a266914e0f5
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Shape 082359f0c8c7b97545dbc23eab009e13
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Arg 37ac8abf22d3dbe8e900dc221da3abf4
  Missing dependency: Stdlib__Array 9bcf1a06bdcfbb976f898e818e15611a
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Bytes b0d2a0027e7278e26a1fe4bc0e79a690
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Char 71d01c936f35204d25fbdc2a38153066
  Missing dependency: Stdlib__Digest ff876226ab2584c79cfe1afd26ca2f58
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Lazy ca3d5c326131437daef18ae34e7f4aa9
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__List feb7c568830f9f239501efb83f4725e4
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__String facad7e0dada5941148738b8188d844f
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdppx 61387bcb55223b064672a50b91b780e7
  Missing dependency: Subst 4f386f2a26e503086bc416b868de7373
  Missing dependency: Type_immediacy 83945ea19313fcf2d732a672262d6fb1
  Missing dependency: Types 415ec5f0b61e8e01c1fd8a230c310448
  Missing dependency: Warnings 1c26f04813f661396abb13054a150814
  compile command: odoc compile
                     prep/universes/99/ppx_deriving_yaml/0.2.1/lib/ppx_deriving_yaml/ppx_deriving_yaml__Attrs.cmti
                     -o
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/Ppx_deriving_yaml__Attrs.odoc
                     --parent "doc" -I compile/p/ppx_deriving_yaml/0.2.1 -I
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/
  Missing dependency: Astlib 90658f1797af1277c30c69c330d6bb64
  Missing dependency: Astlib__ 8529cc06dbe8f25097db832c23258d2e
  Missing dependency: Astlib__Ast_402 57edac28fb53a7d8ac6c12acea5f0ba9
  Missing dependency: Astlib__Ast_403 257d49ea564d33ed7cf2843090df1b0b
  Missing dependency: Astlib__Ast_404 80696cd192c79b2b0d0b19a3e04e314c
  Missing dependency: Astlib__Ast_405 0a9481c55537907c60707483eed03ff6
  Missing dependency: Astlib__Ast_406 e4b8a0d6d01cdd78df85afe0ec12ba64
  Missing dependency: Astlib__Ast_407 692db1481f2c9cf8cdb3935a1b07dc65
  Missing dependency: Astlib__Ast_408 f3d21228d47cf65418935f442a16b081
  Missing dependency: Astlib__Ast_409 40ea351fa29e12337dff68e862e3dff7
  Missing dependency: Astlib__Ast_410 7af3ae6f9833b486a3ac458a7f67ef99
  Missing dependency: Astlib__Ast_411 0b2d2e081deb993002c8f75f3c55be06
  Missing dependency: Astlib__Ast_412 0c1a066e66b3e6cfe48f28125a6e8d4d
  Missing dependency: Astlib__Ast_413 db5254da5a8c60e03e4b7bdefe0d30d5
  Missing dependency: Astlib__Ast_414 eba8aa3d1764c0c0f42a06a5f44f3663
  Missing dependency: Astlib__Ast_500 95708acd0a14e3baf2516080c91cefe1
  Missing dependency: Astlib__Location b3a642c5f486a00399bfa64e035e6185
  Missing dependency: Astlib__Longident 8b605cca08297643b91aeed43bbdcca8
  Missing dependency: Astlib__Parse 01f793e2a5c46e489684c5cc94ffaae7
  Missing dependency: Asttypes 8e13c3e1e619d609f06d4cb969510b9f
  Missing dependency: Build_path_prefix_map 6707300ead09f98da0d1118ecedeaa84
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: CamlinternalLazy 2c797917c31a980b79e9d16d84057b70
  Missing dependency: Clflags 5e86cc480f089a8f4cd25e4692045ec1
  Missing dependency: Cmi_format 37a0eaddfc453dfffd0d5d0c40c1905c
  Missing dependency: Compmisc e0d55a71a450aef521b84cff11fa6f06
  Missing dependency: Env 2545caf02c46d162f1307da4705adf6d
  Missing dependency: Ident 51215e6391ba6c7232e809326eece57b
  Missing dependency: Identifiable 85bd9a5ac9afff88896e3f793f976cd5
  Missing dependency: Load_path a5e6ad168a3c17969b575d048d5c8d06
  Missing dependency: Location 4bbcd6f7d16357931ebbfdbf9f5267c8
  Missing dependency: Longident 0e755e8e24e8c8ac7f2ee4a4985076be
  Missing dependency: Misc c160e2ac60e89d9c314767d73c2482ac
  Missing dependency: Ocaml_common 0c37b028a7f44c942842627324144863
  Missing dependency: Ocaml_shadow 410069ea51a25f0174f9bf302e14bed3
  Missing dependency: Outcometree 2451f651b280a341dfd80bf3f712896b
  Missing dependency: Parsetree 096f58e4312ad224f22d21960d40384d
  Missing dependency: Path 909feea88de1b1f5f503b21a91822338
  Missing dependency: Ppxlib 7f9d88dc25352f94b9155326ae0ef55a
  Missing dependency: Ppxlib__ d8f6d0539b76e5819435be027910d8ed
  Missing dependency: Ppxlib__Ast_pattern 51ee582e34c95f438c62b65b3a22cc1f
  Missing dependency: Ppxlib__Ast_pattern0 59ac56151c04a0bb5af45e26eddf9366
  Missing dependency: Ppxlib__Ast_pattern_generated e581e359cc11d048ff7b4f2caf5e9c3e
  Missing dependency: Ppxlib__Ast_traverse 82453fbf00b15739cf27dfa242e3a6d2
  Missing dependency: Ppxlib__Ast_traverse0 2c1129e62d22313d4eb26790e85e9fef
  Missing dependency: Ppxlib__Attribute 56d0551bbff77a39e8c89f1970f04fb0
  Missing dependency: Ppxlib__Code_path 780bc9c11970af3809381fc9073118c2
  Missing dependency: Ppxlib__Common 0e24b1cf478e949a0c3dd0a4691e79b1
  Missing dependency: Ppxlib__Expansion_context 4674f00e046d5d9592e0cf0d24c33d8b
  Missing dependency: Ppxlib__Import f2f43f89bc25b95955c94fef002f3925
  Missing dependency: Ppxlib__Loc a8d671d0f8d40e84d3c84c1d8b5998e7
  Missing dependency: Ppxlib__Location 2b804a717a038c5439b5b34c8e476e47
  Missing dependency: Ppxlib__Longident 8d79836df1295f1cff4c57e0afa429b9
  Missing dependency: Ppxlib__Name c09143cd70519d75becab9fbb267c932
  Missing dependency: Ppxlib__Utils e1f8c03e859fa531b444dd32706e47ec
  Missing dependency: Ppxlib_ast 78f863d73c4233bacb9b7dcdfc403e9e
  Missing dependency: Ppxlib_ast__ 8c3eb8e361ec4b030bcd7cb8ab0e48ae
  Missing dependency: Ppxlib_ast__Ast 5debff47c4464193af5a86034ebb1fb2
  Missing dependency: Ppxlib_ast__Import e7dc82a7ee09250ca43357b5061dde9e
  Missing dependency: Ppxlib_ast__Versions 382e74672b0fbec198ec58ae9970fc29
  Missing dependency: Ppxlib_traverse_builtins c0ac095fb9f6a04e437dde5da6be6641
  Missing dependency: Primitive 0f9fa482c8cbc2feccc780e00f936c39
  Missing dependency: Profile cd54d8773a52beceaf573a266914e0f5
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Shape 082359f0c8c7b97545dbc23eab009e13
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Arg 37ac8abf22d3dbe8e900dc221da3abf4
  Missing dependency: Stdlib__Array 9bcf1a06bdcfbb976f898e818e15611a
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Bytes b0d2a0027e7278e26a1fe4bc0e79a690
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Char 71d01c936f35204d25fbdc2a38153066
  Missing dependency: Stdlib__Digest ff876226ab2584c79cfe1afd26ca2f58
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Lazy ca3d5c326131437daef18ae34e7f4aa9
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__List feb7c568830f9f239501efb83f4725e4
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__String facad7e0dada5941148738b8188d844f
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdppx 61387bcb55223b064672a50b91b780e7
  Missing dependency: Subst 4f386f2a26e503086bc416b868de7373
  Missing dependency: Type_immediacy 83945ea19313fcf2d732a672262d6fb1
  Missing dependency: Types 415ec5f0b61e8e01c1fd8a230c310448
  Missing dependency: Warnings 1c26f04813f661396abb13054a150814
  compile command: odoc compile
                     prep/universes/99/ppx_deriving_yaml/0.2.1/lib/ppx_deriving_yaml/ppx_deriving_yaml__Helpers.cmti
                     -o
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/Ppx_deriving_yaml__Helpers.odoc
                     --parent "doc" -I compile/p/ppx_deriving_yaml/0.2.1 -I
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/
  Missing dependency: Astlib 90658f1797af1277c30c69c330d6bb64
  Missing dependency: Astlib__ 8529cc06dbe8f25097db832c23258d2e
  Missing dependency: Astlib__Ast_402 57edac28fb53a7d8ac6c12acea5f0ba9
  Missing dependency: Astlib__Ast_403 257d49ea564d33ed7cf2843090df1b0b
  Missing dependency: Astlib__Ast_404 80696cd192c79b2b0d0b19a3e04e314c
  Missing dependency: Astlib__Ast_405 0a9481c55537907c60707483eed03ff6
  Missing dependency: Astlib__Ast_406 e4b8a0d6d01cdd78df85afe0ec12ba64
  Missing dependency: Astlib__Ast_407 692db1481f2c9cf8cdb3935a1b07dc65
  Missing dependency: Astlib__Ast_408 f3d21228d47cf65418935f442a16b081
  Missing dependency: Astlib__Ast_409 40ea351fa29e12337dff68e862e3dff7
  Missing dependency: Astlib__Ast_410 7af3ae6f9833b486a3ac458a7f67ef99
  Missing dependency: Astlib__Ast_411 0b2d2e081deb993002c8f75f3c55be06
  Missing dependency: Astlib__Ast_412 0c1a066e66b3e6cfe48f28125a6e8d4d
  Missing dependency: Astlib__Ast_413 db5254da5a8c60e03e4b7bdefe0d30d5
  Missing dependency: Astlib__Ast_414 eba8aa3d1764c0c0f42a06a5f44f3663
  Missing dependency: Astlib__Ast_500 95708acd0a14e3baf2516080c91cefe1
  Missing dependency: Astlib__Location b3a642c5f486a00399bfa64e035e6185
  Missing dependency: Astlib__Longident 8b605cca08297643b91aeed43bbdcca8
  Missing dependency: Astlib__Parse 01f793e2a5c46e489684c5cc94ffaae7
  Missing dependency: Asttypes 8e13c3e1e619d609f06d4cb969510b9f
  Missing dependency: Build_path_prefix_map 6707300ead09f98da0d1118ecedeaa84
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: CamlinternalLazy 2c797917c31a980b79e9d16d84057b70
  Missing dependency: Clflags 5e86cc480f089a8f4cd25e4692045ec1
  Missing dependency: Cmi_format 37a0eaddfc453dfffd0d5d0c40c1905c
  Missing dependency: Compmisc e0d55a71a450aef521b84cff11fa6f06
  Missing dependency: Env 2545caf02c46d162f1307da4705adf6d
  Missing dependency: Ident 51215e6391ba6c7232e809326eece57b
  Missing dependency: Identifiable 85bd9a5ac9afff88896e3f793f976cd5
  Missing dependency: Load_path a5e6ad168a3c17969b575d048d5c8d06
  Missing dependency: Location 4bbcd6f7d16357931ebbfdbf9f5267c8
  Missing dependency: Longident 0e755e8e24e8c8ac7f2ee4a4985076be
  Missing dependency: Misc c160e2ac60e89d9c314767d73c2482ac
  Missing dependency: Ocaml_common 0c37b028a7f44c942842627324144863
  Missing dependency: Ocaml_shadow 410069ea51a25f0174f9bf302e14bed3
  Missing dependency: Outcometree 2451f651b280a341dfd80bf3f712896b
  Missing dependency: Parsetree 096f58e4312ad224f22d21960d40384d
  Missing dependency: Path 909feea88de1b1f5f503b21a91822338
  Missing dependency: Ppxlib 7f9d88dc25352f94b9155326ae0ef55a
  Missing dependency: Ppxlib__ d8f6d0539b76e5819435be027910d8ed
  Missing dependency: Ppxlib__Ast_pattern 51ee582e34c95f438c62b65b3a22cc1f
  Missing dependency: Ppxlib__Ast_pattern0 59ac56151c04a0bb5af45e26eddf9366
  Missing dependency: Ppxlib__Ast_pattern_generated e581e359cc11d048ff7b4f2caf5e9c3e
  Missing dependency: Ppxlib__Ast_traverse 82453fbf00b15739cf27dfa242e3a6d2
  Missing dependency: Ppxlib__Ast_traverse0 2c1129e62d22313d4eb26790e85e9fef
  Missing dependency: Ppxlib__Attribute 56d0551bbff77a39e8c89f1970f04fb0
  Missing dependency: Ppxlib__Code_path 780bc9c11970af3809381fc9073118c2
  Missing dependency: Ppxlib__Common 0e24b1cf478e949a0c3dd0a4691e79b1
  Missing dependency: Ppxlib__Expansion_context 4674f00e046d5d9592e0cf0d24c33d8b
  Missing dependency: Ppxlib__Import f2f43f89bc25b95955c94fef002f3925
  Missing dependency: Ppxlib__Loc a8d671d0f8d40e84d3c84c1d8b5998e7
  Missing dependency: Ppxlib__Location 2b804a717a038c5439b5b34c8e476e47
  Missing dependency: Ppxlib__Longident 8d79836df1295f1cff4c57e0afa429b9
  Missing dependency: Ppxlib__Name c09143cd70519d75becab9fbb267c932
  Missing dependency: Ppxlib__Utils e1f8c03e859fa531b444dd32706e47ec
  Missing dependency: Ppxlib_ast 78f863d73c4233bacb9b7dcdfc403e9e
  Missing dependency: Ppxlib_ast__ 8c3eb8e361ec4b030bcd7cb8ab0e48ae
  Missing dependency: Ppxlib_ast__Ast 5debff47c4464193af5a86034ebb1fb2
  Missing dependency: Ppxlib_ast__Import e7dc82a7ee09250ca43357b5061dde9e
  Missing dependency: Ppxlib_ast__Versions 382e74672b0fbec198ec58ae9970fc29
  Missing dependency: Ppxlib_traverse_builtins c0ac095fb9f6a04e437dde5da6be6641
  Missing dependency: Primitive 0f9fa482c8cbc2feccc780e00f936c39
  Missing dependency: Profile cd54d8773a52beceaf573a266914e0f5
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Shape 082359f0c8c7b97545dbc23eab009e13
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Stdlib__Arg 37ac8abf22d3dbe8e900dc221da3abf4
  Missing dependency: Stdlib__Array 9bcf1a06bdcfbb976f898e818e15611a
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Bytes b0d2a0027e7278e26a1fe4bc0e79a690
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Char 71d01c936f35204d25fbdc2a38153066
  Missing dependency: Stdlib__Digest ff876226ab2584c79cfe1afd26ca2f58
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Lazy ca3d5c326131437daef18ae34e7f4aa9
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__List feb7c568830f9f239501efb83f4725e4
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__String facad7e0dada5941148738b8188d844f
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdppx 61387bcb55223b064672a50b91b780e7
  Missing dependency: Subst 4f386f2a26e503086bc416b868de7373
  Missing dependency: Type_immediacy 83945ea19313fcf2d732a672262d6fb1
  Missing dependency: Types 415ec5f0b61e8e01c1fd8a230c310448
  Missing dependency: Warnings 1c26f04813f661396abb13054a150814
  compile command: odoc compile
                     prep/universes/99/ppx_deriving_yaml/0.2.1/lib/ppx_deriving_yaml/ppx_deriving_yaml__Value.cmti
                     -o
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/Ppx_deriving_yaml__Value.odoc
                     --parent "doc" -I compile/p/ppx_deriving_yaml/0.2.1 -I
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/
  Missing dependency: Warnings 1c26f04813f661396abb13054a150814
  Missing dependency: Types 415ec5f0b61e8e01c1fd8a230c310448
  Missing dependency: Type_immediacy 83945ea19313fcf2d732a672262d6fb1
  Missing dependency: Subst 4f386f2a26e503086bc416b868de7373
  Missing dependency: Stdppx 61387bcb55223b064672a50b91b780e7
  Missing dependency: Stdlib__Uchar 9ea864085095970c73b7b17c26c37317
  Missing dependency: Stdlib__Sys a0375c47cee9c7e20ff8f61d4f04e748
  Missing dependency: Stdlib__StringLabels 35aa2b633cde2c8857ed74e924def393
  Missing dependency: Stdlib__String facad7e0dada5941148738b8188d844f
  Missing dependency: Stdlib__StdLabels 8569b1ecaa952fff2a7ad8a3189c8ea8
  Missing dependency: Stdlib__Set f849884bcf48f894e90800c7ccd98f21
  Missing dependency: Stdlib__Seq cc3f899885b746f777815dc93be7ede2
  Missing dependency: Stdlib__Option 26fe71351d86ebe5d69a94600294de33
  Missing dependency: Stdlib__Map 71415964978d1cf0c1701af1137aa1ea
  Missing dependency: Stdlib__ListLabels b531f5d32f73cc39d609456e75b4b131
  Missing dependency: Stdlib__List feb7c568830f9f239501efb83f4725e4
  Missing dependency: Stdlib__Lexing be62854f0fbcd8531fe531cd00e34821
  Missing dependency: Stdlib__Lazy ca3d5c326131437daef18ae34e7f4aa9
  Missing dependency: Stdlib__Hashtbl bafdecabd3fce4f5ccc09a1a5587dab4
  Missing dependency: Stdlib__Format e7385010d0d6a0bbd4191bc7546d458a
  Missing dependency: Stdlib__Either b3ad0f8c65f28252059edebc03f68808
  Missing dependency: Stdlib__Domain a9e9c728d377f593667732dc026f2013
  Missing dependency: Stdlib__Digest ff876226ab2584c79cfe1afd26ca2f58
  Missing dependency: Stdlib__Char 71d01c936f35204d25fbdc2a38153066
  Missing dependency: Stdlib__BytesLabels 2430d84166b2487a527e5715a5b1642c
  Missing dependency: Stdlib__Bytes b0d2a0027e7278e26a1fe4bc0e79a690
  Missing dependency: Stdlib__Buffer 12b944b4b2913751cd65bdc638975d4d
  Missing dependency: Stdlib__Array 9bcf1a06bdcfbb976f898e818e15611a
  Missing dependency: Stdlib__Arg 37ac8abf22d3dbe8e900dc221da3abf4
  Missing dependency: Stdlib 85f85ddb47edc0c7579657eee740302d
  Missing dependency: Shape 082359f0c8c7b97545dbc23eab009e13
  Missing dependency: Sexplib0__Sexp_grammar c47fca4c7de1eaddd16225382bd4f02c
  Missing dependency: Sexplib0__Sexp_conv_grammar e616e67c88cbde38eafbce64f03ead2d
  Missing dependency: Sexplib0__Sexp_conv 714fe20ec8fb62046a840170c389de10
  Missing dependency: Sexplib0__Sexp c186ea93704a1f1ec6c1bcaeecc5147f
  Missing dependency: Sexplib0__ 77157f5c26f3614a60f3ea091776516c
  Missing dependency: Sexplib0 7620587723f4ba1ddf955831eed59f5f
  Missing dependency: Profile cd54d8773a52beceaf573a266914e0f5
  Missing dependency: Primitive 0f9fa482c8cbc2feccc780e00f936c39
  Missing dependency: Ppxlib_traverse_builtins c0ac095fb9f6a04e437dde5da6be6641
  Missing dependency: Ppxlib_ast__Versions 382e74672b0fbec198ec58ae9970fc29
  Missing dependency: Ppxlib_ast__Import e7dc82a7ee09250ca43357b5061dde9e
  Missing dependency: Ppxlib_ast__Ast_helper_lite bbb1f5ec1f21d048d463916a929f7a3f
  Missing dependency: Ppxlib_ast__Ast 5debff47c4464193af5a86034ebb1fb2
  Missing dependency: Ppxlib_ast__ 8c3eb8e361ec4b030bcd7cb8ab0e48ae
  Missing dependency: Ppxlib_ast 78f863d73c4233bacb9b7dcdfc403e9e
  Missing dependency: Ppxlib__Utils e1f8c03e859fa531b444dd32706e47ec
  Missing dependency: Ppxlib__Name c09143cd70519d75becab9fbb267c932
  Missing dependency: Ppxlib__Longident 8d79836df1295f1cff4c57e0afa429b9
  Missing dependency: Ppxlib__Location 2b804a717a038c5439b5b34c8e476e47
  Missing dependency: Ppxlib__Loc a8d671d0f8d40e84d3c84c1d8b5998e7
  Missing dependency: Ppxlib__Import f2f43f89bc25b95955c94fef002f3925
  Missing dependency: Ppxlib__Expansion_context 4674f00e046d5d9592e0cf0d24c33d8b
  Missing dependency: Ppxlib__Deriving 3b8afc01635fbb8198ae0fb5113418c4
  Missing dependency: Ppxlib__Common 0e24b1cf478e949a0c3dd0a4691e79b1
  Missing dependency: Ppxlib__Code_path 780bc9c11970af3809381fc9073118c2
  Missing dependency: Ppxlib__Attribute 56d0551bbff77a39e8c89f1970f04fb0
  Missing dependency: Ppxlib__Ast_traverse0 2c1129e62d22313d4eb26790e85e9fef
  Missing dependency: Ppxlib__Ast_traverse 82453fbf00b15739cf27dfa242e3a6d2
  Missing dependency: Ppxlib__Ast_pattern_generated e581e359cc11d048ff7b4f2caf5e9c3e
  Missing dependency: Ppxlib__Ast_pattern0 59ac56151c04a0bb5af45e26eddf9366
  Missing dependency: Ppxlib__Ast_pattern 51ee582e34c95f438c62b65b3a22cc1f
  Missing dependency: Ppxlib__Ast_builder_intf 878b50249652bd2cf2a60dac0ff2a62a
  Missing dependency: Ppxlib__Ast_builder_generated e467c12e285f5b7ae5b6fb7d8c21f6b3
  Missing dependency: Ppxlib__Ast_builder 10dd132e059c7a732dd923aa3cd7daf8
  Missing dependency: Ppxlib__ d8f6d0539b76e5819435be027910d8ed
  Missing dependency: Ppxlib 7f9d88dc25352f94b9155326ae0ef55a
  Missing dependency: Path 909feea88de1b1f5f503b21a91822338
  Missing dependency: Parsetree 096f58e4312ad224f22d21960d40384d
  Missing dependency: Outcometree 2451f651b280a341dfd80bf3f712896b
  Missing dependency: Ocaml_shadow 410069ea51a25f0174f9bf302e14bed3
  Missing dependency: Ocaml_common 0c37b028a7f44c942842627324144863
  Missing dependency: Misc c160e2ac60e89d9c314767d73c2482ac
  Missing dependency: Longident 0e755e8e24e8c8ac7f2ee4a4985076be
  Missing dependency: Location 4bbcd6f7d16357931ebbfdbf9f5267c8
  Missing dependency: Load_path a5e6ad168a3c17969b575d048d5c8d06
  Missing dependency: Identifiable 85bd9a5ac9afff88896e3f793f976cd5
  Missing dependency: Ident 51215e6391ba6c7232e809326eece57b
  Missing dependency: Env 2545caf02c46d162f1307da4705adf6d
  Missing dependency: Compmisc e0d55a71a450aef521b84cff11fa6f06
  Missing dependency: Cmi_format 37a0eaddfc453dfffd0d5d0c40c1905c
  Missing dependency: Clflags 5e86cc480f089a8f4cd25e4692045ec1
  Missing dependency: CamlinternalLazy 2c797917c31a980b79e9d16d84057b70
  Missing dependency: CamlinternalFormatBasics cecfafd5c021473f5e358c96ac7502a0
  Missing dependency: Build_path_prefix_map 6707300ead09f98da0d1118ecedeaa84
  Missing dependency: Asttypes 8e13c3e1e619d609f06d4cb969510b9f
  Missing dependency: Astlib__Parse 01f793e2a5c46e489684c5cc94ffaae7
  Missing dependency: Astlib__Longident 8b605cca08297643b91aeed43bbdcca8
  Missing dependency: Astlib__Location b3a642c5f486a00399bfa64e035e6185
  Missing dependency: Astlib__Ast_500 95708acd0a14e3baf2516080c91cefe1
  Missing dependency: Astlib__Ast_414 eba8aa3d1764c0c0f42a06a5f44f3663
  Missing dependency: Astlib__Ast_413 db5254da5a8c60e03e4b7bdefe0d30d5
  Missing dependency: Astlib__Ast_412 0c1a066e66b3e6cfe48f28125a6e8d4d
  Missing dependency: Astlib__Ast_411 0b2d2e081deb993002c8f75f3c55be06
  Missing dependency: Astlib__Ast_410 7af3ae6f9833b486a3ac458a7f67ef99
  Missing dependency: Astlib__Ast_409 40ea351fa29e12337dff68e862e3dff7
  Missing dependency: Astlib__Ast_408 f3d21228d47cf65418935f442a16b081
  Missing dependency: Astlib__Ast_407 692db1481f2c9cf8cdb3935a1b07dc65
  Missing dependency: Astlib__Ast_406 e4b8a0d6d01cdd78df85afe0ec12ba64
  Missing dependency: Astlib__Ast_405 0a9481c55537907c60707483eed03ff6
  Missing dependency: Astlib__Ast_404 80696cd192c79b2b0d0b19a3e04e314c
  Missing dependency: Astlib__Ast_403 257d49ea564d33ed7cf2843090df1b0b
  Missing dependency: Astlib__Ast_402 57edac28fb53a7d8ac6c12acea5f0ba9
  Missing dependency: Astlib__ 8529cc06dbe8f25097db832c23258d2e
  Missing dependency: Astlib 90658f1797af1277c30c69c330d6bb64
  compile command: odoc compile
                     prep/universes/99/ppx_deriving_yaml/0.2.1/lib/ppx_deriving_yaml/ppx_deriving_yaml.cmt
                     -o
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/Ppx_deriving_yaml.odoc
                     --parent "doc" -I compile/p/ppx_deriving_yaml/0.2.1 -I
                     compile/p/ppx_deriving_yaml/0.2.1/0.2.1/lib/ppx_deriving_yaml/
  No children
  3 other files to copy
  dst: linked/p/ppx_deriving_yaml/0.2.1/doc/opam
  dst: linked/p/ppx_deriving_yaml/0.2.1/doc/LICENSE.md
  dst: linked/p/ppx_deriving_yaml/0.2.1/doc/README.md
  dst: linked/p/ppx_deriving_yaml/0.2.1/doc/CHANGES.md
  dest: linked/p/ppx_deriving_yaml/0.2.1/doc/LICENSE.md
  dest: linked/p/ppx_deriving_yaml/0.2.1/doc/README.md
  dest: linked/p/ppx_deriving_yaml/0.2.1/doc/CHANGES.md
  $ voodoo-gen -o output
  0 other versons, 1 packages
  Found 2 files

Generates a status.json file
  $ cat output/p/ppx_deriving_yaml/0.2.1/status.json
  "Built"

Generate a README.md file with the tables formatted in HTML
  $ cat output/p/ppx_deriving_yaml/0.2.1/README.md.html.json
  {"uses_katex":false,"breadcrumbs":[{"name":"p","href":"../../","kind":"page"},{"name":"ppx_deriving_yaml","href":"../","kind":"page"},{"name":"0.2.1","href":"","kind":"page"},{"name":"README.md","href":"#","kind":"leaf-page"}],"toc":[],"preamble":"<h2>ppx_deriving_yaml</h2>","content":"<p>This ppx is based on <a href=\"https://github.com/NathanReb/ppx_yojson\">ppx_yojson</a> and <a href=\"https://github.com/ocaml-ppx/ppx_deriving_yojson\">ppx_deriving_yojson</a> because of the many similarities between JSON and yaml. In particular many of the way the OCaml values are encoded to yaml types are the same as those implemented by the Yojson ppx.</p><ul><li><p><a href=\"#basic-usage\">Basic Usage</a></p></li><li><p><a href=\"#attributes\">Attributes</a></p><ul><li><p><a href=\"#key-and-name\">Key and Name</a></p></li><li><p><a href=\"#default-values\">Default Values</a></p></li><li><p><a href=\"#custom-encoding-and-decoding\">Custom encoding and decoding</a></p></li></ul></li><li><p><a href=\"#partially-decoding\">Partially Decoding</a></p></li><li><p><a href=\"#implementation-details\">Implementation Details</a></p></li></ul><h3>Basic Usage</h3><p>For converting OCaml values to yaml values <code>ppx_deriving_yaml</code> will do the conventional dropping of the type name if it is <code>t</code>. Otherwise the type name is the prefix to the <code>to_yaml</code> function.</p><p><code>to_yaml</code> produces a <a href=\"https://github.com/avsm/ocaml-yaml/blob/master/lib/types.ml#L44\"><code>Yaml.value</code></a> which is compatible with the <a href=\"https://github.com/mirage/ezjsonm/blob/master/lib/ezjsonm.ml#L18\"><code>Ezjsonm.value</code></a> type.</p><p><code>of_yaml</code> produces OCaml types wrapped in a <code>result</code> -- this is how ocaml-yaml also handles errors i.e. not using exceptions. Based on your type this should let you move between yaml and OCaml values.</p><pre class=\"language-markdown\"><code># #require &quot;ppx_deriving_yaml&quot;;;\u000A</code></pre><p>Here is a small example.</p><pre class=\"language-markdown\"><code>type person = { name : string; age : int } [@@deriving yaml]\u000Atype users = person list [@@deriving yaml]\u000A</code></pre><p>This will produce four functions, a <code>_to_yaml</code> and <code>_of_yaml</code> for both a person and<br/>the users. For example:</p><pre class=\"language-markdown\"><code># person_to_yaml;;\u000A- : person -&gt;\u000A    [&gt; `O of (string * [&gt; `Float of float | `String of string ]) list ]\u000A= &lt;fun&gt;\u000A# users_of_yaml;;\u000A- : [&gt; `A of [&gt; `O of (string * Yaml.value) list ] list ] -&gt;\u000A    (person list, [&gt; `Msg of string ]) result\u000A= &lt;fun&gt;\u000A</code></pre><p>If you make polymorphic types, then you will have to supply the function to convert the unknown to a yaml value. For example:</p><pre class=\"language-markdown\"><code>type 'a note = { txt : 'a } [@@deriving yaml]\u000A</code></pre><p>produces the following function.</p><pre class=\"language-markdown\"><code># note_to_yaml;;\u000A- : ('a -&gt; Yaml.value) -&gt; 'a note -&gt; [&gt; `O of (string * Yaml.value) list ] =\u000A&lt;fun&gt;\u000A</code></pre><p>Finally, if you only need the encoder (<code>to_yaml</code>) or the decoder (<code>of_yaml</code>) then there are single versions of the deriver for those.</p><pre class=\"language-markdown\"><code># type x = { age : int }[@@deriving to_yaml];;\u000Atype x = { age : int; }\u000Aval x_to_yaml : x -&gt; [&gt; `O of (string * [&gt; `Float of float ]) list ] = &lt;fun&gt;\u000A</code></pre><h3>Attributes</h3><h4>Key and Name</h4><p>Record field names cannot begin with a capital letter and variant constructors must start with one. This limits what the generated yaml can look like. To override the yaml names you can use the <code>[@key &lt;string&gt;]</code> and <code>[@name &lt;string&gt;]</code> attributes for records and variants respectively.</p><p>For example:</p><pre class=\"language-markdown\"><code>type t = {\u000A  camel_name : string [@key &quot;camel-name&quot;]\u000A}[@@deriving to_yaml]\u000A</code></pre><p>Will produce Yaml of the form</p><pre class=\"language-markdown\"><code># Yaml.to_string (to_yaml { camel_name = &quot;Alice&quot; });;\u000A- : string Yaml.res = Ok &quot;camel-name: Alice\\n&quot;\u000A</code></pre><h4>Default Values</h4><p>You can also specify default values for fields.</p><pre class=\"language-markdown\"><code>type t = {\u000A  name : string;\u000A  age : int [@default 42]\u000A}[@@deriving yaml]\u000A</code></pre><p>These will be used in the absence of any fields when decoding yaml values into OCaml ones.</p><pre class=\"language-markdown\"><code># Yaml.of_string_exn &quot;name: Alice&quot; |&gt; of_yaml;;\u000A- : (t, [&gt; `Msg of string ]) result = Ok {name = &quot;Alice&quot;; age = 42}\u000A</code></pre><h4>Custom encoding and decoding</h4><p>Sometimes you might want to specify your own encoding and decoding logic on field<br/>by field basis. To do so, you can use the <code>of_yaml</code> and <code>to_yaml</code> attributes.</p><pre class=\"language-markdown\"><code>type t = {\u000A  age : int [@to_yaml fun i -&gt; `Float (float_of_int (i + 1))]\u000A}[@@deriving yaml]\u000A</code></pre><p>The <code>to_yaml</code> function will use the custom encoder now instead.</p><pre class=\"language-markdown\"><code># Yaml.to_string (to_yaml { age = 41 });;\u000A- : string Yaml.res = Ok &quot;age: 42\\n&quot;\u000A</code></pre><h3>Partially Decoding</h3><p>There is a <code>~skip_unknown</code> flag for telling the deriver to simply ignore any fields which are missing. This is particularly useful when you only wish to partially decode a yaml value.</p><p>Consider the following yaml:</p><pre class=\"language-markdown\"><code>let yaml = &quot;name: Bob\\nage: 42\\nmisc: We don't need this!&quot;\u000A</code></pre><p>If we try to do the normal decoding of this but only partially extract the fields, it will throw an error.</p><pre class=\"language-markdown\"><code>type t = {\u000A  name : string;\u000A  age : int;\u000A}[@@deriving yaml]\u000A</code></pre><p>Note that the error is often rather confusing. There is room for improvement (PRs welcome!).</p><pre class=\"language-markdown\"><code># Yaml.of_string_exn yaml |&gt; of_yaml;;\u000A- : (t, [&gt; `Msg of string ]) result =\u000AError (`Msg &quot;miscWe don't need this!\\n&quot;)\u000A</code></pre><p>Instead we tell the deriver to ignore unknown fields.</p><pre class=\"language-markdown\"><code>type t = {\u000A  name : string;\u000A  age : int;\u000A}[@@deriving yaml ~skip_unknown]\u000A</code></pre><pre class=\"language-markdown\"><code># Yaml.of_string_exn yaml |&gt; of_yaml;;\u000A- : (t, [&gt; `Msg of string ]) result = Ok {name = &quot;Bob&quot;; age = 42}\u000A</code></pre><h3>Implementation Details</h3><p>One important thing is that <code>'a option</code> values within records will return <code>None</code> if the Yaml you are trying to convert does not exist.</p><table>\u000A<thead>\u000A<tr>\u000A<th align=\"center\">OCaml Type</th>\u000A<th align=\"center\">Yaml Type</th>\u000A</tr>\u000A</thead>\u000A<tbody>\u000A<tr>\u000A<td align=\"center\"><code>int</code></td>\u000A<td align=\"center\"><code>`Float</code></td>\u000A</tr>\u000A<tr>\u000A<td align=\"center\"><code>float</code></td>\u000A<td align=\"center\"><code>`Float</code></td>\u000A</tr>\u000A<tr>\u000A<td align=\"center\"><code>string</code></td>\u000A<td align=\"center\"><code>`String</code></td>\u000A</tr>\u000A<tr>\u000A<td align=\"center\"><code>bool</code></td>\u000A<td align=\"center\"><code>`Bool</code></td>\u000A</tr>\u000A<tr>\u000A<td align=\"center\"><code>None</code></td>\u000A<td align=\"center\"><code>`Null</code></td>\u000A</tr>\u000A<tr>\u000A<td align=\"center\"><code>list</code></td>\u000A<td align=\"center\"><code> `A []</code></td>\u000A</tr>\u000A<tr>\u000A<td align=\"center\"><code>array</code></td>\u000A<td align=\"center\"><code> `A []</code></td>\u000A</tr>\u000A<tr>\u000A<td align=\"center\"><code>record</code> e.g <code>{ name : string }</code></td>\u000A<td align=\"center\"><code>`O [(&quot;name&quot;, `String s)]</code></td>\u000A</tr>\u000A<tr>\u000A<td align=\"center\"><code>A of int</code> or <code> [`A of int]</code></td>\u000A<td align=\"center\"><code>`O [(&quot;A&quot;, `A [`Float f])]</code></td>\u000A</tr>\u000A</tbody>\u000A</table>\u000A"}
