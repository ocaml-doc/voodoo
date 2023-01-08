Generate the OCaml compiler libs documentation

  $ voodoo-prep
  Warning: No universes have been specified: will generate dummy universes
  $ voodoo-do -p ocaml-base-compiler -b
  No dune: Missing
  Found no other pages
  libraries: [runtime_events,ocamlmiddleend,ocamlbytecomp,ocamloptcomp,ocamlcommon,ocamltoplevel,unix,threads,str,odoc_info,dynlink,stdlib]
  compile command: odoc compile ./p.mld -o compile/page-p.odoc --child
                     page-"ocaml-base-compiler"
  File "./p.mld", line 2, characters 12-31:
  Warning: Unknown reference qualifier 'ocaml-base'.
  compile command: odoc compile ./ocaml-base-compiler.mld -o
                     compile/p/page-ocaml-base-compiler.odoc --parent "p" -I
                     compile --child page-"5.0.0"
  File "./ocaml-base-compiler.mld", line 2, characters 16-17:
  Warning: Child label is not allowed in the last component of a reference path.
  Suggestion: 'child-0' should be first.
  compile command: odoc compile ./5.0.0.mld -o
                     compile/p/ocaml-base-compiler/page-5.0.0.odoc --parent
                     "ocaml-base-compiler" -I compile/p --child page-"doc"
  compile command: odoc compile ./doc.mld -o
                     compile/p/ocaml-base-compiler/5.0.0/page-doc.odoc --parent
                     "5.0.0" -I compile/p/ocaml-base-compiler --child
                     module-stdlib__Ephemeron --child module-stdlib__Gc --child
                     module-stdlib__String --child module-stdlib__Bool --child
                     module-stdlib__Format --child module-stdlib__Complex
                     --child module-std_exit --child module-camlinternalOO
                     --child module-stdlib__Stack --child module-stdlib__Seq
                     --child module-stdlib__Arg --child
                     module-stdlib__Nativeint --child module-stdlib__In_channel
                     --child module-stdlib__Digest --child module-stdlib__Int
                     --child module-stdlib__Marshal --child
                     module-stdlib__Out_channel --child module-stdlib__Mutex
                     --child module-stdlib__Buffer --child module-stdlib__Scanf
                     --child module-stdlib__Semaphore --child
                     module-camlinternalFormat --child module-stdlib__List
                     --child module-stdlib__MoreLabels --child
                     module-stdlib__StdLabels --child module-stdlib__Callback
                     --child module-stdlib__StringLabels --child
                     module-stdlib__Array --child module-stdlib__Bigarray
                     --child module-camlinternalMod --child module-stdlib__Fun
                     --child module-camlinternalLazy --child
                     module-camlinternalFormatBasics --child
                     module-stdlib__ListLabels --child module-stdlib__Domain
                     --child module-stdlib__Printf --child
                     module-stdlib__Random --child module-stdlib__Weak --child
                     module-stdlib__Set --child module-stdlib --child
                     module-stdlib__Sys --child module-stdlib__Oo --child
                     module-stdlib__Map --child module-stdlib__Char --child
                     module-stdlib__Bytes --child module-stdlib__Obj --child
                     module-stdlib__Int32 --child module-stdlib__Either --child
                     module-stdlib__Result --child module-stdlib__BytesLabels
                     --child module-stdlib__Int64 --child
                     module-stdlib__Hashtbl --child module-stdlib__Unit --child
                     module-stdlib__Uchar --child module-stdlib__Option --child
                     module-stdlib__Atomic --child module-stdlib__Condition
                     --child module-stdlib__Parsing --child
                     module-stdlib__Float --child module-stdlib__Effect --child
                     module-stdlib__ArrayLabels --child module-stdlib__Queue
                     --child module-stdlib__Printexc --child
                     module-stdlib__Lexing --child module-stdlib__Lazy --child
                     module-stdlib__Filename --child module-dynlink --child
                     module-odoc_env --child module-odoc_dep --child
                     module-odoc_inherit --child module-odoc_config --child
                     module-odoc_types --child module-odoc_search --child
                     module-odoc_text_parser --child module-odoc_latex --child
                     module-odoc_messages --child module-odoc --child
                     module-odoc_merge --child module-odoc_analyse --child
                     module-odoc_ocamlhtml --child module-odoc_texi --child
                     module-odoc_parser --child module-odoc_latex_style --child
                     module-odoc_print --child module-odoc_type --child
                     module-odoc_dot --child module-odoc_see_lexer --child
                     module-odoc_global --child module-odoc_str --child
                     module-odoc_lexer --child module-odoc_cross --child
                     module-odoc_text --child module-odoc_extension --child
                     module-odoc_control --child module-odoc_scan --child
                     module-odoc_dag2html --child module-odoc_args --child
                     module-odoc_comments --child module-odoc_gen --child
                     module-odoc_misc --child module-odoc_value --child
                     module-odoc_info --child module-odoc_name --child
                     module-odoc_exception --child module-odoc_ast --child
                     module-odoc_parameter --child module-odoc_class --child
                     module-odoc_html --child module-odoc_man --child
                     module-odoc_text_lexer --child module-odoc_comments_global
                     --child module-odoc_to_text --child module-odoc_sig
                     --child module-odoc_test --child module-odoc_module
                     --child module-str --child module-profiling --child
                     module-thread --child module-event --child
                     module-unixLabels --child module-unix --child
                     module-ocamlmktop_init --child module-tophooks --child
                     module-parse --child module-polling --child module-interf
                     --child module-comballoc --child module-cmi_format --child
                     module-CSE --child module-liveness --child module-diffing
                     --child module-branch_relaxation_intf --child
                     module-find_recursive_functions --child module-closure_id
                     --child module-typecore --child module-main_args --child
                     module-spill --child module-camlinternalMenhirLib --child
                     module-flambda_iterators --child module-switch --child
                     module-internal_variable_names --child
                     module-typedecl_properties --child module-simplify_common
                     --child module-closure_conversion_aux --child
                     module-asmlibrarian --child module-flambda_middle_end
                     --child module-simple_value_approx --child module-predef
                     --child module-linear_format --child
                     module-strongly_connected_components --child
                     module-targetint --child module-topeval --child
                     module-local_store --child module-x86_dsl --child
                     module-lexer --child module-symbol --child module-asttypes
                     --child module-untypeast --child module-reload --child
                     module-translclass --child module-convert_primitives
                     --child module-outcometree --child module-persistent_env
                     --child module-topdirs --child module-projection --child
                     module-arch --child module-closure_conversion --child
                     module-translobj --child module-backend_var --child
                     module-maindriver --child module-selectgen --child
                     module-lift_code --child module-printtyp --child
                     module-arg_helper --child module-linearize --child
                     module-cmmgen_state --child module-export_id --child
                     module-parmatch --child module-location --child
                     module-deadcode --child module-misc --child module-optmain
                     --child module-pparse --child module-types --child
                     module-semantics_of_primitives --child
                     module-ast_invariants --child module-translcore --child
                     module-trace --child module-datarepr --child
                     module-backend_intf --child module-proc --child
                     module-inlining_decision_intf --child module-oprint
                     --child module-static_exception --child
                     module-typedecl_immediacy --child
                     module-includemod_errorprinter --child module-bytepackager
                     --child module-numbers --child module-emitaux --child
                     module-simplify_boxed_integer_ops --child
                     module-int_replace_polymorphic_compare --child
                     module-remove_unused_closure_vars --child module-topmain
                     --child module-typedecl --child module-typedecl_unboxed
                     --child module-load_path --child module-path --child
                     module-bytegen --child module-longident --child
                     module-alias_analysis --child module-simplify_primitives
                     --child module-initialize_symbol_to_let_symbol --child
                     module-printtyped --child module-opterrors --child
                     module-config_boot --child module-shape --child module-cmm
                     --child module-remove_unused_program_constructs --child
                     module-config --child module-opcodes --child
                     module-parsetree --child module-ident --child
                     module-inlining_stats_types --child
                     module-compilation_unit --child module-closure_middle_end
                     --child module-x86_proc --child module-clflags --child
                     module-env --child module-makedepend --child
                     module-unbox_free_vars_of_closures --child
                     module-translmod --child module-ast_mapper --child
                     module-typeopt --child module-optmaindriver --child
                     module-includecore --child module-schedgen --child
                     module-tag --child module-printclambda --child
                     module-printlambda --child module-compenv --child
                     module-debuginfo --child
                     module-remove_free_vars_equal_to_args --child
                     module-inlining_cost --child module-emit --child
                     module-flambda_utils --child module-emitcode --child
                     module-un_anf --child module-flambda_to_clambda --child
                     module-scheduling --child module-translattribute --child
                     module-x86_gas --child module-unbox_closures --child
                     module-closure_origin --child
                     module-simplify_boxed_integer_ops_intf --child
                     module-identifiable --child
                     module-lift_let_to_initialize_symbol --child
                     module-emitenv --child module-toploop --child
                     module-inlining_decision --child module-meta --child
                     module-strmatch --child module-bytelink --child
                     module-inlining_stats --child module-compile --child
                     module-printpat --child module-warnings --child
                     module-clambda --child module-profile --child
                     module-cmm_helpers --child module-mutable_variable --child
                     module-linscan --child module-typemod --child module-annot
                     --child module-main --child module-ref_to_variables
                     --child module-allocated_const --child module-printmach
                     --child module-tast_mapper --child module-compmisc --child
                     module-ctype --child module-btype --child module-symtable
                     --child module-printlinear --child module-cmt_format
                     --child module-selection --child module-topcommon --child
                     module-cmt2annot --child module-cmmgen --child
                     module-includemod --child module-pass_wrapper --child
                     module-typedecl_separability --child module-expunge
                     --child module-typedecl_variance --child
                     module-effect_analysis --child module-runtimedef --child
                     module-typetexp --child module-CSEgen --child
                     module-printinstr --child module-signature_group --child
                     module-dll --child module-clambda_primitives --child
                     module-ast_helper --child module-x86_ast --child
                     module-var_within_closure --child module-mtype --child
                     module-config_main --child module-depend --child
                     module-share_constants --child module-syntaxerr --child
                     module-envaux --child module-typedtree --child
                     module-reloadgen --child module-errortrace --child
                     module-terminfo --child module-flambda_invariants --child
                     module-traverse_for_exported_symbols --child
                     module-id_types --child module-inline_and_simplify --child
                     module-branch_relaxation --child
                     module-augment_specialised_args --child module-printast
                     --child module-ccomp --child module-cmxs_format --child
                     module-patterns --child module-tmc --child module-reg
                     --child module-parser --child module-mach --child
                     module-build_export_info --child module-printcmm --child
                     module-compile_common --child module-x86_masm --child
                     module-printclambda_primitives --child module-linear
                     --child module-lambda --child module-linkage_name --child
                     module-export_info --child module-inlining_transforms
                     --child module-closure --child module-closure_element
                     --child module-translprim --child module-cmo_format
                     --child module-build_path_prefix_map --child
                     module-set_of_closures_origin --child module-consistbl
                     --child module-bytelibrarian --child module-genprintval
                     --child module-extract_projections --child
                     module-docstrings --child module-import_approx --child
                     module-topstart --child module-lift_constants --child
                     module-cmx_format --child module-errors --child
                     module-simplif --child module-lazy_backtrack --child
                     module-compilenv --child module-asmpackager --child
                     module-instruct --child module-asmgen --child
                     module-attr_helper --child module-ast_iterator --child
                     module-parameter --child module-includeclass --child
                     module-type_immediacy --child module-optcompile --child
                     module-set_of_closures_id --child module-interval --child
                     module-inline_and_simplify_aux --child module-stypes
                     --child module-inconstant_idents --child module-coloring
                     --child module-afl_instrument --child module-split --child
                     module-domainstate --child module-subst --child
                     module-builtin_attributes --child module-rec_check --child
                     module-invariant_params --child module-variable --child
                     module-closure_offsets --child
                     module-unbox_specialised_args --child module-asmlink
                     --child module-tast_iterator --child
                     module-export_info_for_pack --child
                     module-diffing_with_keys --child
                     module-remove_unused_arguments --child module-flambda
                     --child module-freshening --child module-pprintast --child
                     module-typeclass --child module-matching --child
                     module-binutils --child module-dataflow --child
                     module-cmm_invariants --child module-bytesections --child
                     module-primitive --child module-runtime_events
  File "./doc.mld", line 5, characters 15-40:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 8, characters 15-1381:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 11, characters 15-124:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 14, characters 15-1824:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 17, characters 15-1221:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 20, characters 15-85:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 23, characters 15-41:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 26, characters 15-38:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 29, characters 15-29:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 32, characters 15-448:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 35, characters 15-105:
  Warning: '{!modules ...}' should begin on its own line.
  File "./doc.mld", line 38, characters 15-124:
  Warning: '{!modules ...}' should begin on its own line.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/camlinternalFormatBasics.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/CamlinternalFormatBasics.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/camlinternalLazy.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/CamlinternalLazy.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Either.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Either.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Seq.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Seq.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Uchar.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Uchar.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Buffer.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Buffer.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  File "buffer.mli", line 35, character 0 to line 37, character 1:
  Warning: Alert unsynchronized_access not expected here.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Domain.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Domain.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Format.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Format.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Lazy.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Lazy.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Lexing.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Lexing.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Sys.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Sys.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/warnings.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Warnings.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/location.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Location.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/asttypes.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Asttypes.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/build_path_prefix_map.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Build_path_prefix_map.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Hashtbl.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Hashtbl.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  File "hashtbl.mli", line 26, character 0 to line 28, character 1:
  Warning: Alert unsynchronized_access not expected here.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Map.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Map.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Set.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Set.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/identifiable.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Identifiable.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/ident.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Ident.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/longident.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Longident.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Digest.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Digest.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__String.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__String.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/misc.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Misc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/parsetree.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Parsetree.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "parsing/parsetree.mli", line 590, characters 40-41:
  Warning: '.' is not allowed in '{ul ...}' (bulleted list).
  Suggestion: move '.' into a list item, '{li ...}' or '{- ...}'.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/type_immediacy.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Type_immediacy.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/outcometree.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Outcometree.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/path.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Path.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/primitive.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Primitive.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/shape.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Shape.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/types.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Types.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "typing/types.mli", line 16, characters 4-48:
  Warning: '{0': heading level should be lower than top heading level '0'.
  File "typing/types.mli", line 289, character 17 to line 295, character 48:
  Warning: '{ row_fields = [("X", _)];
                     row_more   =
                       Tvariant { row_fields = [("Y", _)];
                                  row_more   =
                                    Tvariant { row_fields = [];
                                               row_more   = _;
                                               _ }': bad markup.
  Suggestion: did you mean '{! row_fields = [("X", _)];
                     row_more   =
                       Tvariant { row_fields = [("Y", _)];
                                  row_more   =
                                    Tvariant { row_fields = [];
                                               row_more   = _;
                                               _ }' or '[ row_fields = [("X", _)];
                     row_more   =
                       Tvariant { row_fields = [("Y", _)];
                                  row_more   =
                                    Tvariant { row_fields = [];
                                               row_more   = _;
                                               _ ]'?
  File "typing/types.mli", line 296, characters 34-35:
  Warning: Unpaired '}' (end of markup).
  Suggestion: try '\}'.
  File "typing/types.mli", line 298, characters 17-18:
  Warning: Unpaired '}' (end of markup).
  Suggestion: try '\}'.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmi_format.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmi_format.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/load_path.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Load_path.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/subst.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Subst.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/env.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Env.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/genprintval.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Genprintval.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/pass_wrapper.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Pass_wrapper.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typedtree.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typedtree.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "typing/typedtree.mli", line 58, character 27 to line 59, character 75:
  Warning: '{ pat_desc = P
                             ; pat_extra = (Tpat_constraint T, _, _) :: ... }': bad markup.
  Suggestion: did you mean '{! pat_desc = P
                             ; pat_extra = (Tpat_constraint T, _, _) :: ... }' or '[ pat_desc = P
                             ; pat_extra = (Tpat_constraint T, _, _) :: ... ]'?
  File "typing/typedtree.mli", line 62, character 27 to line 63, character 80:
  Warning: '{ pat_desc = disjunction
                             ; pat_extra = (Tpat_type (P, "tconst"), _, _) :: ...}': bad markup.
  Suggestion: did you mean '{! pat_desc = disjunction
                             ; pat_extra = (Tpat_type (P, "tconst"), _, _) :: ...}' or '[ pat_desc = disjunction
                             ; pat_extra = (Tpat_type (P, "tconst"), _, _) :: ...]'?
  File "typing/typedtree.mli", line 70, character 27 to line 71, character 69:
  Warning: '{ pat_desc  = Tpat_var "P"
                             ; pat_extra = (Tpat_unpack, _, _) :: ... }': bad markup.
  Suggestion: did you mean '{! pat_desc  = Tpat_var "P"
                             ; pat_extra = (Tpat_unpack, _, _) :: ... }' or '[ pat_desc  = Tpat_var "P"
                             ; pat_extra = (Tpat_unpack, _, _) :: ... ]'?
  File "typing/typedtree.mli", line 114, characters 12-33:
  Warning: '{ l1=P1; ...; ln=Pn }': bad markup.
  Suggestion: did you mean '{! l1=P1; ...; ln=Pn }' or '[ l1=P1; ...; ln=Pn ]'?
  File "typing/typedtree.mli", line 115, characters 12-35:
  Warning: '{ l1=P1; ...; ln=Pn; _}': bad markup.
  Suggestion: did you mean '{! l1=P1; ...; ln=Pn; _}' or '[ l1=P1; ...; ln=Pn; _]'?
  File "typing/typedtree.mli", line 237, characters 12-33:
  Warning: '{ l1=P1; ...; ln=Pn }': bad markup.
  Suggestion: did you mean '{! l1=P1; ...; ln=Pn }' or '[ l1=P1; ...; ln=Pn ]'?
  File "typing/typedtree.mli", line 238, characters 12-41:
  Warning: '{ E0 with l1=P1; ...; ln=Pn }': bad markup.
  Suggestion: did you mean '{! E0 with l1=P1; ...; ln=Pn }' or '[ E0 with l1=P1; ...; ln=Pn ]'?
  File "typing/typedtree.mli", line 242, characters 27-45:
  Warning: '{ l1: t1; l2: t2 }': bad markup.
  Suggestion: did you mean '{! l1: t1; l2: t2 }' or '[ l1: t1; l2: t2 ]'?
  File "typing/typedtree.mli", line 243, characters 12-29:
  Warning: '{ E0 with t2=P2 }': bad markup.
  Suggestion: did you mean '{! E0 with t2=P2 }' or '[ E0 with t2=P2 ]'?
  File "typing/typedtree.mli", line 245, character 14 to line 246, character 47:
  Warning: '{ fields = [| l1, Kept t1; l2 Override P2 |]; representation;
                  extended_expression = Some E0 }': bad markup.
  Suggestion: did you mean '{! fields = [| l1, Kept t1; l2 Override P2 |]; representation;
                  extended_expression = Some E0 }' or '[ fields = [| l1, Kept t1; l2 Override P2 |]; representation;
                  extended_expression = Some E0 ]'?
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmt_format.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmt_format.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/debuginfo.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Debuginfo.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/backend_var.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Backend_var.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/lambda.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Lambda.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/targetint.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Targetint.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmm.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmm.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/afl_instrument.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Afl_instrument.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Int32.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Int32.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Obj.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Obj.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/topcommon.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Topcommon.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/topeval.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Topeval.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/translmod.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Translmod.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/allocated_const.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Allocated_const.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/clambda_primitives.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Clambda_primitives.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/linkage_name.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Linkage_name.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/compilation_unit.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Compilation_unit.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/internal_variable_names.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Internal_variable_names.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/variable.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Variable.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/closure_element.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Closure_element.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/closure_id.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Closure_id.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/closure_origin.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Closure_origin.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/export_id.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Export_id.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/mutable_variable.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Mutable_variable.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Int64.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Int64.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/numbers.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Numbers.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/parameter.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Parameter.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/var_within_closure.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Var_within_closure.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/projection.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Projection.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/set_of_closures_id.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Set_of_closures_id.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/set_of_closures_origin.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Set_of_closures_origin.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/static_exception.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Static_exception.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/symbol.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Symbol.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/tag.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Tag.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/flambda.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Flambda.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "middle_end/flambda/flambda.mli", line 393, character 27 to line 395, character 41:
  Warning: '{ f x ->
              let applied_function = Symbol f_closure in
              Apply (applied_function, x) }': bad markup.
  Suggestion: did you mean '{! f x ->
              let applied_function = Symbol f_closure in
              Apply (applied_function, x) }' or '[ f x ->
              let applied_function = Symbol f_closure in
              Apply (applied_function, x) ]'?
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/freshening.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Freshening.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/simple_value_approx.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Simple_value_approx.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "middle_end/flambda/simple_value_approx.mli", line 107, character 25 to line 109, character 0:
  Warning: Blank line is not allowed in '[...]' (code).
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/backend_intf.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Backend_intf.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/export_info.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Export_info.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/build_export_info.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Build_export_info.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/x86_ast.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/X86_ast.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/x86_gas.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/X86_gas.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Nativeint.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Nativeint.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Array.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Array.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/config.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Config.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/arch.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Arch.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/clambda.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Clambda.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/reg.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Reg.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/mach.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Mach.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/linear.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Linear.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/emitenv.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Emitenv.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/emitaux.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Emitaux.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/asmgen.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Asmgen.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/switch.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Switch.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_inherit.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_inherit.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Mutex.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Mutex.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Condition.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Condition.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inlining_cost.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inlining_cost.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inlining_stats_types.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inlining_stats_types.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inline_and_simplify_aux.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inline_and_simplify_aux.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inlining_decision_intf.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inlining_decision_intf.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/lift_code.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Lift_code.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/topdirs.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Topdirs.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Result.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Result.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/binutils.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Binutils.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/find_recursive_functions.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Find_recursive_functions.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/remove_unused_arguments.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Remove_unused_arguments.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/translobj.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Translobj.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmo_format.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmo_format.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/symtable.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Symtable.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/bytelink.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Bytelink.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printclambda.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printclambda.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Atomic.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Atomic.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/closure.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Closure.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/linearize.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Linearize.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_name.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_name.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_env.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_env.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/diffing.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Diffing.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/untypeast.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Untypeast.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_types.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_types.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_misc.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_misc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__List.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__List.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_parameter.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_parameter.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_value.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_value.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_class.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_class.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_type.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_type.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_exception.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_exception.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_extension.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_extension.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_global.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_global.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_module.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_module.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/str/str.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/Str.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_search.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_search.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_info.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_info.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  File "odoc_info.mli", line 106, characters 72-73:
  Warning: Stray '@'.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Int.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Int.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Printf.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Printf.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_messages.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_messages.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Filename.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Filename.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_dot.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_dot.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_parser.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_parser.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/instruct.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Instruct.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printinstr.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printinstr.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Semaphore.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Semaphore.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/emit.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Emit.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/linear_format.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Linear_format.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/pparse.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Pparse.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/local_store.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Local_store.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/topmain.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Topmain.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/arg_helper.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Arg_helper.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/errortrace.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Errortrace.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typetexp.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typetexp.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/asmlibrarian.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Asmlibrarian.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Printexc.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Printexc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Gc.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Gc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__BytesLabels.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__BytesLabels.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/dll.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Dll.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/branch_relaxation_intf.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Branch_relaxation_intf.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/tmc.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Tmc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "lambda/tmc.mli", line 30, character 4 to line 36, character 6:
  Warning: '{|
       let[@tail_mod_cons] rec map f = function
       | [] -> []
       | x :: xs ->
         let y = f x in
         y :: map f xs
      |}': bad markup.
  Suggestion: did you mean '{!|
       let[@tail_mod_cons] rec map f = function
       | [] -> []
       | x :: xs ->
         let y = f x in
         y :: map f xs
      |}' or '[|
       let[@tail_mod_cons] rec map f = function
       | [] -> []
       | x :: xs ->
         let y = f x in
         y :: map f xs
      |]'?
  File "lambda/tmc.mli", line 39, character 4 to line 54, character 6:
  Warning: '{|
       let rec map f = function
       | [] -> []
       | x :: xs ->
         let y = f x in
         let dst = y :: Placeholder in
         map_dps dst 1 f xs; dst
       and map_dps dst offset f = function
       | [] ->
         dst.offset <- []
       | x :: xs ->
         let y = f x in
         let dst' = y :: Placeholder in
         dst.offset <- dst';
         map_dps dst 1 f fx
      |}': bad markup.
  Suggestion: did you mean '{!|
       let rec map f = function
       | [] -> []
       | x :: xs ->
         let y = f x in
         let dst = y :: Placeholder in
         map_dps dst 1 f xs; dst
       and map_dps dst offset f = function
       | [] ->
         dst.offset <- []
       | x :: xs ->
         let y = f x in
         let dst' = y :: Placeholder in
         dst.offset <- dst';
         map_dps dst 1 f fx
      |}' or '[|
       let rec map f = function
       | [] -> []
       | x :: xs ->
         let y = f x in
         let dst = y :: Placeholder in
         map_dps dst 1 f xs; dst
       and map_dps dst offset f = function
       | [] ->
         dst.offset <- []
       | x :: xs ->
         let y = f x in
         let dst' = y :: Placeholder in
         dst.offset <- dst';
         map_dps dst 1 f fx
      |]'?
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/tast_iterator.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Tast_iterator.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/terminfo.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Terminfo.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Option.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Option.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/simplif.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Simplif.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmx_format.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmx_format.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/config_boot.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Config_boot.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Stack.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Stack.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  File "stack.mli", line 23, character 0 to line 25, character 1:
  Warning: Alert unsynchronized_accesses not expected here.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Complex.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Complex.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Bigarray.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Bigarray.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/unix/unix.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/unix/Unix.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/threads/thread.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/threads/Thread.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/unix/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_dag2html.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_dag2html.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Char.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Char.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_ocamlhtml.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_ocamlhtml.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_text.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_text.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_html.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_html.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_latex_style.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_latex_style.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_str.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_str.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_to_text.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_to_text.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_latex.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_latex.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_print.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_print.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_man.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_man.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Bytes.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Bytes.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_texi.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_texi.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_gen.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_gen.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Arg.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Arg.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_args.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_args.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/ref_to_variables.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Ref_to_variables.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/profile.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Profile.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/clflags.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Clflags.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/compile_common.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Compile_common.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/compile.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Compile.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "driver/compile.mli", line 24, characters 27-28:
  Warning: Paragraph should begin on its own line.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/closure_conversion_aux.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Closure_conversion_aux.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Fun.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Fun.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Weak.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Weak.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/ast_invariants.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Ast_invariants.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/emitcode.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Emitcode.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/strongly_connected_components.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Strongly_connected_components.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/main_args.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Main_args.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  File "driver/main_args.mli", line 271, characters 27-34:
  Warning: '{c,opt}': bad markup.
  Suggestion: did you mean '{!c,opt}' or '[c,opt]'?
  File "driver/main_args.mli", line 272, characters 22-29:
  Warning: '{c,opt}': bad markup.
  Suggestion: did you mean '{!c,opt}' or '[c,opt]'?
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__StringLabels.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__StringLabels.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/closure_middle_end.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Closure_middle_end.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_merge.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_merge.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/reloadgen.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Reloadgen.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_test.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_test.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/interval.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Interval.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typedecl_properties.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typedecl_properties.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typedecl_separability.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typedecl_separability.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_scan.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_scan.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/augment_specialised_args.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Augment_specialised_args.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/dataflow.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Dataflow.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__In_channel.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__In_channel.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/translclass.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Translclass.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/selection.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Selection.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/selectgen.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Selectgen.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typedecl_immediacy.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typedecl_immediacy.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Random.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Random.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typedecl_unboxed.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typedecl_unboxed.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inlining_stats.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inlining_stats.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/camlinternalOO.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/CamlinternalOO.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Oo.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Oo.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printpat.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printpat.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Callback.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Callback.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/runtimedef.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Runtimedef.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/proc.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Proc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/config_main.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Config_main.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_cross.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_cross.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Unit.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Unit.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/dynlink/dynlink.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/dynlink/Dynlink.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/x86_proc.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/X86_proc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/translcore.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Translcore.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/translprim.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Translprim.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/btype.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Btype.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/ctype.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Ctype.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printcmm.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printcmm.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/rec_check.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Rec_check.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/int_replace_polymorphic_compare.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Int_replace_polymorphic_compare.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/split.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Split.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/matching.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Matching.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmmgen_state.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmmgen_state.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/diffing_with_keys.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Diffing_with_keys.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/includecore.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Includecore.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/includemod.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Includemod.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typeclass.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typeclass.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/export_info_for_pack.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Export_info_for_pack.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/ccomp.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Ccomp.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/unbox_free_vars_of_closures.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Unbox_free_vars_of_closures.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/includemod_errorprinter.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Includemod_errorprinter.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/effect_analysis.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Effect_analysis.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/meta.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Meta.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/traverse_for_exported_symbols.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Traverse_for_exported_symbols.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typedecl_variance.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typedecl_variance.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typedecl.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typedecl.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typemod.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typemod.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/camlinternalMod.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/CamlinternalMod.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmxs_format.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmxs_format.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Float.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Float.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/opcodes.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Opcodes.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/mtype.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Mtype.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/builtin_attributes.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Builtin_attributes.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printtyp.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printtyp.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/simplify_boxed_integer_ops_intf.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Simplify_boxed_integer_ops_intf.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/simplify_boxed_integer_ops.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Simplify_boxed_integer_ops.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/convert_primitives.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Convert_primitives.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/camlinternalMenhirLib.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/CamlinternalMenhirLib.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/ast_iterator.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Ast_iterator.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/flambda_utils.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Flambda_utils.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/annot.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Annot.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/domainstate.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Domainstate.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/threads/event.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/threads/Event.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/lift_let_to_initialize_symbol.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Lift_let_to_initialize_symbol.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_config.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_config.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/linscan.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Linscan.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/unbox_closures.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Unbox_closures.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/flambda_to_clambda.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Flambda_to_clambda.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typeopt.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typeopt.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/liveness.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Liveness.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/id_types.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Id_types.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printlinear.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printlinear.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Queue.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Queue.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  File "queue.mli", line 23, character 0 to line 25, character 1:
  Warning: Alert unsynchronized_access not expected here.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/x86_masm.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/X86_masm.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/maindriver.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Maindriver.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/asmlink.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Asmlink.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/share_constants.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Share_constants.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/extract_projections.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Extract_projections.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/interf.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Interf.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/unbox_specialised_args.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Unbox_specialised_args.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__MoreLabels.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__MoreLabels.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  File "moreLabels.mli", line 43, character 2 to line 45, character 3:
  Warning: Alert unsynchronized_access not expected here.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/comballoc.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Comballoc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/flambda_invariants.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Flambda_invariants.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__StdLabels.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__StdLabels.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/schedgen.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Schedgen.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printast.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printast.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/patterns.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Patterns.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "typing/patterns.mli", line 101, characters 27-28:
  Warning: Unpaired ']' (end of code).
  Suggestion: try '\]'.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/bytegen.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Bytegen.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Marshal.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Marshal.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/depend.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Depend.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/un_anf.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Un_anf.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/semantics_of_primitives.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Semantics_of_primitives.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/docstrings.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Docstrings.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/parser.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Parser.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_see_lexer.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_see_lexer.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inline_and_simplify.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inline_and_simplify.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/optcompile.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Optcompile.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  File "driver/optcompile.mli", line 25, characters 27-28:
  Warning: Paragraph should begin on its own line.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__ArrayLabels.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__ArrayLabels.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/runtime_events/runtime_events.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/runtime_events/Runtime_events.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/reload.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Reload.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/lazy_backtrack.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Lazy_backtrack.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/datarepr.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Datarepr.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/bytesections.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Bytesections.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Effect.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Effect.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printtyped.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printtyped.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printmach.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printmach.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/signature_group.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Signature_group.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/parmatch.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Parmatch.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/optmaindriver.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Optmaindriver.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/compenv.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Compenv.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/asmpackager.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Asmpackager.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/lexer.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Lexer.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/ast_helper.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Ast_helper.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/consistbl.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Consistbl.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_comments.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_comments.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_comments_global.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_comments_global.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/stypes.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Stypes.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/oprint.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Oprint.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/envaux.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Envaux.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmt2annot.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmt2annot.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/topstart.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Topstart.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmm_invariants.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmm_invariants.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/bytelibrarian.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Bytelibrarian.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/strmatch.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Strmatch.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/simplify_primitives.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Simplify_primitives.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/ast_mapper.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Ast_mapper.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/deadcode.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Deadcode.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/persistent_env.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Persistent_env.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/optmain.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Optmain.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__ListLabels.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__ListLabels.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Parsing.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Parsing.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/flambda_middle_end.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Flambda_middle_end.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/coloring.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Coloring.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/closure_conversion.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Closure_conversion.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_lexer.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_lexer.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_sig.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_sig.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_ast.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_ast.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printlambda.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printlambda.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/polling.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Polling.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/lift_constants.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Lift_constants.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Ephemeron.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Ephemeron.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  File "ephemeron.mli", line 70, character 0 to line 72, character 1:
  Warning: Alert unsynchronized_access not expected here.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/translattribute.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Translattribute.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Scanf.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Scanf.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  File "scanf.mli", line 86, character 0 to line 88, character 1:
  Warning: Alert unsynchronized_access not expected here.
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmm_helpers.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmm_helpers.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/initialize_symbol_to_let_symbol.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Initialize_symbol_to_let_symbol.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inconstant_idents.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inconstant_idents.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/includeclass.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Includeclass.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamlmktop/ocamlmktop_init.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamlmktop/Ocamlmktop_init.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/closure_offsets.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Closure_offsets.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inlining_transforms.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inlining_transforms.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/std_exit.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Std_exit.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/simplify_common.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Simplify_common.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Bool.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Bool.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/CSEgen.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/CSEgen.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/tast_mapper.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Tast_mapper.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_analyse.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_analyse.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/camlinternalFormat.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/CamlinternalFormat.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/expunge.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Expunge.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/import_approx.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Import_approx.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/tophooks.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Tophooks.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/pprintast.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Pprintast.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/CSE.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/CSE.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/stdlib__Out_channel.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/Stdlib__Out_channel.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/spill.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Spill.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/typecore.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Typecore.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/predef.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Predef.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/errors.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Errors.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/compilenv.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Compilenv.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/flambda_iterators.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Flambda_iterators.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/inlining_decision.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Inlining_decision.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/syntaxerr.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Syntaxerr.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_dep.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_dep.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/alias_analysis.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Alias_analysis.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/scheduling.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Scheduling.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/compmisc.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Compmisc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/remove_free_vars_equal_to_args.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Remove_free_vars_equal_to_args.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/profiling/profiling.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/profiling/Profiling.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/toploop.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Toploop.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/dynlink/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_text_parser.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_text_parser.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_text_lexer.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_text_lexer.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/
                     -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/str/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/ocamldoc/odoc_control.cmi
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_control.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/remove_unused_program_constructs.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Remove_unused_program_constructs.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/opterrors.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Opterrors.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/attr_helper.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Attr_helper.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/bytepackager.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Bytepackager.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/cmmgen.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Cmmgen.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/parse.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Parse.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/main.cmt
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Main.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/trace.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Trace.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/unix/unixLabels.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/unix/UnixLabels.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/unix/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/branch_relaxation.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Branch_relaxation.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/invariant_params.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Invariant_params.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/x86_dsl.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/X86_dsl.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/remove_unused_closure_vars.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Remove_unused_closure_vars.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/printclambda_primitives.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Printclambda_primitives.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/
  compile command: odoc compile
                     prep/universes/80/ocaml-base-compiler/5.0.0/lib/ocaml/compiler-libs/makedepend.cmti
                     -o
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Makedepend.odoc
                     --parent "doc" -I compile/p/ocaml-base-compiler/5.0.0 -I
                     compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/
  No children
  File "compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Topeval.odoc":
  Warning: While resolving the expansion of include at File "toplevel/topeval.mli", line 48, character 0
  Failed to lookup type unresolvedroot(Topcommon).MakeEvalPrinter(identifier((root Topeval).{EvalBase}6, true)).gen_printer Parent_module: Unresolved apply
  File "compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/compiler-libs/Topeval.odoc":
  Warning: Failed to resolve module type path unresolvedroot(Topcommon).EVAL_BASE Find failure
  File "map.mli", line 223, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "typing/shape.mli", line 32, character 2
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "typing/shape.mli", line 32, character 2
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "parsing/parsetree.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/set_of_closures_id.mli", line 22, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/set_of_closures_id.mli", line 22, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "parsing/longident.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "utils/targetint.mli", line 28, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "utils/warnings.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "driver/pparse.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "utils/arg_helper.mli", line 24, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "odoc_info.mli", line 808, characters 28-55:
  Warning: Failed to resolve reference unresolvedroot(Odoc_args).hidden_modules Couldn't find "hidden_modules"
  File "utils/numbers.mli", line 20, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/numbers.mli", line 25, character 2
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/numbers.mli", line 25, character 2
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/variable.mli", line 29, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/variable.mli", line 29, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "lambda/tmc.mli", line 21, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "utils/terminfo.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "lambda/simplif.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "utils/config_boot.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/projection.mli", line 74, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/projection.mli", line 74, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/closure_id.mli", line 27, character 0
  While resolving the expansion of include at File "middle_end/flambda/base_types/closure_element.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/closure_id.mli", line 27, character 0
  While resolving the expansion of include at File "middle_end/flambda/base_types/closure_element.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/symbol.mli", line 29, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/symbol.mli", line 29, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "parsing/ast_invariants.mli", line 18, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/tag.mli", line 21, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/tag.mli", line 21, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "utils/strongly_connected_components.mli", line 20, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_ocamlhtml.odoc":
  Warning: Failed to lookup type unresolvedroot(Stdlib).Lexing.lex_tables Find failure
  File "typing/typedecl_separability.mli", line 126, characters 42-50:
  Warning: Reference to 'Error' is ambiguous. Please specify its kind: constructor-Error, exception-Error.
  File "typing/typedecl_separability.mli", line 111, characters 8-16:
  Warning: Reference to 'Error' is ambiguous. Please specify its kind: constructor-Error, exception-Error.
  File "utils/config_main.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "parsing/location.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "typing/ident.mli", line 20, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "typing/ident.mli", line 20, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/var_within_closure.mli", line 24, character 0
  While resolving the expansion of include at File "middle_end/flambda/base_types/closure_element.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/var_within_closure.mli", line 24, character 0
  While resolving the expansion of include at File "middle_end/flambda/base_types/closure_element.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "utils/ccomp.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/compilation_unit.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/compilation_unit.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "typing/typemod.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "parsing/builtin_attributes.mli", line 32, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "utils/build_path_prefix_map.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "parsing/ast_iterator.mli", line 22, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/static_exception.mli", line 22, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/static_exception.mli", line 22, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "utils/identifiable.mli", line 20, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Reference to 'Map' is ambiguous. Please specify its kind: module-Map, module-type-Map.
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Reference to 'Set' is ambiguous. Please specify its kind: module-Set, module-type-Set.
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Reference to 'Map' is ambiguous. Please specify its kind: module-Map, module-type-Map.
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Reference to 'Set' is ambiguous. Please specify its kind: module-Set, module-type-Set.
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Reference to 'Map' is ambiguous. Please specify its kind: module-Map, module-type-Map.
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Reference to 'Set' is ambiguous. Please specify its kind: module-Set, module-type-Set.
  File "stdlib.mli", line 25, characters 4-40:
  Warning: Multiple sections named 'modules' found. Please alter one to ensure reference is unambiguous. Locations:
    File "stdlib.mli", line 1383, character 4
    File "stdlib.mli", line 1383, character 4
  File "stdlib.mli", line 1342, characters 34-52:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 1227, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 1221, characters 23-41:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 816, characters 34-52:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 689, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 473, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 467, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 462, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 457, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 452, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 446, characters 24-42:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 441, characters 24-42:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 422, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 415, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 407, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 398, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 393, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 388, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 368, characters 34-52:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 356, characters 34-52:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 347, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 342, characters 37-55:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 337, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 325, characters 24-42:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 319, characters 24-42:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 307, characters 33-51:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 300, characters 32-50:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 225, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 218, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 205, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 200, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 159, characters 34-52:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 147, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 142, characters 36-54:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 137, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 132, characters 35-53:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "stdlib.mli", line 128, characters 34-52:
  Warning: Failed to resolve reference unresolvedroot(Ocaml_operators) Couldn't find "Ocaml_operators"
  File "parsing/printast.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "parsing/depend.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_see_lexer.odoc":
  Warning: Failed to lookup type unresolvedroot(Stdlib).Lexing.lex_tables Find failure
  File "parsing/asttypes.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "set.mli", line 189, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "typing/signature_group.mli", line 58, characters 43-54:
  Warning: Failed to resolve reference unresolvedroot(full_seq) Couldn't find "full_seq"
  File "map.mli", line 223, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "parsing/lexer.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "parsing/ast_helper.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "utils/consistbl.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "parsing/ast_mapper.mli", line 50, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/linkage_name.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/linkage_name.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/closure_element.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/closure_element.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "parsing/docstrings.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_lexer.odoc":
  Warning: Failed to lookup type unresolvedroot(Stdlib).Lexing.lex_tables Find failure
  File "utils/misc.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "map.mli", line 223, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "string.mli", line 122, characters 18-33:
  Warning: While resolving the expansion of include at File "utils/misc.mli", line 166, character 4
  Failed to resolve reference unresolvedroot(Stdlib).(^) Couldn't find "(^)"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/closure_origin.mli", line 17, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/closure_origin.mli", line 17, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "utils/profile.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "parsing/pprintast.mli", line 20, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "parsing/syntaxerr.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "typing/typedtree.mli", line 20, characters 12-27:
  Warning: Failed to resolve reference unresolvedroot(Longindent).t Couldn't find "Longindent"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/set_of_closures_origin.mli", line 17, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/set_of_closures_origin.mli", line 17, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/mutable_variable.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/mutable_variable.mli", line 19, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/parameter.mli", line 45, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/parameter.mli", line 41, character 2
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "compile/p/ocaml-base-compiler/5.0.0/5.0.0/lib/ocaml/ocamldoc/Odoc_text_lexer.odoc":
  Warning: Failed to lookup type unresolvedroot(Stdlib).Lexing.lex_tables Find failure
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/export_id.mli", line 24, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "middle_end/flambda/base_types/export_id.mli", line 24, character 0
  While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "map.mli", line 223, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 51, character 2
  Failed to resolve reference unresolvedroot(Map).Make Couldn't find "Make"
  File "set.mli", line 189, characters 16-27:
  Warning: While resolving the expansion of include at File "utils/identifiable.mli", line 38, character 2
  Failed to resolve reference unresolvedroot(Set).Make Couldn't find "Make"
  File "parsing/attr_helper.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "utils/config.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "parsing/parse.mli", line 19, characters 2-33:
  Warning: Failed to resolve reference unresolvedroot(Compiler_libs) Couldn't find "Compiler_libs"
  File "./doc.mld", line 35, characters 15-105:
  Warning: Failed to resolve reference unresolvedroot(Dynlink_common) Parent_module: Lookup failure (root module): Dynlink_common
  File "./doc.mld", line 35, characters 15-105:
  Warning: Failed to resolve reference unresolvedroot(Dynlink_platform_intf) Parent_module: Lookup failure (root module): Dynlink_platform_intf
  File "./doc.mld", line 35, characters 15-105:
  Warning: Failed to resolve reference unresolvedroot(Dynlink_types) Parent_module: Lookup failure (root module): Dynlink_types
  File "./doc.mld", line 35, characters 15-105:
  Warning: Failed to resolve reference unresolvedroot(Dynlink_compilerlibs) Parent_module: Lookup failure (root module): Dynlink_compilerlibs
  0 other files to copy
  dst: linked/p/ocaml-base-compiler/5.0.0/doc/opam
  $ voodoo-gen -o output
  0 other versons, 1 packages
  Found 340 files

Generates a package.json file
  $ cat output/p/ocaml-base-compiler/5.0.0/package.json
  {"libraries":[{"name":"runtime_events","modules":[{"name":"Runtime_events","submodules":[{"name":"Callbacks","submodules":[],"kind":"module"},{"name":"Timestamp","submodules":[],"kind":"module"}],"kind":"module"}]},{"name":"ocamlmiddleend","modules":[{"name":"Internal_variable_names","submodules":[],"kind":"module"},{"name":"Linkage_name","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Compilation_unit","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Variable","submodules":[{"name":"Pair","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Closure_element","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Closure_id","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Symbol","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Backend_var","submodules":[{"name":"With_provenance","submodules":[],"kind":"module"},{"name":"Provenance","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Clambda_primitives","submodules":[],"kind":"module"},{"name":"Printclambda_primitives","submodules":[],"kind":"module"},{"name":"Clambda","submodules":[],"kind":"module"},{"name":"Printclambda","submodules":[],"kind":"module"},{"name":"Semantics_of_primitives","submodules":[],"kind":"module"},{"name":"Convert_primitives","submodules":[],"kind":"module"},{"name":"Id_types","submodules":[{"name":"UnitId","submodules":[{"name":"Compilation_unit","submodules":[],"kind":"argument-2"},{"name":"_","submodules":[],"kind":"argument-1"},{"name":"Compilation_unit","submodules":[],"kind":"argument-2"}],"kind":"module"},{"name":"Id","submodules":[],"kind":"module"},{"name":"UnitId","submodules":[{"name":"Compilation_unit","submodules":[],"kind":"argument-2"},{"name":"_","submodules":[],"kind":"argument-1"},{"name":"Compilation_unit","submodules":[],"kind":"argument-2"}],"kind":"module"},{"name":"Id","submodules":[],"kind":"module"},{"name":"BaseId","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Export_id","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Tag","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Mutable_variable","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Set_of_closures_id","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Set_of_closures_origin","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Closure_origin","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Var_within_closure","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Static_exception","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Pass_wrapper","submodules":[],"kind":"module"},{"name":"Allocated_const","submodules":[],"kind":"module"},{"name":"Parameter","submodules":[{"name":"List","submodules":[],"kind":"module"},{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Projection","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Flambda","submodules":[{"name":"With_free_variables","submodules":[],"kind":"module"},{"name":"Constant_defining_value","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"}],"kind":"module"},{"name":"Flambda_iterators","submodules":[],"kind":"module"},{"name":"Flambda_utils","submodules":[{"name":"Switch_storer","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Freshening","submodules":[{"name":"Project_var","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Effect_analysis","submodules":[],"kind":"module"},{"name":"Inlining_cost","submodules":[{"name":"Whether_sufficient_benefit","submodules":[],"kind":"module"},{"name":"Benefit","submodules":[],"kind":"module"},{"name":"Threshold","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Simple_value_approx","submodules":[],"kind":"module"},{"name":"Export_info","submodules":[],"kind":"module"},{"name":"Export_info_for_pack","submodules":[],"kind":"module"},{"name":"Compilenv","submodules":[],"kind":"module"},{"name":"Closure","submodules":[],"kind":"module"},{"name":"Closure_middle_end","submodules":[],"kind":"module"},{"name":"Import_approx","submodules":[],"kind":"module"},{"name":"Lift_code","submodules":[],"kind":"module"},{"name":"Closure_conversion_aux","submodules":[{"name":"Function_decls","submodules":[{"name":"Function_decl","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Env","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Closure_conversion","submodules":[],"kind":"module"},{"name":"Initialize_symbol_to_let_symbol","submodules":[],"kind":"module"},{"name":"Lift_let_to_initialize_symbol","submodules":[],"kind":"module"},{"name":"Find_recursive_functions","submodules":[],"kind":"module"},{"name":"Invariant_params","submodules":[],"kind":"module"},{"name":"Inconstant_idents","submodules":[],"kind":"module"},{"name":"Alias_analysis","submodules":[],"kind":"module"},{"name":"Lift_constants","submodules":[],"kind":"module"},{"name":"Share_constants","submodules":[],"kind":"module"},{"name":"Simplify_common","submodules":[],"kind":"module"},{"name":"Remove_unused_arguments","submodules":[],"kind":"module"},{"name":"Remove_unused_closure_vars","submodules":[],"kind":"module"},{"name":"Remove_unused_program_constructs","submodules":[],"kind":"module"},{"name":"Simplify_boxed_integer_ops","submodules":[{"name":"Simplify_boxed_int64","submodules":[],"kind":"module"},{"name":"Simplify_boxed_int32","submodules":[],"kind":"module"},{"name":"Simplify_boxed_nativeint","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Simplify_primitives","submodules":[],"kind":"module"},{"name":"Inlining_stats_types","submodules":[{"name":"Decision","submodules":[],"kind":"module"},{"name":"Prevented","submodules":[],"kind":"module"},{"name":"Not_specialised","submodules":[],"kind":"module"},{"name":"Specialised","submodules":[],"kind":"module"},{"name":"Not_inlined","submodules":[],"kind":"module"},{"name":"Inlined","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Inlining_stats","submodules":[{"name":"Closure_stack","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Inline_and_simplify_aux","submodules":[{"name":"Result","submodules":[],"kind":"module"},{"name":"Env","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Remove_free_vars_equal_to_args","submodules":[],"kind":"module"},{"name":"Extract_projections","submodules":[],"kind":"module"},{"name":"Augment_specialised_args","submodules":[{"name":"Make","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"What_to_specialise","submodules":[],"kind":"module"},{"name":"Definition","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Unbox_free_vars_of_closures","submodules":[],"kind":"module"},{"name":"Unbox_specialised_args","submodules":[],"kind":"module"},{"name":"Unbox_closures","submodules":[],"kind":"module"},{"name":"Inlining_transforms","submodules":[],"kind":"module"},{"name":"Inlining_decision","submodules":[],"kind":"module"},{"name":"Inline_and_simplify","submodules":[],"kind":"module"},{"name":"Ref_to_variables","submodules":[],"kind":"module"},{"name":"Flambda_invariants","submodules":[],"kind":"module"},{"name":"Traverse_for_exported_symbols","submodules":[],"kind":"module"},{"name":"Build_export_info","submodules":[],"kind":"module"},{"name":"Closure_offsets","submodules":[],"kind":"module"},{"name":"Un_anf","submodules":[],"kind":"module"},{"name":"Flambda_to_clambda","submodules":[],"kind":"module"},{"name":"Flambda_middle_end","submodules":[],"kind":"module"}]},{"name":"ocamlbytecomp","modules":[{"name":"Instruct","submodules":[],"kind":"module"},{"name":"Bytegen","submodules":[],"kind":"module"},{"name":"Printinstr","submodules":[],"kind":"module"},{"name":"Emitcode","submodules":[],"kind":"module"},{"name":"Bytelink","submodules":[],"kind":"module"},{"name":"Bytelibrarian","submodules":[],"kind":"module"},{"name":"Bytepackager","submodules":[],"kind":"module"},{"name":"Errors","submodules":[],"kind":"module"},{"name":"Compile","submodules":[],"kind":"module"},{"name":"Maindriver","submodules":[],"kind":"module"}]},{"name":"ocamloptcomp","modules":[{"name":"Internal_variable_names","submodules":[],"kind":"module"},{"name":"Linkage_name","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Compilation_unit","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Variable","submodules":[{"name":"Pair","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Closure_element","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Closure_id","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Symbol","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Backend_var","submodules":[{"name":"With_provenance","submodules":[],"kind":"module"},{"name":"Provenance","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Clambda_primitives","submodules":[],"kind":"module"},{"name":"Printclambda_primitives","submodules":[],"kind":"module"},{"name":"Clambda","submodules":[],"kind":"module"},{"name":"Printclambda","submodules":[],"kind":"module"},{"name":"Semantics_of_primitives","submodules":[],"kind":"module"},{"name":"Convert_primitives","submodules":[],"kind":"module"},{"name":"Id_types","submodules":[{"name":"UnitId","submodules":[{"name":"Compilation_unit","submodules":[],"kind":"argument-2"},{"name":"_","submodules":[],"kind":"argument-1"},{"name":"Compilation_unit","submodules":[],"kind":"argument-2"}],"kind":"module"},{"name":"Id","submodules":[],"kind":"module"},{"name":"UnitId","submodules":[{"name":"Compilation_unit","submodules":[],"kind":"argument-2"},{"name":"_","submodules":[],"kind":"argument-1"},{"name":"Compilation_unit","submodules":[],"kind":"argument-2"}],"kind":"module"},{"name":"Id","submodules":[],"kind":"module"},{"name":"BaseId","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Export_id","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Tag","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Mutable_variable","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Set_of_closures_id","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Set_of_closures_origin","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Closure_origin","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Var_within_closure","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Static_exception","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Pass_wrapper","submodules":[],"kind":"module"},{"name":"Allocated_const","submodules":[],"kind":"module"},{"name":"Parameter","submodules":[{"name":"List","submodules":[],"kind":"module"},{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Projection","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Flambda","submodules":[{"name":"With_free_variables","submodules":[],"kind":"module"},{"name":"Constant_defining_value","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"}],"kind":"module"},{"name":"Flambda_iterators","submodules":[],"kind":"module"},{"name":"Flambda_utils","submodules":[{"name":"Switch_storer","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Freshening","submodules":[{"name":"Project_var","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Effect_analysis","submodules":[],"kind":"module"},{"name":"Inlining_cost","submodules":[{"name":"Whether_sufficient_benefit","submodules":[],"kind":"module"},{"name":"Benefit","submodules":[],"kind":"module"},{"name":"Threshold","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Simple_value_approx","submodules":[],"kind":"module"},{"name":"Export_info","submodules":[],"kind":"module"},{"name":"Export_info_for_pack","submodules":[],"kind":"module"},{"name":"Compilenv","submodules":[],"kind":"module"},{"name":"Closure","submodules":[],"kind":"module"},{"name":"Closure_middle_end","submodules":[],"kind":"module"},{"name":"Import_approx","submodules":[],"kind":"module"},{"name":"Lift_code","submodules":[],"kind":"module"},{"name":"Closure_conversion_aux","submodules":[{"name":"Function_decls","submodules":[{"name":"Function_decl","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Env","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Closure_conversion","submodules":[],"kind":"module"},{"name":"Initialize_symbol_to_let_symbol","submodules":[],"kind":"module"},{"name":"Lift_let_to_initialize_symbol","submodules":[],"kind":"module"},{"name":"Find_recursive_functions","submodules":[],"kind":"module"},{"name":"Invariant_params","submodules":[],"kind":"module"},{"name":"Inconstant_idents","submodules":[],"kind":"module"},{"name":"Alias_analysis","submodules":[],"kind":"module"},{"name":"Lift_constants","submodules":[],"kind":"module"},{"name":"Share_constants","submodules":[],"kind":"module"},{"name":"Simplify_common","submodules":[],"kind":"module"},{"name":"Remove_unused_arguments","submodules":[],"kind":"module"},{"name":"Remove_unused_closure_vars","submodules":[],"kind":"module"},{"name":"Remove_unused_program_constructs","submodules":[],"kind":"module"},{"name":"Simplify_boxed_integer_ops","submodules":[{"name":"Simplify_boxed_int64","submodules":[],"kind":"module"},{"name":"Simplify_boxed_int32","submodules":[],"kind":"module"},{"name":"Simplify_boxed_nativeint","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Simplify_primitives","submodules":[],"kind":"module"},{"name":"Inlining_stats_types","submodules":[{"name":"Decision","submodules":[],"kind":"module"},{"name":"Prevented","submodules":[],"kind":"module"},{"name":"Not_specialised","submodules":[],"kind":"module"},{"name":"Specialised","submodules":[],"kind":"module"},{"name":"Not_inlined","submodules":[],"kind":"module"},{"name":"Inlined","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Inlining_stats","submodules":[{"name":"Closure_stack","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Inline_and_simplify_aux","submodules":[{"name":"Result","submodules":[],"kind":"module"},{"name":"Env","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Remove_free_vars_equal_to_args","submodules":[],"kind":"module"},{"name":"Extract_projections","submodules":[],"kind":"module"},{"name":"Augment_specialised_args","submodules":[{"name":"Make","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"What_to_specialise","submodules":[],"kind":"module"},{"name":"Definition","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Unbox_free_vars_of_closures","submodules":[],"kind":"module"},{"name":"Unbox_specialised_args","submodules":[],"kind":"module"},{"name":"Unbox_closures","submodules":[],"kind":"module"},{"name":"Inlining_transforms","submodules":[],"kind":"module"},{"name":"Inlining_decision","submodules":[],"kind":"module"},{"name":"Inline_and_simplify","submodules":[],"kind":"module"},{"name":"Ref_to_variables","submodules":[],"kind":"module"},{"name":"Flambda_invariants","submodules":[],"kind":"module"},{"name":"Traverse_for_exported_symbols","submodules":[],"kind":"module"},{"name":"Build_export_info","submodules":[],"kind":"module"},{"name":"Closure_offsets","submodules":[],"kind":"module"},{"name":"Un_anf","submodules":[],"kind":"module"},{"name":"Flambda_to_clambda","submodules":[],"kind":"module"},{"name":"Flambda_middle_end","submodules":[],"kind":"module"},{"name":"Arch","submodules":[],"kind":"module"},{"name":"Cmm","submodules":[],"kind":"module"},{"name":"Printcmm","submodules":[],"kind":"module"},{"name":"Reg","submodules":[{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"Raw_name","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Mach","submodules":[],"kind":"module"},{"name":"Proc","submodules":[],"kind":"module"},{"name":"Afl_instrument","submodules":[],"kind":"module"},{"name":"Strmatch","submodules":[{"name":"Make","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"I","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Cmmgen_state","submodules":[],"kind":"module"},{"name":"Cmm_helpers","submodules":[],"kind":"module"},{"name":"Cmmgen","submodules":[],"kind":"module"},{"name":"Cmm_invariants","submodules":[],"kind":"module"},{"name":"Interval","submodules":[],"kind":"module"},{"name":"Printmach","submodules":[],"kind":"module"},{"name":"Dataflow","submodules":[{"name":"Backward","submodules":[{"name":"D","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"DOMAIN","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Polling","submodules":[],"kind":"module"},{"name":"Selectgen","submodules":[{"name":"selector_generic","submodules":[],"kind":"class"},{"name":"Effect_and_coeffect","submodules":[],"kind":"module"},{"name":"Coeffect","submodules":[],"kind":"module"},{"name":"Effect","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Selection","submodules":[],"kind":"module"},{"name":"Comballoc","submodules":[],"kind":"module"},{"name":"CSEgen","submodules":[{"name":"cse_generic","submodules":[],"kind":"class"}],"kind":"module"},{"name":"CSE","submodules":[{"name":"cse","submodules":[],"kind":"class"}],"kind":"module"},{"name":"Liveness","submodules":[],"kind":"module"},{"name":"Spill","submodules":[],"kind":"module"},{"name":"Split","submodules":[],"kind":"module"},{"name":"Interf","submodules":[],"kind":"module"},{"name":"Coloring","submodules":[],"kind":"module"},{"name":"Linscan","submodules":[],"kind":"module"},{"name":"Reloadgen","submodules":[{"name":"reload_generic","submodules":[],"kind":"class"}],"kind":"module"},{"name":"Reload","submodules":[],"kind":"module"},{"name":"Deadcode","submodules":[],"kind":"module"},{"name":"Linear","submodules":[],"kind":"module"},{"name":"Printlinear","submodules":[],"kind":"module"},{"name":"Linearize","submodules":[],"kind":"module"},{"name":"Linear_format","submodules":[],"kind":"module"},{"name":"Schedgen","submodules":[{"name":"scheduler_generic","submodules":[],"kind":"class"}],"kind":"module"},{"name":"Scheduling","submodules":[],"kind":"module"},{"name":"Branch_relaxation_intf","submodules":[{"name":"S","submodules":[{"name":"Cond_branch","submodules":[],"kind":"module"}],"kind":"module-type"}],"kind":"module"},{"name":"Branch_relaxation","submodules":[{"name":"Make","submodules":[{"name":"T","submodules":[{"name":"Cond_branch","submodules":[],"kind":"module"}],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"Emitaux","submodules":[],"kind":"module"},{"name":"Emit","submodules":[],"kind":"module"},{"name":"Asmgen","submodules":[],"kind":"module"},{"name":"Asmlink","submodules":[],"kind":"module"},{"name":"Asmlibrarian","submodules":[],"kind":"module"},{"name":"Asmpackager","submodules":[],"kind":"module"},{"name":"Opterrors","submodules":[],"kind":"module"},{"name":"Optcompile","submodules":[],"kind":"module"},{"name":"Optmaindriver","submodules":[],"kind":"module"}]},{"name":"ocamlcommon","modules":[{"name":"Config","submodules":[],"kind":"module"},{"name":"Build_path_prefix_map","submodules":[],"kind":"module"},{"name":"Misc","submodules":[{"name":"Magic_number","submodules":[],"kind":"module"},{"name":"Error_style","submodules":[],"kind":"module"},{"name":"Color","submodules":[],"kind":"module"},{"name":"LongString","submodules":[],"kind":"module"},{"name":"Int_literal_converter","submodules":[],"kind":"module"},{"name":"Stdlib","submodules":[{"name":"String","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Array","submodules":[],"kind":"module"},{"name":"Option","submodules":[],"kind":"module"},{"name":"List","submodules":[],"kind":"module"}],"kind":"module"}],"kind":"module"},{"name":"Identifiable","submodules":[{"name":"Make","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"S","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module-type"},{"name":"Tbl","submodules":[{"name":"T","submodules":[],"kind":"module"}],"kind":"module-type"},{"name":"Map","submodules":[{"name":"T","submodules":[],"kind":"module"}],"kind":"module-type"},{"name":"Set","submodules":[{"name":"T","submodules":[],"kind":"module"}],"kind":"module-type"},{"name":"Pair","submodules":[{"name":"B","submodules":[],"kind":"argument-2"},{"name":"A","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Thing","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Numbers","submodules":[{"name":"Float","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Int16","submodules":[],"kind":"module"},{"name":"Int8","submodules":[],"kind":"module"},{"name":"Int","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"}],"kind":"module"},{"name":"Arg_helper","submodules":[{"name":"Make","submodules":[{"name":"S","submodules":[{"name":"Value","submodules":[],"kind":"module"},{"name":"Key","submodules":[{"name":"Map","submodules":[],"kind":"module"}],"kind":"module"}],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"Local_store","submodules":[],"kind":"module"},{"name":"Load_path","submodules":[{"name":"Dir","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Clflags","submodules":[{"name":"Compiler_pass","submodules":[],"kind":"module"},{"name":"Float_arg_helper","submodules":[],"kind":"module"},{"name":"Int_arg_helper","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Profile","submodules":[],"kind":"module"},{"name":"Terminfo","submodules":[],"kind":"module"},{"name":"Ccomp","submodules":[],"kind":"module"},{"name":"Warnings","submodules":[],"kind":"module"},{"name":"Consistbl","submodules":[{"name":"Make","submodules":[{"name":"Module_name","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"}],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"Strongly_connected_components","submodules":[{"name":"Make","submodules":[{"name":"Id","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[{"name":"Id","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"}],"kind":"module-type"}],"kind":"module"},{"name":"Targetint","submodules":[],"kind":"module"},{"name":"Int_replace_polymorphic_compare","submodules":[],"kind":"module"},{"name":"Domainstate","submodules":[],"kind":"module"},{"name":"Binutils","submodules":[],"kind":"module"},{"name":"Lazy_backtrack","submodules":[],"kind":"module"},{"name":"Diffing","submodules":[{"name":"Define","submodules":[{"name":"Right_variadic","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Left_variadic","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Simple","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"Parameters","submodules":[],"kind":"module-type"},{"name":"D","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Defs","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Diffing_with_keys","submodules":[{"name":"Define","submodules":[{"name":"Simple","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Parameters","submodules":[],"kind":"module-type"},{"name":"D","submodules":[],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"Location","submodules":[],"kind":"module"},{"name":"Longident","submodules":[],"kind":"module"},{"name":"Docstrings","submodules":[{"name":"WithMenhir","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Syntaxerr","submodules":[],"kind":"module"},{"name":"Ast_helper","submodules":[{"name":"Of","submodules":[],"kind":"module"},{"name":"Rf","submodules":[],"kind":"module"},{"name":"Cstr","submodules":[],"kind":"module"},{"name":"Csig","submodules":[],"kind":"module"},{"name":"Ci","submodules":[],"kind":"module"},{"name":"Cf","submodules":[],"kind":"module"},{"name":"Cl","submodules":[],"kind":"module"},{"name":"Ctf","submodules":[],"kind":"module"},{"name":"Cty","submodules":[],"kind":"module"},{"name":"Vb","submodules":[],"kind":"module"},{"name":"Incl","submodules":[],"kind":"module"},{"name":"Opn","submodules":[],"kind":"module"},{"name":"Mb","submodules":[],"kind":"module"},{"name":"Mtd","submodules":[],"kind":"module"},{"name":"Ms","submodules":[],"kind":"module"},{"name":"Md","submodules":[],"kind":"module"},{"name":"Str","submodules":[],"kind":"module"},{"name":"Sig","submodules":[],"kind":"module"},{"name":"Mod","submodules":[],"kind":"module"},{"name":"Mty","submodules":[],"kind":"module"},{"name":"Te","submodules":[],"kind":"module"},{"name":"Type","submodules":[],"kind":"module"},{"name":"Val","submodules":[],"kind":"module"},{"name":"Exp","submodules":[],"kind":"module"},{"name":"Pat","submodules":[],"kind":"module"},{"name":"Typ","submodules":[],"kind":"module"},{"name":"Attr","submodules":[],"kind":"module"},{"name":"Const","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Pprintast","submodules":[],"kind":"module"},{"name":"CamlinternalMenhirLib","submodules":[{"name":"StaticVersion","submodules":[],"kind":"module"},{"name":"TableInterpreter","submodules":[{"name":"MakeEngineTable","submodules":[{"name":"Log","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"InspectionTableInterpreter","submodules":[{"name":"Make","submodules":[{"name":"E","submodules":[],"kind":"argument-4"},{"name":"ET","submodules":[{"name":"Log","submodules":[],"kind":"module"}],"kind":"argument-3"},{"name":"IT","submodules":[],"kind":"argument-2"},{"name":"TT","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Symbols","submodules":[{"name":"T","submodules":[],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"InspectionTableFormat","submodules":[{"name":"TABLES","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"TableFormat","submodules":[{"name":"TABLES","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"LinearizedArray","submodules":[],"kind":"module"},{"name":"RowDisplacement","submodules":[],"kind":"module"},{"name":"PackedIntArray","submodules":[],"kind":"module"},{"name":"InfiniteArray","submodules":[],"kind":"module"},{"name":"Printers","submodules":[{"name":"Make","submodules":[{"name":"User","submodules":[],"kind":"argument-2"},{"name":"I","submodules":[],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"LexerUtil","submodules":[],"kind":"module"},{"name":"ErrorReports","submodules":[],"kind":"module"},{"name":"Engine","submodules":[{"name":"Make","submodules":[{"name":"T","submodules":[{"name":"Log","submodules":[],"kind":"module"}],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"EngineTypes","submodules":[{"name":"ENGINE","submodules":[],"kind":"module-type"},{"name":"INCREMENTAL_ENGINE_START","submodules":[],"kind":"module-type"},{"name":"MONOLITHIC_ENGINE","submodules":[],"kind":"module-type"},{"name":"TABLE","submodules":[{"name":"Log","submodules":[],"kind":"module"}],"kind":"module-type"}],"kind":"module"},{"name":"IncrementalEngine","submodules":[{"name":"EVERYTHING","submodules":[],"kind":"module-type"},{"name":"INSPECTION","submodules":[],"kind":"module-type"},{"name":"SYMBOLS","submodules":[],"kind":"module-type"},{"name":"INCREMENTAL_ENGINE","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Convert","submodules":[{"name":"Simplified","submodules":[],"kind":"module"}],"kind":"module"},{"name":"General","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Parser","submodules":[{"name":"Incremental","submodules":[],"kind":"module"},{"name":"MenhirInterpreter","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Lexer","submodules":[],"kind":"module"},{"name":"Parse","submodules":[],"kind":"module"},{"name":"Printast","submodules":[],"kind":"module"},{"name":"Ast_mapper","submodules":[],"kind":"module"},{"name":"Ast_iterator","submodules":[],"kind":"module"},{"name":"Attr_helper","submodules":[],"kind":"module"},{"name":"Builtin_attributes","submodules":[],"kind":"module"},{"name":"Ast_invariants","submodules":[],"kind":"module"},{"name":"Depend","submodules":[],"kind":"module"},{"name":"Ident","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Path","submodules":[{"name":"Set","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Primitive","submodules":[],"kind":"module"},{"name":"Type_immediacy","submodules":[{"name":"Violation","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Shape","submodules":[{"name":"Make_reduce","submodules":[{"name":"Context","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Item","submodules":[{"name":"Map","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Sig_component_kind","submodules":[],"kind":"module"},{"name":"Uid","submodules":[{"name":"Tbl","submodules":[],"kind":"module"},{"name":"Map","submodules":[],"kind":"module"},{"name":"Set","submodules":[],"kind":"module"},{"name":"T","submodules":[],"kind":"module"}],"kind":"module"}],"kind":"module"},{"name":"Types","submodules":[{"name":"Separability","submodules":[],"kind":"module"},{"name":"Variance","submodules":[],"kind":"module"},{"name":"Vars","submodules":[],"kind":"module"},{"name":"Meths","submodules":[],"kind":"module"},{"name":"VarSet","submodules":[],"kind":"module"},{"name":"MethSet","submodules":[],"kind":"module"},{"name":"TransientTypeOps","submodules":[],"kind":"module"},{"name":"Transient_expr","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Btype","submodules":[{"name":"For_copy","submodules":[],"kind":"module"},{"name":"TypePairs","submodules":[],"kind":"module"},{"name":"TypeHash","submodules":[],"kind":"module"},{"name":"TypeMap","submodules":[],"kind":"module"},{"name":"TransientTypeMap","submodules":[],"kind":"module"},{"name":"TypeSet","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Oprint","submodules":[],"kind":"module"},{"name":"Subst","submodules":[{"name":"Lazy","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Predef","submodules":[],"kind":"module"},{"name":"Datarepr","submodules":[],"kind":"module"},{"name":"Cmi_format","submodules":[],"kind":"module"},{"name":"Persistent_env","submodules":[{"name":"Persistent_signature","submodules":[],"kind":"module"},{"name":"Consistbl","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Env","submodules":[],"kind":"module"},{"name":"Errortrace","submodules":[{"name":"Subtype","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Typedtree","submodules":[],"kind":"module"},{"name":"Signature_group","submodules":[],"kind":"module"},{"name":"Printtyped","submodules":[],"kind":"module"},{"name":"Ctype","submodules":[],"kind":"module"},{"name":"Printtyp","submodules":[{"name":"Subtype","submodules":[],"kind":"module"},{"name":"Conflicts","submodules":[],"kind":"module"},{"name":"Naming_context","submodules":[],"kind":"module"},{"name":"Out_name","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Includeclass","submodules":[],"kind":"module"},{"name":"Mtype","submodules":[],"kind":"module"},{"name":"Envaux","submodules":[],"kind":"module"},{"name":"Includecore","submodules":[],"kind":"module"},{"name":"Tast_iterator","submodules":[],"kind":"module"},{"name":"Tast_mapper","submodules":[],"kind":"module"},{"name":"Stypes","submodules":[],"kind":"module"},{"name":"Cmt_format","submodules":[],"kind":"module"},{"name":"Cmt2annot","submodules":[],"kind":"module"},{"name":"Untypeast","submodules":[],"kind":"module"},{"name":"Includemod","submodules":[{"name":"Functor_app_diff","submodules":[{"name":"Defs","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Functor_inclusion_diff","submodules":[{"name":"Defs","submodules":[],"kind":"module"}],"kind":"module"},{"name":"FieldMap","submodules":[],"kind":"module"},{"name":"Error","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Includemod_errorprinter","submodules":[],"kind":"module"},{"name":"Typetexp","submodules":[],"kind":"module"},{"name":"Printpat","submodules":[],"kind":"module"},{"name":"Patterns","submodules":[{"name":"Head","submodules":[],"kind":"module"},{"name":"General","submodules":[],"kind":"module"},{"name":"Half_simple","submodules":[],"kind":"module"},{"name":"Simple","submodules":[],"kind":"module"},{"name":"Non_empty_row","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Parmatch","submodules":[{"name":"Compat","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"Typedecl_properties","submodules":[],"kind":"module"},{"name":"Typedecl_variance","submodules":[],"kind":"module"},{"name":"Typedecl_unboxed","submodules":[],"kind":"module"},{"name":"Typedecl_immediacy","submodules":[],"kind":"module"},{"name":"Typedecl_separability","submodules":[],"kind":"module"},{"name":"Typedecl","submodules":[],"kind":"module"},{"name":"Typeopt","submodules":[],"kind":"module"},{"name":"Rec_check","submodules":[],"kind":"module"},{"name":"Typecore","submodules":[{"name":"Datatype_kind","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Typeclass","submodules":[],"kind":"module"},{"name":"Typemod","submodules":[{"name":"Sig_component_kind","submodules":[],"kind":"module"},{"name":"Signature_names","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Debuginfo","submodules":[{"name":"Scoped_location","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Lambda","submodules":[],"kind":"module"},{"name":"Printlambda","submodules":[],"kind":"module"},{"name":"Switch","submodules":[{"name":"Make","submodules":[{"name":"Arg","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"Store","submodules":[{"name":"A","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"CtxStore","submodules":[{"name":"A","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"CtxStored","submodules":[],"kind":"module-type"},{"name":"Stored","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Matching","submodules":[],"kind":"module"},{"name":"Translobj","submodules":[],"kind":"module"},{"name":"Translattribute","submodules":[],"kind":"module"},{"name":"Translprim","submodules":[],"kind":"module"},{"name":"Translcore","submodules":[],"kind":"module"},{"name":"Translclass","submodules":[],"kind":"module"},{"name":"Translmod","submodules":[],"kind":"module"},{"name":"Tmc","submodules":[],"kind":"module"},{"name":"Simplif","submodules":[],"kind":"module"},{"name":"Runtimedef","submodules":[],"kind":"module"},{"name":"Meta","submodules":[],"kind":"module"},{"name":"Opcodes","submodules":[],"kind":"module"},{"name":"Bytesections","submodules":[],"kind":"module"},{"name":"Dll","submodules":[],"kind":"module"},{"name":"Symtable","submodules":[],"kind":"module"},{"name":"Pparse","submodules":[],"kind":"module"},{"name":"Compenv","submodules":[],"kind":"module"},{"name":"Main_args","submodules":[{"name":"Default","submodules":[{"name":"Odoc_args","submodules":[],"kind":"module"},{"name":"Optmain","submodules":[],"kind":"module"},{"name":"Main","submodules":[],"kind":"module"},{"name":"Opttopmain","submodules":[],"kind":"module"},{"name":"Topmain","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Make_ocamldoc_options","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Make_opttop_options","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Make_optcomp_options","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Make_bytetop_options","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Make_bytecomp_options","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Arg_list","submodules":[],"kind":"module-type"},{"name":"Ocamldoc_options","submodules":[],"kind":"module-type"},{"name":"Opttop_options","submodules":[],"kind":"module-type"},{"name":"Optcomp_options","submodules":[],"kind":"module-type"},{"name":"Optcommon_options","submodules":[],"kind":"module-type"},{"name":"Bytetop_options","submodules":[],"kind":"module-type"},{"name":"Bytecomp_options","submodules":[],"kind":"module-type"},{"name":"Toplevel_options","submodules":[],"kind":"module-type"},{"name":"Compiler_options","submodules":[],"kind":"module-type"},{"name":"Core_options","submodules":[],"kind":"module-type"},{"name":"Common_options","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Compmisc","submodules":[],"kind":"module"},{"name":"Makedepend","submodules":[],"kind":"module"},{"name":"Compile_common","submodules":[],"kind":"module"}]},{"name":"ocamltoplevel","modules":[{"name":"Genprintval","submodules":[{"name":"Make","submodules":[{"name":"_","submodules":[],"kind":"argument-2"},{"name":"O","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"EVALPATH","submodules":[],"kind":"module-type"},{"name":"OBJ","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Topcommon","submodules":[],"kind":"module"},{"name":"Topeval","submodules":[],"kind":"module"},{"name":"Trace","submodules":[],"kind":"module"},{"name":"Toploop","submodules":[],"kind":"module"},{"name":"Topdirs","submodules":[],"kind":"module"},{"name":"Topmain","submodules":[],"kind":"module"}]},{"name":"unix","modules":[{"name":"Unix","submodules":[{"name":"LargeFile","submodules":[],"kind":"module"}],"kind":"module"},{"name":"UnixLabels","submodules":[{"name":"LargeFile","submodules":[],"kind":"module"}],"kind":"module"}]},{"name":"threads","modules":[{"name":"Thread","submodules":[],"kind":"module"},{"name":"Event","submodules":[],"kind":"module"}]},{"name":"str","modules":[{"name":"Str","submodules":[],"kind":"module"}]},{"name":"odoc_info","modules":[{"name":"Odoc_config","submodules":[],"kind":"module"},{"name":"Odoc_messages","submodules":[],"kind":"module"},{"name":"Odoc_global","submodules":[],"kind":"module"},{"name":"Odoc_types","submodules":[],"kind":"module"},{"name":"Odoc_misc","submodules":[],"kind":"module"},{"name":"Odoc_text_parser","submodules":[],"kind":"module"},{"name":"Odoc_text_lexer","submodules":[],"kind":"module"},{"name":"Odoc_text","submodules":[{"name":"Texter","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Odoc_name","submodules":[{"name":"Map","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Odoc_parameter","submodules":[],"kind":"module"},{"name":"Odoc_value","submodules":[],"kind":"module"},{"name":"Odoc_type","submodules":[],"kind":"module"},{"name":"Odoc_extension","submodules":[],"kind":"module"},{"name":"Odoc_exception","submodules":[],"kind":"module"},{"name":"Odoc_class","submodules":[],"kind":"module"},{"name":"Odoc_module","submodules":[],"kind":"module"},{"name":"Odoc_print","submodules":[],"kind":"module"},{"name":"Odoc_str","submodules":[],"kind":"module"},{"name":"Odoc_comments_global","submodules":[],"kind":"module"},{"name":"Odoc_parser","submodules":[],"kind":"module"},{"name":"Odoc_lexer","submodules":[],"kind":"module"},{"name":"Odoc_see_lexer","submodules":[],"kind":"module"},{"name":"Odoc_env","submodules":[],"kind":"module"},{"name":"Odoc_merge","submodules":[],"kind":"module"},{"name":"Odoc_sig","submodules":[{"name":"Analyser","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Info_retriever","submodules":[],"kind":"module-type"},{"name":"Signature_search","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Odoc_ast","submodules":[{"name":"Analyser","submodules":[{"name":"_","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Typedtree_search","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Odoc_control","submodules":[],"kind":"module"},{"name":"Odoc_inherit","submodules":[],"kind":"module"},{"name":"Odoc_search","submodules":[{"name":"Search_by_name","submodules":[],"kind":"module"},{"name":"P_name","submodules":[],"kind":"module"},{"name":"Search","submodules":[{"name":"P","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Predicates","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Odoc_scan","submodules":[{"name":"scanner","submodules":[],"kind":"class"}],"kind":"module"},{"name":"Odoc_cross","submodules":[],"kind":"module"},{"name":"Odoc_comments","submodules":[{"name":"Basic_info_retriever","submodules":[],"kind":"module"},{"name":"Texter","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Odoc_dep","submodules":[{"name":"Dep","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Odoc_analyse","submodules":[],"kind":"module"},{"name":"Odoc_info","submodules":[{"name":"Global","submodules":[],"kind":"module"},{"name":"Dep","submodules":[],"kind":"module"},{"name":"Scan","submodules":[{"name":"scanner","submodules":[],"kind":"class"}],"kind":"module"},{"name":"Search","submodules":[],"kind":"module"},{"name":"Module","submodules":[],"kind":"module"},{"name":"Class","submodules":[],"kind":"module"},{"name":"Value","submodules":[],"kind":"module"},{"name":"Type","submodules":[],"kind":"module"},{"name":"Exception","submodules":[],"kind":"module"},{"name":"Extension","submodules":[],"kind":"module"},{"name":"Parameter","submodules":[],"kind":"module"},{"name":"Name","submodules":[],"kind":"module"}],"kind":"module"}]},{"name":"dynlink","modules":[{"name":"Dynlink","submodules":[],"kind":"module"}]},{"name":"stdlib","modules":[{"name":"CamlinternalFormatBasics","submodules":[],"kind":"module"},{"name":"Stdlib","submodules":[{"name":"Weak","submodules":[{"name":"Make","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Unit","submodules":[],"kind":"module"},{"name":"Uchar","submodules":[],"kind":"module"},{"name":"Sys","submodules":[{"name":"Immediate64","submodules":[{"name":"Make","submodules":[{"name":"Non_immediate","submodules":[],"kind":"argument-2"},{"name":"Immediate","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Immediate","submodules":[],"kind":"module-type"},{"name":"Non_immediate","submodules":[],"kind":"module-type"}],"kind":"module"}],"kind":"module"},{"name":"StringLabels","submodules":[],"kind":"module"},{"name":"String","submodules":[],"kind":"module"},{"name":"StdLabels","submodules":[],"kind":"module"},{"name":"Stack","submodules":[],"kind":"module"},{"name":"Set","submodules":[{"name":"Make","submodules":[{"name":"Ord","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"OrderedType","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Seq","submodules":[],"kind":"module"},{"name":"Semaphore","submodules":[{"name":"Binary","submodules":[],"kind":"module"},{"name":"Counting","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Scanf","submodules":[{"name":"Scanning","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Result","submodules":[],"kind":"module"},{"name":"Random","submodules":[{"name":"State","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Queue","submodules":[],"kind":"module"},{"name":"Printf","submodules":[],"kind":"module"},{"name":"Printexc","submodules":[{"name":"Slot","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Parsing","submodules":[],"kind":"module"},{"name":"Out_channel","submodules":[],"kind":"module"},{"name":"Option","submodules":[],"kind":"module"},{"name":"Oo","submodules":[],"kind":"module"},{"name":"Obj","submodules":[{"name":"Ephemeron","submodules":[],"kind":"module"},{"name":"Extension_constructor","submodules":[],"kind":"module"},{"name":"Closure","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Nativeint","submodules":[],"kind":"module"},{"name":"Mutex","submodules":[],"kind":"module"},{"name":"MoreLabels","submodules":[{"name":"Set","submodules":[{"name":"Make","submodules":[{"name":"Ord","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"OrderedType","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Map","submodules":[{"name":"Make","submodules":[{"name":"Ord","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"OrderedType","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Hashtbl","submodules":[{"name":"MakeSeeded","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"SeededS","submodules":[],"kind":"module-type"},{"name":"SeededHashedType","submodules":[],"kind":"module-type"},{"name":"Make","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"HashedType","submodules":[],"kind":"module-type"}],"kind":"module"}],"kind":"module"},{"name":"Marshal","submodules":[],"kind":"module"},{"name":"Map","submodules":[{"name":"Make","submodules":[{"name":"Ord","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"OrderedType","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"ListLabels","submodules":[],"kind":"module"},{"name":"List","submodules":[],"kind":"module"},{"name":"Lexing","submodules":[],"kind":"module"},{"name":"Lazy","submodules":[],"kind":"module"},{"name":"Int64","submodules":[],"kind":"module"},{"name":"Int32","submodules":[],"kind":"module"},{"name":"Int","submodules":[],"kind":"module"},{"name":"In_channel","submodules":[],"kind":"module"},{"name":"Hashtbl","submodules":[{"name":"MakeSeeded","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"SeededS","submodules":[],"kind":"module-type"},{"name":"SeededHashedType","submodules":[],"kind":"module-type"},{"name":"Make","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"S","submodules":[],"kind":"module-type"},{"name":"HashedType","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Gc","submodules":[{"name":"Memprof","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Fun","submodules":[],"kind":"module"},{"name":"Format","submodules":[],"kind":"module"},{"name":"Float","submodules":[{"name":"ArrayLabels","submodules":[],"kind":"module"},{"name":"Array","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Filename","submodules":[],"kind":"module"},{"name":"Ephemeron","submodules":[{"name":"Kn","submodules":[{"name":"Bucket","submodules":[],"kind":"module"},{"name":"MakeSeeded","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Make","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"K2","submodules":[{"name":"Bucket","submodules":[],"kind":"module"},{"name":"MakeSeeded","submodules":[{"name":"H2","submodules":[],"kind":"argument-2"},{"name":"H1","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Make","submodules":[{"name":"H2","submodules":[],"kind":"argument-2"},{"name":"H1","submodules":[],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"K1","submodules":[{"name":"Bucket","submodules":[],"kind":"module"},{"name":"MakeSeeded","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"},{"name":"Make","submodules":[{"name":"H","submodules":[],"kind":"argument-1"}],"kind":"module"}],"kind":"module"},{"name":"SeededS","submodules":[],"kind":"module-type"},{"name":"S","submodules":[],"kind":"module-type"}],"kind":"module"},{"name":"Either","submodules":[],"kind":"module"},{"name":"Effect","submodules":[{"name":"Shallow","submodules":[],"kind":"module"},{"name":"Deep","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Domain","submodules":[{"name":"DLS","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Digest","submodules":[],"kind":"module"},{"name":"Condition","submodules":[],"kind":"module"},{"name":"Complex","submodules":[],"kind":"module"},{"name":"Char","submodules":[],"kind":"module"},{"name":"Callback","submodules":[],"kind":"module"},{"name":"BytesLabels","submodules":[],"kind":"module"},{"name":"Bytes","submodules":[],"kind":"module"},{"name":"Buffer","submodules":[],"kind":"module"},{"name":"Bool","submodules":[],"kind":"module"},{"name":"Bigarray","submodules":[{"name":"Array3","submodules":[],"kind":"module"},{"name":"Array2","submodules":[],"kind":"module"},{"name":"Array1","submodules":[],"kind":"module"},{"name":"Array0","submodules":[],"kind":"module"},{"name":"Genarray","submodules":[],"kind":"module"}],"kind":"module"},{"name":"Atomic","submodules":[],"kind":"module"},{"name":"ArrayLabels","submodules":[],"kind":"module"},{"name":"Array","submodules":[],"kind":"module"},{"name":"Arg","submodules":[],"kind":"module"},{"name":"LargeFile","submodules":[],"kind":"module"}],"kind":"module"},{"name":"CamlinternalLazy","submodules":[],"kind":"module"},{"name":"CamlinternalFormat","submodules":[],"kind":"module"},{"name":"CamlinternalOO","submodules":[],"kind":"module"},{"name":"CamlinternalMod","submodules":[],"kind":"module"}]}]}

Generates a status.json file
  $ cat output/p/ocaml-base-compiler/5.0.0/status.json
  "Built"

Generates a package.json.html.json file
  $ cat output/p/ocaml-base-compiler/5.0.0/package.json.html.json
  {"uses_katex":false,"breadcrumbs":[{"name":"p","href":"../../","kind":"page"},{"name":"ocaml-base-compiler","href":"../","kind":"page"},{"name":"5.0.0","href":"","kind":"page"},{"name":"package.json","href":"#","kind":"leaf-page"}],"toc":[],"preamble":"<h2>package.json</h2>","content":"<pre>{&quot;libraries&quot;:[{&quot;name&quot;:&quot;runtime_events&quot;,&quot;modules&quot;:[&quot;Runtime_events&quot;]},{&quot;name&quot;:&quot;ocamlmiddleend&quot;,&quot;modules&quot;:[&quot;Internal_variable_names&quot;,&quot;Linkage_name&quot;,&quot;Compilation_unit&quot;,&quot;Variable&quot;,&quot;Closure_element&quot;,&quot;Closure_id&quot;,&quot;Symbol&quot;,&quot;Backend_var&quot;,&quot;Clambda_primitives&quot;,&quot;Printclambda_primitives&quot;,&quot;Clambda&quot;,&quot;Printclambda&quot;,&quot;Semantics_of_primitives&quot;,&quot;Convert_primitives&quot;,&quot;Id_types&quot;,&quot;Export_id&quot;,&quot;Tag&quot;,&quot;Mutable_variable&quot;,&quot;Set_of_closures_id&quot;,&quot;Set_of_closures_origin&quot;,&quot;Closure_origin&quot;,&quot;Var_within_closure&quot;,&quot;Static_exception&quot;,&quot;Pass_wrapper&quot;,&quot;Allocated_const&quot;,&quot;Parameter&quot;,&quot;Projection&quot;,&quot;Flambda&quot;,&quot;Flambda_iterators&quot;,&quot;Flambda_utils&quot;,&quot;Freshening&quot;,&quot;Effect_analysis&quot;,&quot;Inlining_cost&quot;,&quot;Simple_value_approx&quot;,&quot;Export_info&quot;,&quot;Export_info_for_pack&quot;,&quot;Compilenv&quot;,&quot;Closure&quot;,&quot;Closure_middle_end&quot;,&quot;Import_approx&quot;,&quot;Lift_code&quot;,&quot;Closure_conversion_aux&quot;,&quot;Closure_conversion&quot;,&quot;Initialize_symbol_to_let_symbol&quot;,&quot;Lift_let_to_initialize_symbol&quot;,&quot;Find_recursive_functions&quot;,&quot;Invariant_params&quot;,&quot;Inconstant_idents&quot;,&quot;Alias_analysis&quot;,&quot;Lift_constants&quot;,&quot;Share_constants&quot;,&quot;Simplify_common&quot;,&quot;Remove_unused_arguments&quot;,&quot;Remove_unused_closure_vars&quot;,&quot;Remove_unused_program_constructs&quot;,&quot;Simplify_boxed_integer_ops&quot;,&quot;Simplify_primitives&quot;,&quot;Inlining_stats_types&quot;,&quot;Inlining_stats&quot;,&quot;Inline_and_simplify_aux&quot;,&quot;Remove_free_vars_equal_to_args&quot;,&quot;Extract_projections&quot;,&quot;Augment_specialised_args&quot;,&quot;Unbox_free_vars_of_closures&quot;,&quot;Unbox_specialised_args&quot;,&quot;Unbox_closures&quot;,&quot;Inlining_transforms&quot;,&quot;Inlining_decision&quot;,&quot;Inline_and_simplify&quot;,&quot;Ref_to_variables&quot;,&quot;Flambda_invariants&quot;,&quot;Traverse_for_exported_symbols&quot;,&quot;Build_export_info&quot;,&quot;Closure_offsets&quot;,&quot;Un_anf&quot;,&quot;Flambda_to_clambda&quot;,&quot;Flambda_middle_end&quot;]},{&quot;name&quot;:&quot;ocamlbytecomp&quot;,&quot;modules&quot;:[&quot;Instruct&quot;,&quot;Bytegen&quot;,&quot;Printinstr&quot;,&quot;Emitcode&quot;,&quot;Bytelink&quot;,&quot;Bytelibrarian&quot;,&quot;Bytepackager&quot;,&quot;Errors&quot;,&quot;Compile&quot;,&quot;Maindriver&quot;]},{&quot;name&quot;:&quot;ocamloptcomp&quot;,&quot;modules&quot;:[&quot;Internal_variable_names&quot;,&quot;Linkage_name&quot;,&quot;Compilation_unit&quot;,&quot;Variable&quot;,&quot;Closure_element&quot;,&quot;Closure_id&quot;,&quot;Symbol&quot;,&quot;Backend_var&quot;,&quot;Clambda_primitives&quot;,&quot;Printclambda_primitives&quot;,&quot;Clambda&quot;,&quot;Printclambda&quot;,&quot;Semantics_of_primitives&quot;,&quot;Convert_primitives&quot;,&quot;Id_types&quot;,&quot;Export_id&quot;,&quot;Tag&quot;,&quot;Mutable_variable&quot;,&quot;Set_of_closures_id&quot;,&quot;Set_of_closures_origin&quot;,&quot;Closure_origin&quot;,&quot;Var_within_closure&quot;,&quot;Static_exception&quot;,&quot;Pass_wrapper&quot;,&quot;Allocated_const&quot;,&quot;Parameter&quot;,&quot;Projection&quot;,&quot;Flambda&quot;,&quot;Flambda_iterators&quot;,&quot;Flambda_utils&quot;,&quot;Freshening&quot;,&quot;Effect_analysis&quot;,&quot;Inlining_cost&quot;,&quot;Simple_value_approx&quot;,&quot;Export_info&quot;,&quot;Export_info_for_pack&quot;,&quot;Compilenv&quot;,&quot;Closure&quot;,&quot;Closure_middle_end&quot;,&quot;Import_approx&quot;,&quot;Lift_code&quot;,&quot;Closure_conversion_aux&quot;,&quot;Closure_conversion&quot;,&quot;Initialize_symbol_to_let_symbol&quot;,&quot;Lift_let_to_initialize_symbol&quot;,&quot;Find_recursive_functions&quot;,&quot;Invariant_params&quot;,&quot;Inconstant_idents&quot;,&quot;Alias_analysis&quot;,&quot;Lift_constants&quot;,&quot;Share_constants&quot;,&quot;Simplify_common&quot;,&quot;Remove_unused_arguments&quot;,&quot;Remove_unused_closure_vars&quot;,&quot;Remove_unused_program_constructs&quot;,&quot;Simplify_boxed_integer_ops&quot;,&quot;Simplify_primitives&quot;,&quot;Inlining_stats_types&quot;,&quot;Inlining_stats&quot;,&quot;Inline_and_simplify_aux&quot;,&quot;Remove_free_vars_equal_to_args&quot;,&quot;Extract_projections&quot;,&quot;Augment_specialised_args&quot;,&quot;Unbox_free_vars_of_closures&quot;,&quot;Unbox_specialised_args&quot;,&quot;Unbox_closures&quot;,&quot;Inlining_transforms&quot;,&quot;Inlining_decision&quot;,&quot;Inline_and_simplify&quot;,&quot;Ref_to_variables&quot;,&quot;Flambda_invariants&quot;,&quot;Traverse_for_exported_symbols&quot;,&quot;Build_export_info&quot;,&quot;Closure_offsets&quot;,&quot;Un_anf&quot;,&quot;Flambda_to_clambda&quot;,&quot;Flambda_middle_end&quot;,&quot;Arch&quot;,&quot;Cmm&quot;,&quot;Printcmm&quot;,&quot;Reg&quot;,&quot;Mach&quot;,&quot;Proc&quot;,&quot;Afl_instrument&quot;,&quot;Strmatch&quot;,&quot;Cmmgen_state&quot;,&quot;Cmm_helpers&quot;,&quot;Cmmgen&quot;,&quot;Cmm_invariants&quot;,&quot;Interval&quot;,&quot;Printmach&quot;,&quot;Dataflow&quot;,&quot;Polling&quot;,&quot;Selectgen&quot;,&quot;Selection&quot;,&quot;Comballoc&quot;,&quot;CSEgen&quot;,&quot;CSE&quot;,&quot;Liveness&quot;,&quot;Spill&quot;,&quot;Split&quot;,&quot;Interf&quot;,&quot;Coloring&quot;,&quot;Linscan&quot;,&quot;Reloadgen&quot;,&quot;Reload&quot;,&quot;Deadcode&quot;,&quot;Linear&quot;,&quot;Printlinear&quot;,&quot;Linearize&quot;,&quot;Linear_format&quot;,&quot;Schedgen&quot;,&quot;Scheduling&quot;,&quot;Branch_relaxation_intf&quot;,&quot;Branch_relaxation&quot;,&quot;Emitaux&quot;,&quot;Emit&quot;,&quot;Asmgen&quot;,&quot;Asmlink&quot;,&quot;Asmlibrarian&quot;,&quot;Asmpackager&quot;,&quot;Opterrors&quot;,&quot;Optcompile&quot;,&quot;Optmaindriver&quot;]},{&quot;name&quot;:&quot;ocamlcommon&quot;,&quot;modules&quot;:[&quot;Config&quot;,&quot;Build_path_prefix_map&quot;,&quot;Misc&quot;,&quot;Identifiable&quot;,&quot;Numbers&quot;,&quot;Arg_helper&quot;,&quot;Local_store&quot;,&quot;Load_path&quot;,&quot;Clflags&quot;,&quot;Profile&quot;,&quot;Terminfo&quot;,&quot;Ccomp&quot;,&quot;Warnings&quot;,&quot;Consistbl&quot;,&quot;Strongly_connected_components&quot;,&quot;Targetint&quot;,&quot;Int_replace_polymorphic_compare&quot;,&quot;Domainstate&quot;,&quot;Binutils&quot;,&quot;Lazy_backtrack&quot;,&quot;Diffing&quot;,&quot;Diffing_with_keys&quot;,&quot;Location&quot;,&quot;Longident&quot;,&quot;Docstrings&quot;,&quot;Syntaxerr&quot;,&quot;Ast_helper&quot;,&quot;Pprintast&quot;,&quot;CamlinternalMenhirLib&quot;,&quot;Parser&quot;,&quot;Lexer&quot;,&quot;Parse&quot;,&quot;Printast&quot;,&quot;Ast_mapper&quot;,&quot;Ast_iterator&quot;,&quot;Attr_helper&quot;,&quot;Builtin_attributes&quot;,&quot;Ast_invariants&quot;,&quot;Depend&quot;,&quot;Ident&quot;,&quot;Path&quot;,&quot;Primitive&quot;,&quot;Type_immediacy&quot;,&quot;Shape&quot;,&quot;Types&quot;,&quot;Btype&quot;,&quot;Oprint&quot;,&quot;Subst&quot;,&quot;Predef&quot;,&quot;Datarepr&quot;,&quot;Cmi_format&quot;,&quot;Persistent_env&quot;,&quot;Env&quot;,&quot;Errortrace&quot;,&quot;Typedtree&quot;,&quot;Signature_group&quot;,&quot;Printtyped&quot;,&quot;Ctype&quot;,&quot;Printtyp&quot;,&quot;Includeclass&quot;,&quot;Mtype&quot;,&quot;Envaux&quot;,&quot;Includecore&quot;,&quot;Tast_iterator&quot;,&quot;Tast_mapper&quot;,&quot;Stypes&quot;,&quot;Cmt_format&quot;,&quot;Cmt2annot&quot;,&quot;Untypeast&quot;,&quot;Includemod&quot;,&quot;Includemod_errorprinter&quot;,&quot;Typetexp&quot;,&quot;Printpat&quot;,&quot;Patterns&quot;,&quot;Parmatch&quot;,&quot;Typedecl_properties&quot;,&quot;Typedecl_variance&quot;,&quot;Typedecl_unboxed&quot;,&quot;Typedecl_immediacy&quot;,&quot;Typedecl_separability&quot;,&quot;Typedecl&quot;,&quot;Typeopt&quot;,&quot;Rec_check&quot;,&quot;Typecore&quot;,&quot;Typeclass&quot;,&quot;Typemod&quot;,&quot;Debuginfo&quot;,&quot;Lambda&quot;,&quot;Printlambda&quot;,&quot;Switch&quot;,&quot;Matching&quot;,&quot;Translobj&quot;,&quot;Translattribute&quot;,&quot;Translprim&quot;,&quot;Translcore&quot;,&quot;Translclass&quot;,&quot;Translmod&quot;,&quot;Tmc&quot;,&quot;Simplif&quot;,&quot;Runtimedef&quot;,&quot;Meta&quot;,&quot;Opcodes&quot;,&quot;Bytesections&quot;,&quot;Dll&quot;,&quot;Symtable&quot;,&quot;Pparse&quot;,&quot;Compenv&quot;,&quot;Main_args&quot;,&quot;Compmisc&quot;,&quot;Makedepend&quot;,&quot;Compile_common&quot;]},{&quot;name&quot;:&quot;ocamltoplevel&quot;,&quot;modules&quot;:[&quot;Genprintval&quot;,&quot;Topcommon&quot;,&quot;Topeval&quot;,&quot;Trace&quot;,&quot;Toploop&quot;,&quot;Topdirs&quot;,&quot;Topmain&quot;]},{&quot;name&quot;:&quot;unix&quot;,&quot;modules&quot;:[&quot;Unix&quot;,&quot;UnixLabels&quot;]},{&quot;name&quot;:&quot;threads&quot;,&quot;modules&quot;:[&quot;Thread&quot;,&quot;Event&quot;]},{&quot;name&quot;:&quot;str&quot;,&quot;modules&quot;:[&quot;Str&quot;]},{&quot;name&quot;:&quot;odoc_info&quot;,&quot;modules&quot;:[&quot;Odoc_config&quot;,&quot;Odoc_messages&quot;,&quot;Odoc_global&quot;,&quot;Odoc_types&quot;,&quot;Odoc_misc&quot;,&quot;Odoc_text_parser&quot;,&quot;Odoc_text_lexer&quot;,&quot;Odoc_text&quot;,&quot;Odoc_name&quot;,&quot;Odoc_parameter&quot;,&quot;Odoc_value&quot;,&quot;Odoc_type&quot;,&quot;Odoc_extension&quot;,&quot;Odoc_exception&quot;,&quot;Odoc_class&quot;,&quot;Odoc_module&quot;,&quot;Odoc_print&quot;,&quot;Odoc_str&quot;,&quot;Odoc_comments_global&quot;,&quot;Odoc_parser&quot;,&quot;Odoc_lexer&quot;,&quot;Odoc_see_lexer&quot;,&quot;Odoc_env&quot;,&quot;Odoc_merge&quot;,&quot;Odoc_sig&quot;,&quot;Odoc_ast&quot;,&quot;Odoc_control&quot;,&quot;Odoc_inherit&quot;,&quot;Odoc_search&quot;,&quot;Odoc_scan&quot;,&quot;Odoc_cross&quot;,&quot;Odoc_comments&quot;,&quot;Odoc_dep&quot;,&quot;Odoc_analyse&quot;,&quot;Odoc_info&quot;]},{&quot;name&quot;:&quot;dynlink&quot;,&quot;modules&quot;:[&quot;Dynlink_compilerlibs&quot;,&quot;Dynlink_types&quot;,&quot;Dynlink_platform_intf&quot;,&quot;Dynlink_common&quot;,&quot;Dynlink&quot;]},{&quot;name&quot;:&quot;stdlib&quot;,&quot;modules&quot;:[&quot;CamlinternalFormatBasics&quot;,&quot;Stdlib&quot;,&quot;Stdlib__Either&quot;,&quot;Stdlib__Sys&quot;,&quot;Stdlib__Obj&quot;,&quot;Stdlib__Atomic&quot;,&quot;CamlinternalLazy&quot;,&quot;Stdlib__Lazy&quot;,&quot;Stdlib__Seq&quot;,&quot;Stdlib__Option&quot;,&quot;Stdlib__Result&quot;,&quot;Stdlib__Bool&quot;,&quot;Stdlib__Char&quot;,&quot;Stdlib__Uchar&quot;,&quot;Stdlib__List&quot;,&quot;Stdlib__Int&quot;,&quot;Stdlib__Bytes&quot;,&quot;Stdlib__String&quot;,&quot;Stdlib__Unit&quot;,&quot;Stdlib__Marshal&quot;,&quot;Stdlib__Array&quot;,&quot;Stdlib__Float&quot;,&quot;Stdlib__Int32&quot;,&quot;Stdlib__Int64&quot;,&quot;Stdlib__Nativeint&quot;,&quot;Stdlib__Lexing&quot;,&quot;Stdlib__Parsing&quot;,&quot;Stdlib__Set&quot;,&quot;Stdlib__Map&quot;,&quot;Stdlib__Stack&quot;,&quot;Stdlib__Queue&quot;,&quot;Stdlib__Buffer&quot;,&quot;Stdlib__Mutex&quot;,&quot;Stdlib__Condition&quot;,&quot;Stdlib__Semaphore&quot;,&quot;Stdlib__Domain&quot;,&quot;CamlinternalFormat&quot;,&quot;Stdlib__Printf&quot;,&quot;Stdlib__Arg&quot;,&quot;Stdlib__Printexc&quot;,&quot;Stdlib__Fun&quot;,&quot;Stdlib__Gc&quot;,&quot;Stdlib__Digest&quot;,&quot;Stdlib__Bigarray&quot;,&quot;Stdlib__Random&quot;,&quot;Stdlib__Hashtbl&quot;,&quot;Stdlib__Weak&quot;,&quot;Stdlib__Format&quot;,&quot;Stdlib__Scanf&quot;,&quot;Stdlib__Callback&quot;,&quot;CamlinternalOO&quot;,&quot;Stdlib__Oo&quot;,&quot;CamlinternalMod&quot;,&quot;Stdlib__Ephemeron&quot;,&quot;Stdlib__Filename&quot;,&quot;Stdlib__Complex&quot;,&quot;Stdlib__ArrayLabels&quot;,&quot;Stdlib__ListLabels&quot;,&quot;Stdlib__BytesLabels&quot;,&quot;Stdlib__StringLabels&quot;,&quot;Stdlib__MoreLabels&quot;,&quot;Stdlib__StdLabels&quot;,&quot;Stdlib__In_channel&quot;,&quot;Stdlib__Out_channel&quot;,&quot;Stdlib__Effect&quot;]}]}\u000A</pre>"}

Generate an index file file containing the HTML content of the documentation
  $ cat output/p/ocaml-base-compiler/5.0.0/doc/index.html.json
  {"uses_katex":false,"breadcrumbs":[{"name":"p","href":"../../../","kind":"page"},{"name":"ocaml-base-compiler","href":"../../","kind":"page"},{"name":"5.0.0","href":"../","kind":"page"},{"name":"doc","href":"#","kind":"page"}],"toc":[{"title":"Libraries","href":"#libraries","children":[{"title":"runtime_events","href":"#runtime_events","children":[]},{"title":"ocamlmiddleend","href":"#ocamlmiddleend","children":[]},{"title":"ocamlbytecomp","href":"#ocamlbytecomp","children":[]},{"title":"ocamloptcomp","href":"#ocamloptcomp","children":[]},{"title":"ocamlcommon","href":"#ocamlcommon","children":[]},{"title":"ocamltoplevel","href":"#ocamltoplevel","children":[]},{"title":"unix","href":"#unix","children":[]},{"title":"threads","href":"#threads","children":[]},{"title":"str","href":"#str","children":[]},{"title":"odoc_info","href":"#odoc_info","children":[]},{"title":"dynlink","href":"#dynlink","children":[]},{"title":"stdlib","href":"#stdlib","children":[]}]}],"preamble":"<h1 id=\"ocaml-base-compiler-5.0.0\"><a href=\"#ocaml-base-compiler-5.0.0\" class=\"anchor\"></a>ocaml-base-compiler 5.0.0</h1>","content":"<h2 id=\"libraries\"><a href=\"#libraries\" class=\"anchor\"></a>Libraries</h2><p>This package provides the following libraries (via ocamlobjinfo):</p><h3 id=\"runtime_events\"><a href=\"#runtime_events\" class=\"anchor\"></a>runtime_events</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Runtime_events/\"><code>Runtime_events</code></a> <span class=\"synopsis\">Runtime events - ring buffer-based runtime tracing</span></li></ul><h3 id=\"ocamlmiddleend\"><a href=\"#ocamlmiddleend\" class=\"anchor\"></a>ocamlmiddleend</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Internal_variable_names/\"><code>Internal_variable_names</code></a> </li><li><a href=\"Linkage_name/\"><code>Linkage_name</code></a> </li><li><a href=\"Compilation_unit/\"><code>Compilation_unit</code></a> </li><li><a href=\"Variable/\"><code>Variable</code></a> <span class=\"synopsis\"><code>Variable.t</code> is the equivalent of a non-persistent <code>Ident.t</code> in the <code>Flambda</code> tree. It wraps an <code>Ident.t</code> together with its source <code>compilation_unit</code>. As such, it is unique within a whole program, not just one compilation unit.</span></li><li><a href=\"Closure_element/\"><code>Closure_element</code></a> </li><li><a href=\"Closure_id/\"><code>Closure_id</code></a> <span class=\"synopsis\">CR-someday lwhite: &quot;Closure_id&quot; is quite a generic name. I wonder whether something like &quot;Closure_label&quot; would better capture that it is the label of a projection.</span></li><li><a href=\"Symbol/\"><code>Symbol</code></a> <span class=\"synopsis\">A symbol identifies a constant provided by either:</span></li><li><a href=\"Backend_var/\"><code>Backend_var</code></a> <span class=\"synopsis\">Variables used in the backend, optionally equipped with &quot;provenance&quot; information, used for the emission of debugging information.</span></li><li><a href=\"Clambda_primitives/\"><code>Clambda_primitives</code></a> </li><li><a href=\"Printclambda_primitives/\"><code>Printclambda_primitives</code></a> </li><li><a href=\"Clambda/\"><code>Clambda</code></a> </li><li><a href=\"Printclambda/\"><code>Printclambda</code></a> </li><li><a href=\"Semantics_of_primitives/\"><code>Semantics_of_primitives</code></a> <span class=\"synopsis\">Description of the semantics of primitives, to be used for optimization purposes.</span></li><li><a href=\"Convert_primitives/\"><code>Convert_primitives</code></a> </li><li><a href=\"Id_types/\"><code>Id_types</code></a> </li><li><a href=\"Export_id/\"><code>Export_id</code></a> </li><li><a href=\"Tag/\"><code>Tag</code></a> <span class=\"synopsis\">Tags on runtime boxed values.</span></li><li><a href=\"Mutable_variable/\"><code>Mutable_variable</code></a> </li><li><a href=\"Set_of_closures_id/\"><code>Set_of_closures_id</code></a> <span class=\"synopsis\">An identifier, unique across the whole program, that identifies a set of closures (viz. <code>Set_of_closures</code>).</span></li><li><a href=\"Set_of_closures_origin/\"><code>Set_of_closures_origin</code></a> </li><li><a href=\"Closure_origin/\"><code>Closure_origin</code></a> </li><li><a href=\"Var_within_closure/\"><code>Var_within_closure</code></a> <span class=\"synopsis\">An identifier, unique across the whole program, that identifies a particular variable within a particular closure. Only <code>Project_var</code>, and not <code>Var</code>, nodes are tagged with these identifiers.</span></li><li><a href=\"Static_exception/\"><code>Static_exception</code></a> <span class=\"synopsis\">An identifier that is used to label static exceptions. Its uniqueness properties are unspecified.</span></li><li><a href=\"Pass_wrapper/\"><code>Pass_wrapper</code></a> </li><li><a href=\"Allocated_const/\"><code>Allocated_const</code></a> <span class=\"synopsis\">Constants that are always allocated (possibly statically). Blocks are not included here since they are always encoded using <code>Prim (Pmakeblock, ...)</code>.</span></li><li><a href=\"Parameter/\"><code>Parameter</code></a> <span class=\"synopsis\"><code>Parameter.t</code> carries a unique <code>Variable.t</code> used as function parameter. It can also carry annotations about the usage of the variable.</span></li><li><a href=\"Projection/\"><code>Projection</code></a> <span class=\"synopsis\">Representation of projections from closures and blocks.</span></li><li><a href=\"Flambda/\"><code>Flambda</code></a> <span class=\"synopsis\">Intermediate language used for tree-based analysis and optimization.</span></li><li><a href=\"Flambda_iterators/\"><code>Flambda_iterators</code></a> </li><li><a href=\"Flambda_utils/\"><code>Flambda_utils</code></a> <span class=\"synopsis\">Utility functions for the Flambda intermediate language.</span></li><li><a href=\"Freshening/\"><code>Freshening</code></a> <span class=\"synopsis\">Freshening of various identifiers.</span></li><li><a href=\"Effect_analysis/\"><code>Effect_analysis</code></a> <span class=\"synopsis\">Simple side effect analysis.</span></li><li><a href=\"Inlining_cost/\"><code>Inlining_cost</code></a> <span class=\"synopsis\">Measurement of the cost (including cost in space) of Flambda terms in the context of inlining.</span></li><li><a href=\"Simple_value_approx/\"><code>Simple_value_approx</code></a> <span class=\"synopsis\">Simple approximations to the runtime results of computations. This pass is designed for speed rather than accuracy; the performance is important since it is used heavily during inlining.</span></li><li><a href=\"Export_info/\"><code>Export_info</code></a> <span class=\"synopsis\">Exported information (that is to say, information written into a .cmx file) about a compilation unit.</span></li><li><a href=\"Export_info_for_pack/\"><code>Export_info_for_pack</code></a> <span class=\"synopsis\">Transformations on export information that are only used for the building of packs.</span></li><li><a href=\"Compilenv/\"><code>Compilenv</code></a> </li><li><a href=\"Closure/\"><code>Closure</code></a> </li><li><a href=\"Closure_middle_end/\"><code>Closure_middle_end</code></a> </li><li><a href=\"Import_approx/\"><code>Import_approx</code></a> <span class=\"synopsis\">Create simple value approximations from the export information in .cmx files.</span></li><li><a href=\"Lift_code/\"><code>Lift_code</code></a> </li><li><a href=\"Closure_conversion_aux/\"><code>Closure_conversion_aux</code></a> <span class=\"synopsis\">Environments and auxiliary structures used during closure conversion.</span></li><li><a href=\"Closure_conversion/\"><code>Closure_conversion</code></a> </li><li><a href=\"Initialize_symbol_to_let_symbol/\"><code>Initialize_symbol_to_let_symbol</code></a> </li><li><a href=\"Lift_let_to_initialize_symbol/\"><code>Lift_let_to_initialize_symbol</code></a> </li><li><a href=\"Find_recursive_functions/\"><code>Find_recursive_functions</code></a> <span class=\"synopsis\">&quot;Recursive functions&quot; are those functions <code>f</code> that might call either:</span></li><li><a href=\"Invariant_params/\"><code>Invariant_params</code></a> </li><li><a href=\"Inconstant_idents/\"><code>Inconstant_idents</code></a> </li><li><a href=\"Alias_analysis/\"><code>Alias_analysis</code></a> </li><li><a href=\"Lift_constants/\"><code>Lift_constants</code></a> <span class=\"synopsis\">The aim of this pass is to assign symbols to values known to be constant (in other words, whose values we know at compile time), with appropriate sharing of constants, and replace the occurrences of the constants with their corresponding symbols.</span></li><li><a href=\"Share_constants/\"><code>Share_constants</code></a> <span class=\"synopsis\">Share lifted constants that are eligible for sharing (e.g. not strings) and have equal definitions.</span></li><li><a href=\"Simplify_common/\"><code>Simplify_common</code></a> <span class=\"synopsis\"><code>const_*_expr expr v annot</code>, where the expression <code>expr</code> is known to evaluate to the value <code>v</code>, attempt to produce a more simple expression together with its approximation and the benefit gained by replacing <code>expr</code> with this new expression. This simplification is only performed if <code>expr</code> is known to have no side effects. Otherwise, <code>expr</code> itself is returned, with an appropriate approximation but zero benefit.</span></li><li><a href=\"Remove_unused_arguments/\"><code>Remove_unused_arguments</code></a> </li><li><a href=\"Remove_unused_closure_vars/\"><code>Remove_unused_closure_vars</code></a> </li><li><a href=\"Remove_unused_program_constructs/\"><code>Remove_unused_program_constructs</code></a> </li><li><a href=\"Simplify_boxed_integer_ops/\"><code>Simplify_boxed_integer_ops</code></a> </li><li><a href=\"Simplify_primitives/\"><code>Simplify_primitives</code></a> </li><li><a href=\"Inlining_stats_types/\"><code>Inlining_stats_types</code></a> </li><li><a href=\"Inlining_stats/\"><code>Inlining_stats</code></a> </li><li><a href=\"Inline_and_simplify_aux/\"><code>Inline_and_simplify_aux</code></a> <span class=\"synopsis\">Environments and result structures used during inlining and simplification. (See inline_and_simplify.ml.)</span></li><li><a href=\"Remove_free_vars_equal_to_args/\"><code>Remove_free_vars_equal_to_args</code></a> <span class=\"synopsis\">Replace free variables in closures known to be equal to specialised arguments of such closures with those specialised arguments.</span></li><li><a href=\"Extract_projections/\"><code>Extract_projections</code></a> <span class=\"synopsis\">Identify projections from variables used in function bodies (free variables or specialised args, for example, according to <code>which_variables</code> below). Projections from variables that are also used boxed are not returned.</span></li><li><a href=\"Augment_specialised_args/\"><code>Augment_specialised_args</code></a> <span class=\"synopsis\">Helper module for adding specialised arguments to sets of closures.</span></li><li><a href=\"Unbox_free_vars_of_closures/\"><code>Unbox_free_vars_of_closures</code></a> <span class=\"synopsis\">When approximations of free variables of closures indicate that they are closures or blocks, rewrite projections from such blocks to new variables (which become free in the closures), with the defining expressions of the projections lifted out of the corresponding sets of closures.</span></li><li><a href=\"Unbox_specialised_args/\"><code>Unbox_specialised_args</code></a> <span class=\"synopsis\">When approximations of specialised arguments indicate that they are closures or blocks, add more specialised arguments corresponding to the projections from such blocks (with definitions of such projections lifted out), such that the original specialised arguments may later be eliminated.</span></li><li><a href=\"Unbox_closures/\"><code>Unbox_closures</code></a> <span class=\"synopsis\">Turn free variables of closures into specialised arguments. The aim is to cause the closure to become closed.</span></li><li><a href=\"Inlining_transforms/\"><code>Inlining_transforms</code></a> <span class=\"synopsis\">Source code transformations used during inlining.</span></li><li><a href=\"Inlining_decision/\"><code>Inlining_decision</code></a> <span class=\"synopsis\">See the Flambda manual chapter for an explanation in prose of the inlining decision procedure.</span></li><li><a href=\"Inline_and_simplify/\"><code>Inline_and_simplify</code></a> </li><li><a href=\"Ref_to_variables/\"><code>Ref_to_variables</code></a> <span class=\"synopsis\">Transform <code>let</code>-bound references into variables.</span></li><li><a href=\"Flambda_invariants/\"><code>Flambda_invariants</code></a> </li><li><a href=\"Traverse_for_exported_symbols/\"><code>Traverse_for_exported_symbols</code></a> </li><li><a href=\"Build_export_info/\"><code>Build_export_info</code></a> <span class=\"synopsis\">Construct export information, for emission into .cmx files, from an Flambda program.</span></li><li><a href=\"Closure_offsets/\"><code>Closure_offsets</code></a> <span class=\"synopsis\">Assign numerical offsets, within closure blocks, for code pointers and environment entries.</span></li><li><a href=\"Un_anf/\"><code>Un_anf</code></a> </li><li><a href=\"Flambda_to_clambda/\"><code>Flambda_to_clambda</code></a> </li><li><a href=\"Flambda_middle_end/\"><code>Flambda_middle_end</code></a> <span class=\"synopsis\">Translate Lambda code to Flambda code, optimize it, and produce Clambda.</span></li></ul><h3 id=\"ocamlbytecomp\"><a href=\"#ocamlbytecomp\" class=\"anchor\"></a>ocamlbytecomp</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Instruct/\"><code>Instruct</code></a> </li><li><a href=\"Bytegen/\"><code>Bytegen</code></a> </li><li><a href=\"Printinstr/\"><code>Printinstr</code></a> </li><li><a href=\"Emitcode/\"><code>Emitcode</code></a> </li><li><a href=\"Bytelink/\"><code>Bytelink</code></a> </li><li><a href=\"Bytelibrarian/\"><code>Bytelibrarian</code></a> </li><li><a href=\"Bytepackager/\"><code>Bytepackager</code></a> </li><li><a href=\"Errors/\"><code>Errors</code></a> </li><li><a href=\"Compile/\"><code>Compile</code></a> <span class=\"synopsis\">Bytecode compilation for .ml and .mli files.</span></li><li><a href=\"Maindriver/\"><code>Maindriver</code></a> </li></ul><h3 id=\"ocamloptcomp\"><a href=\"#ocamloptcomp\" class=\"anchor\"></a>ocamloptcomp</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Internal_variable_names/\"><code>Internal_variable_names</code></a> </li><li><a href=\"Linkage_name/\"><code>Linkage_name</code></a> </li><li><a href=\"Compilation_unit/\"><code>Compilation_unit</code></a> </li><li><a href=\"Variable/\"><code>Variable</code></a> <span class=\"synopsis\"><code>Variable.t</code> is the equivalent of a non-persistent <code>Ident.t</code> in the <code>Flambda</code> tree. It wraps an <code>Ident.t</code> together with its source <code>compilation_unit</code>. As such, it is unique within a whole program, not just one compilation unit.</span></li><li><a href=\"Closure_element/\"><code>Closure_element</code></a> </li><li><a href=\"Closure_id/\"><code>Closure_id</code></a> <span class=\"synopsis\">CR-someday lwhite: &quot;Closure_id&quot; is quite a generic name. I wonder whether something like &quot;Closure_label&quot; would better capture that it is the label of a projection.</span></li><li><a href=\"Symbol/\"><code>Symbol</code></a> <span class=\"synopsis\">A symbol identifies a constant provided by either:</span></li><li><a href=\"Backend_var/\"><code>Backend_var</code></a> <span class=\"synopsis\">Variables used in the backend, optionally equipped with &quot;provenance&quot; information, used for the emission of debugging information.</span></li><li><a href=\"Clambda_primitives/\"><code>Clambda_primitives</code></a> </li><li><a href=\"Printclambda_primitives/\"><code>Printclambda_primitives</code></a> </li><li><a href=\"Clambda/\"><code>Clambda</code></a> </li><li><a href=\"Printclambda/\"><code>Printclambda</code></a> </li><li><a href=\"Semantics_of_primitives/\"><code>Semantics_of_primitives</code></a> <span class=\"synopsis\">Description of the semantics of primitives, to be used for optimization purposes.</span></li><li><a href=\"Convert_primitives/\"><code>Convert_primitives</code></a> </li><li><a href=\"Id_types/\"><code>Id_types</code></a> </li><li><a href=\"Export_id/\"><code>Export_id</code></a> </li><li><a href=\"Tag/\"><code>Tag</code></a> <span class=\"synopsis\">Tags on runtime boxed values.</span></li><li><a href=\"Mutable_variable/\"><code>Mutable_variable</code></a> </li><li><a href=\"Set_of_closures_id/\"><code>Set_of_closures_id</code></a> <span class=\"synopsis\">An identifier, unique across the whole program, that identifies a set of closures (viz. <code>Set_of_closures</code>).</span></li><li><a href=\"Set_of_closures_origin/\"><code>Set_of_closures_origin</code></a> </li><li><a href=\"Closure_origin/\"><code>Closure_origin</code></a> </li><li><a href=\"Var_within_closure/\"><code>Var_within_closure</code></a> <span class=\"synopsis\">An identifier, unique across the whole program, that identifies a particular variable within a particular closure. Only <code>Project_var</code>, and not <code>Var</code>, nodes are tagged with these identifiers.</span></li><li><a href=\"Static_exception/\"><code>Static_exception</code></a> <span class=\"synopsis\">An identifier that is used to label static exceptions. Its uniqueness properties are unspecified.</span></li><li><a href=\"Pass_wrapper/\"><code>Pass_wrapper</code></a> </li><li><a href=\"Allocated_const/\"><code>Allocated_const</code></a> <span class=\"synopsis\">Constants that are always allocated (possibly statically). Blocks are not included here since they are always encoded using <code>Prim (Pmakeblock, ...)</code>.</span></li><li><a href=\"Parameter/\"><code>Parameter</code></a> <span class=\"synopsis\"><code>Parameter.t</code> carries a unique <code>Variable.t</code> used as function parameter. It can also carry annotations about the usage of the variable.</span></li><li><a href=\"Projection/\"><code>Projection</code></a> <span class=\"synopsis\">Representation of projections from closures and blocks.</span></li><li><a href=\"Flambda/\"><code>Flambda</code></a> <span class=\"synopsis\">Intermediate language used for tree-based analysis and optimization.</span></li><li><a href=\"Flambda_iterators/\"><code>Flambda_iterators</code></a> </li><li><a href=\"Flambda_utils/\"><code>Flambda_utils</code></a> <span class=\"synopsis\">Utility functions for the Flambda intermediate language.</span></li><li><a href=\"Freshening/\"><code>Freshening</code></a> <span class=\"synopsis\">Freshening of various identifiers.</span></li><li><a href=\"Effect_analysis/\"><code>Effect_analysis</code></a> <span class=\"synopsis\">Simple side effect analysis.</span></li><li><a href=\"Inlining_cost/\"><code>Inlining_cost</code></a> <span class=\"synopsis\">Measurement of the cost (including cost in space) of Flambda terms in the context of inlining.</span></li><li><a href=\"Simple_value_approx/\"><code>Simple_value_approx</code></a> <span class=\"synopsis\">Simple approximations to the runtime results of computations. This pass is designed for speed rather than accuracy; the performance is important since it is used heavily during inlining.</span></li><li><a href=\"Export_info/\"><code>Export_info</code></a> <span class=\"synopsis\">Exported information (that is to say, information written into a .cmx file) about a compilation unit.</span></li><li><a href=\"Export_info_for_pack/\"><code>Export_info_for_pack</code></a> <span class=\"synopsis\">Transformations on export information that are only used for the building of packs.</span></li><li><a href=\"Compilenv/\"><code>Compilenv</code></a> </li><li><a href=\"Closure/\"><code>Closure</code></a> </li><li><a href=\"Closure_middle_end/\"><code>Closure_middle_end</code></a> </li><li><a href=\"Import_approx/\"><code>Import_approx</code></a> <span class=\"synopsis\">Create simple value approximations from the export information in .cmx files.</span></li><li><a href=\"Lift_code/\"><code>Lift_code</code></a> </li><li><a href=\"Closure_conversion_aux/\"><code>Closure_conversion_aux</code></a> <span class=\"synopsis\">Environments and auxiliary structures used during closure conversion.</span></li><li><a href=\"Closure_conversion/\"><code>Closure_conversion</code></a> </li><li><a href=\"Initialize_symbol_to_let_symbol/\"><code>Initialize_symbol_to_let_symbol</code></a> </li><li><a href=\"Lift_let_to_initialize_symbol/\"><code>Lift_let_to_initialize_symbol</code></a> </li><li><a href=\"Find_recursive_functions/\"><code>Find_recursive_functions</code></a> <span class=\"synopsis\">&quot;Recursive functions&quot; are those functions <code>f</code> that might call either:</span></li><li><a href=\"Invariant_params/\"><code>Invariant_params</code></a> </li><li><a href=\"Inconstant_idents/\"><code>Inconstant_idents</code></a> </li><li><a href=\"Alias_analysis/\"><code>Alias_analysis</code></a> </li><li><a href=\"Lift_constants/\"><code>Lift_constants</code></a> <span class=\"synopsis\">The aim of this pass is to assign symbols to values known to be constant (in other words, whose values we know at compile time), with appropriate sharing of constants, and replace the occurrences of the constants with their corresponding symbols.</span></li><li><a href=\"Share_constants/\"><code>Share_constants</code></a> <span class=\"synopsis\">Share lifted constants that are eligible for sharing (e.g. not strings) and have equal definitions.</span></li><li><a href=\"Simplify_common/\"><code>Simplify_common</code></a> <span class=\"synopsis\"><code>const_*_expr expr v annot</code>, where the expression <code>expr</code> is known to evaluate to the value <code>v</code>, attempt to produce a more simple expression together with its approximation and the benefit gained by replacing <code>expr</code> with this new expression. This simplification is only performed if <code>expr</code> is known to have no side effects. Otherwise, <code>expr</code> itself is returned, with an appropriate approximation but zero benefit.</span></li><li><a href=\"Remove_unused_arguments/\"><code>Remove_unused_arguments</code></a> </li><li><a href=\"Remove_unused_closure_vars/\"><code>Remove_unused_closure_vars</code></a> </li><li><a href=\"Remove_unused_program_constructs/\"><code>Remove_unused_program_constructs</code></a> </li><li><a href=\"Simplify_boxed_integer_ops/\"><code>Simplify_boxed_integer_ops</code></a> </li><li><a href=\"Simplify_primitives/\"><code>Simplify_primitives</code></a> </li><li><a href=\"Inlining_stats_types/\"><code>Inlining_stats_types</code></a> </li><li><a href=\"Inlining_stats/\"><code>Inlining_stats</code></a> </li><li><a href=\"Inline_and_simplify_aux/\"><code>Inline_and_simplify_aux</code></a> <span class=\"synopsis\">Environments and result structures used during inlining and simplification. (See inline_and_simplify.ml.)</span></li><li><a href=\"Remove_free_vars_equal_to_args/\"><code>Remove_free_vars_equal_to_args</code></a> <span class=\"synopsis\">Replace free variables in closures known to be equal to specialised arguments of such closures with those specialised arguments.</span></li><li><a href=\"Extract_projections/\"><code>Extract_projections</code></a> <span class=\"synopsis\">Identify projections from variables used in function bodies (free variables or specialised args, for example, according to <code>which_variables</code> below). Projections from variables that are also used boxed are not returned.</span></li><li><a href=\"Augment_specialised_args/\"><code>Augment_specialised_args</code></a> <span class=\"synopsis\">Helper module for adding specialised arguments to sets of closures.</span></li><li><a href=\"Unbox_free_vars_of_closures/\"><code>Unbox_free_vars_of_closures</code></a> <span class=\"synopsis\">When approximations of free variables of closures indicate that they are closures or blocks, rewrite projections from such blocks to new variables (which become free in the closures), with the defining expressions of the projections lifted out of the corresponding sets of closures.</span></li><li><a href=\"Unbox_specialised_args/\"><code>Unbox_specialised_args</code></a> <span class=\"synopsis\">When approximations of specialised arguments indicate that they are closures or blocks, add more specialised arguments corresponding to the projections from such blocks (with definitions of such projections lifted out), such that the original specialised arguments may later be eliminated.</span></li><li><a href=\"Unbox_closures/\"><code>Unbox_closures</code></a> <span class=\"synopsis\">Turn free variables of closures into specialised arguments. The aim is to cause the closure to become closed.</span></li><li><a href=\"Inlining_transforms/\"><code>Inlining_transforms</code></a> <span class=\"synopsis\">Source code transformations used during inlining.</span></li><li><a href=\"Inlining_decision/\"><code>Inlining_decision</code></a> <span class=\"synopsis\">See the Flambda manual chapter for an explanation in prose of the inlining decision procedure.</span></li><li><a href=\"Inline_and_simplify/\"><code>Inline_and_simplify</code></a> </li><li><a href=\"Ref_to_variables/\"><code>Ref_to_variables</code></a> <span class=\"synopsis\">Transform <code>let</code>-bound references into variables.</span></li><li><a href=\"Flambda_invariants/\"><code>Flambda_invariants</code></a> </li><li><a href=\"Traverse_for_exported_symbols/\"><code>Traverse_for_exported_symbols</code></a> </li><li><a href=\"Build_export_info/\"><code>Build_export_info</code></a> <span class=\"synopsis\">Construct export information, for emission into .cmx files, from an Flambda program.</span></li><li><a href=\"Closure_offsets/\"><code>Closure_offsets</code></a> <span class=\"synopsis\">Assign numerical offsets, within closure blocks, for code pointers and environment entries.</span></li><li><a href=\"Un_anf/\"><code>Un_anf</code></a> </li><li><a href=\"Flambda_to_clambda/\"><code>Flambda_to_clambda</code></a> </li><li><a href=\"Flambda_middle_end/\"><code>Flambda_middle_end</code></a> <span class=\"synopsis\">Translate Lambda code to Flambda code, optimize it, and produce Clambda.</span></li><li><a href=\"Arch/\"><code>Arch</code></a> </li><li><a href=\"Cmm/\"><code>Cmm</code></a> </li><li><a href=\"Printcmm/\"><code>Printcmm</code></a> </li><li><a href=\"Reg/\"><code>Reg</code></a> </li><li><a href=\"Mach/\"><code>Mach</code></a> </li><li><a href=\"Proc/\"><code>Proc</code></a> </li><li><a href=\"Afl_instrument/\"><code>Afl_instrument</code></a> <span class=\"synopsis\">Instrumentation for afl-fuzz.</span></li><li><a href=\"Strmatch/\"><code>Strmatch</code></a> </li><li><a href=\"Cmmgen_state/\"><code>Cmmgen_state</code></a> <span class=\"synopsis\">Mutable state used by <code>Cmmgen</code>.</span></li><li><a href=\"Cmm_helpers/\"><code>Cmm_helpers</code></a> </li><li><a href=\"Cmmgen/\"><code>Cmmgen</code></a> </li><li><a href=\"Cmm_invariants/\"><code>Cmm_invariants</code></a> <span class=\"synopsis\">Check a number of continuation-related invariants</span></li><li><a href=\"Interval/\"><code>Interval</code></a> </li><li><a href=\"Printmach/\"><code>Printmach</code></a> </li><li><a href=\"Dataflow/\"><code>Dataflow</code></a> </li><li><a href=\"Polling/\"><code>Polling</code></a> <span class=\"synopsis\">Analyses related to the insertion of <code>Ipoll</code> operations.</span></li><li><a href=\"Selectgen/\"><code>Selectgen</code></a> </li><li><a href=\"Selection/\"><code>Selection</code></a> </li><li><a href=\"Comballoc/\"><code>Comballoc</code></a> </li><li><a href=\"CSEgen/\"><code>CSEgen</code></a> </li><li><a href=\"CSE/\"><code>CSE</code></a> </li><li><a href=\"Liveness/\"><code>Liveness</code></a> </li><li><a href=\"Spill/\"><code>Spill</code></a> </li><li><a href=\"Split/\"><code>Split</code></a> </li><li><a href=\"Interf/\"><code>Interf</code></a> </li><li><a href=\"Coloring/\"><code>Coloring</code></a> </li><li><a href=\"Linscan/\"><code>Linscan</code></a> </li><li><a href=\"Reloadgen/\"><code>Reloadgen</code></a> </li><li><a href=\"Reload/\"><code>Reload</code></a> </li><li><a href=\"Deadcode/\"><code>Deadcode</code></a> </li><li><a href=\"Linear/\"><code>Linear</code></a> </li><li><a href=\"Printlinear/\"><code>Printlinear</code></a> </li><li><a href=\"Linearize/\"><code>Linearize</code></a> </li><li><a href=\"Linear_format/\"><code>Linear_format</code></a> </li><li><a href=\"Schedgen/\"><code>Schedgen</code></a> </li><li><a href=\"Scheduling/\"><code>Scheduling</code></a> </li><li><a href=\"Branch_relaxation_intf/\"><code>Branch_relaxation_intf</code></a> </li><li><a href=\"Branch_relaxation/\"><code>Branch_relaxation</code></a> </li><li><a href=\"Emitaux/\"><code>Emitaux</code></a> </li><li><a href=\"Emit/\"><code>Emit</code></a> </li><li><a href=\"Asmgen/\"><code>Asmgen</code></a> <span class=\"synopsis\">From Lambda to assembly code</span></li><li><a href=\"Asmlink/\"><code>Asmlink</code></a> </li><li><a href=\"Asmlibrarian/\"><code>Asmlibrarian</code></a> </li><li><a href=\"Asmpackager/\"><code>Asmpackager</code></a> </li><li><a href=\"Opterrors/\"><code>Opterrors</code></a> </li><li><a href=\"Optcompile/\"><code>Optcompile</code></a> <span class=\"synopsis\">Native compilation for .ml and .mli files.</span></li><li><a href=\"Optmaindriver/\"><code>Optmaindriver</code></a> </li></ul><h3 id=\"ocamlcommon\"><a href=\"#ocamlcommon\" class=\"anchor\"></a>ocamlcommon</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Config/\"><code>Config</code></a> <span class=\"synopsis\">System configuration</span></li><li><a href=\"Build_path_prefix_map/\"><code>Build_path_prefix_map</code></a> <span class=\"synopsis\">Rewrite paths for reproducible builds</span></li><li><a href=\"Misc/\"><code>Misc</code></a> <span class=\"synopsis\">Miscellaneous useful types and functions</span></li><li><a href=\"Identifiable/\"><code>Identifiable</code></a> <span class=\"synopsis\">Uniform interface for common data structures over various things.</span></li><li><a href=\"Numbers/\"><code>Numbers</code></a> <span class=\"synopsis\">Modules about numbers, some of which satisfy <a href=\"Identifiable/module-type-S/\"><code>Identifiable.S</code></a>.</span></li><li><a href=\"Arg_helper/\"><code>Arg_helper</code></a> <span class=\"synopsis\">Decipher command line arguments of the form &lt;value&gt; | &lt;key&gt;=&lt;value&gt;<code>,...</code></span></li><li><a href=\"Local_store/\"><code>Local_store</code></a> <span class=\"synopsis\">This module provides some facilities for creating references (and hash tables) which can easily be snapshoted and restored to an arbitrary version.</span></li><li><a href=\"Load_path/\"><code>Load_path</code></a> <span class=\"synopsis\">Management of include directories.</span></li><li><a href=\"Clflags/\"><code>Clflags</code></a> <span class=\"synopsis\">Command line flags</span></li><li><a href=\"Profile/\"><code>Profile</code></a> <span class=\"synopsis\">Compiler performance recording</span></li><li><a href=\"Terminfo/\"><code>Terminfo</code></a> <span class=\"synopsis\">Basic interface to the terminfo database</span></li><li><a href=\"Ccomp/\"><code>Ccomp</code></a> <span class=\"synopsis\">Compiling C files and building C libraries</span></li><li><a href=\"Warnings/\"><code>Warnings</code></a> <span class=\"synopsis\">Warning definitions</span></li><li><a href=\"Consistbl/\"><code>Consistbl</code></a> <span class=\"synopsis\">Consistency tables: for checking consistency of module CRCs</span></li><li><a href=\"Strongly_connected_components/\"><code>Strongly_connected_components</code></a> <span class=\"synopsis\">Kosaraju's algorithm for strongly connected components.</span></li><li><a href=\"Targetint/\"><code>Targetint</code></a> <span class=\"synopsis\">Target processor-native integers.</span></li><li><a href=\"Int_replace_polymorphic_compare/\"><code>Int_replace_polymorphic_compare</code></a> </li><li><a href=\"Domainstate/\"><code>Domainstate</code></a> </li><li><a href=\"Binutils/\"><code>Binutils</code></a> </li><li><a href=\"Lazy_backtrack/\"><code>Lazy_backtrack</code></a> </li><li><a href=\"Diffing/\"><code>Diffing</code></a> <span class=\"synopsis\">Parametric diffing</span></li><li><a href=\"Diffing_with_keys/\"><code>Diffing_with_keys</code></a> <span class=\"synopsis\">When diffing lists where each element has a distinct key, we can refine the diffing patch by introducing two composite edit moves: swaps and moves.</span></li><li><a href=\"Location/\"><code>Location</code></a> <span class=\"synopsis\">Source code locations (ranges of positions), used in parsetree.</span></li><li><a href=\"Longident/\"><code>Longident</code></a> <span class=\"synopsis\">Long identifiers, used in parsetree.</span></li><li><a href=\"Docstrings/\"><code>Docstrings</code></a> <span class=\"synopsis\">Documentation comments</span></li><li><a href=\"Syntaxerr/\"><code>Syntaxerr</code></a> <span class=\"synopsis\">Auxiliary type for reporting syntax errors</span></li><li><a href=\"Ast_helper/\"><code>Ast_helper</code></a> <span class=\"synopsis\">Helpers to produce Parsetree fragments</span></li><li><a href=\"Pprintast/\"><code>Pprintast</code></a> <span class=\"synopsis\">Pretty-printers for <a href=\"Parsetree/\"><code>Parsetree</code></a></span></li><li><a href=\"CamlinternalMenhirLib/\"><code>CamlinternalMenhirLib</code></a> </li><li><a href=\"Parser/\"><code>Parser</code></a> </li><li><a href=\"Lexer/\"><code>Lexer</code></a> <span class=\"synopsis\">The lexical analyzer</span></li><li><a href=\"Parse/\"><code>Parse</code></a> <span class=\"synopsis\">Entry points in the parser</span></li><li><a href=\"Printast/\"><code>Printast</code></a> <span class=\"synopsis\">Raw printer for <a href=\"Parsetree/\"><code>Parsetree</code></a></span></li><li><a href=\"Ast_mapper/\"><code>Ast_mapper</code></a> <span class=\"synopsis\">The interface of a -ppx rewriter</span></li><li><a href=\"Ast_iterator/\"><code>Ast_iterator</code></a> <span class=\"synopsis\"><a href=\"Ast_iterator/#type-iterator\"><code>Ast_iterator.iterator</code></a> enables AST inspection using open recursion. A typical mapper would be based on <a href=\"Ast_iterator/#val-default_iterator\"><code>Ast_iterator.default_iterator</code></a>, a trivial iterator, and will fall back on it for handling the syntax it does not modify.</span></li><li><a href=\"Attr_helper/\"><code>Attr_helper</code></a> <span class=\"synopsis\">Helpers for attributes</span></li><li><a href=\"Builtin_attributes/\"><code>Builtin_attributes</code></a> <span class=\"synopsis\">Support for some of the builtin attributes</span></li><li><a href=\"Ast_invariants/\"><code>Ast_invariants</code></a> <span class=\"synopsis\">Check AST invariants</span></li><li><a href=\"Depend/\"><code>Depend</code></a> <span class=\"synopsis\">Module dependencies.</span></li><li><a href=\"Ident/\"><code>Ident</code></a> </li><li><a href=\"Path/\"><code>Path</code></a> </li><li><a href=\"Primitive/\"><code>Primitive</code></a> </li><li><a href=\"Type_immediacy/\"><code>Type_immediacy</code></a> <span class=\"synopsis\">Immediacy status of a type</span></li><li><a href=\"Shape/\"><code>Shape</code></a> </li><li><a href=\"Types/\"><code>Types</code></a> </li><li><a href=\"Btype/\"><code>Btype</code></a> </li><li><a href=\"Oprint/\"><code>Oprint</code></a> </li><li><a href=\"Subst/\"><code>Subst</code></a> </li><li><a href=\"Predef/\"><code>Predef</code></a> </li><li><a href=\"Datarepr/\"><code>Datarepr</code></a> </li><li><a href=\"Cmi_format/\"><code>Cmi_format</code></a> </li><li><a href=\"Persistent_env/\"><code>Persistent_env</code></a> </li><li><a href=\"Env/\"><code>Env</code></a> </li><li><a href=\"Errortrace/\"><code>Errortrace</code></a> </li><li><a href=\"Typedtree/\"><code>Typedtree</code></a> <span class=\"synopsis\">Abstract syntax tree after typing</span></li><li><a href=\"Signature_group/\"><code>Signature_group</code></a> <span class=\"synopsis\">Iterate on signature by syntactic group of items</span></li><li><a href=\"Printtyped/\"><code>Printtyped</code></a> </li><li><a href=\"Ctype/\"><code>Ctype</code></a> </li><li><a href=\"Printtyp/\"><code>Printtyp</code></a> </li><li><a href=\"Includeclass/\"><code>Includeclass</code></a> </li><li><a href=\"Mtype/\"><code>Mtype</code></a> </li><li><a href=\"Envaux/\"><code>Envaux</code></a> </li><li><a href=\"Includecore/\"><code>Includecore</code></a> </li><li><a href=\"Tast_iterator/\"><code>Tast_iterator</code></a> <span class=\"synopsis\">Allows the implementation of typed tree inspection using open recursion</span></li><li><a href=\"Tast_mapper/\"><code>Tast_mapper</code></a> </li><li><a href=\"Stypes/\"><code>Stypes</code></a> </li><li><a href=\"Cmt_format/\"><code>Cmt_format</code></a> <span class=\"synopsis\">cmt and cmti files format.</span></li><li><a href=\"Cmt2annot/\"><code>Cmt2annot</code></a> </li><li><a href=\"Untypeast/\"><code>Untypeast</code></a> </li><li><a href=\"Includemod/\"><code>Includemod</code></a> </li><li><a href=\"Includemod_errorprinter/\"><code>Includemod_errorprinter</code></a> </li><li><a href=\"Typetexp/\"><code>Typetexp</code></a> </li><li><a href=\"Printpat/\"><code>Printpat</code></a> </li><li><a href=\"Patterns/\"><code>Patterns</code></a> </li><li><a href=\"Parmatch/\"><code>Parmatch</code></a> <span class=\"synopsis\">Detection of partial matches and unused match cases.</span></li><li><a href=\"Typedecl_properties/\"><code>Typedecl_properties</code></a> </li><li><a href=\"Typedecl_variance/\"><code>Typedecl_variance</code></a> </li><li><a href=\"Typedecl_unboxed/\"><code>Typedecl_unboxed</code></a> </li><li><a href=\"Typedecl_immediacy/\"><code>Typedecl_immediacy</code></a> </li><li><a href=\"Typedecl_separability/\"><code>Typedecl_separability</code></a> <span class=\"synopsis\">The OCaml runtime assumes for type-directed optimizations that all types are &quot;separable&quot;. A type is &quot;separable&quot; if either all its inhabitants (the values of this type) are floating-point numbers, or none of them are.</span></li><li><a href=\"Typedecl/\"><code>Typedecl</code></a> </li><li><a href=\"Typeopt/\"><code>Typeopt</code></a> </li><li><a href=\"Rec_check/\"><code>Rec_check</code></a> </li><li><a href=\"Typecore/\"><code>Typecore</code></a> </li><li><a href=\"Typeclass/\"><code>Typeclass</code></a> </li><li><a href=\"Typemod/\"><code>Typemod</code></a> <span class=\"synopsis\">Type-checking of the module language and typed ast hooks</span></li><li><a href=\"Debuginfo/\"><code>Debuginfo</code></a> </li><li><a href=\"Lambda/\"><code>Lambda</code></a> </li><li><a href=\"Printlambda/\"><code>Printlambda</code></a> </li><li><a href=\"Switch/\"><code>Switch</code></a> </li><li><a href=\"Matching/\"><code>Matching</code></a> </li><li><a href=\"Translobj/\"><code>Translobj</code></a> </li><li><a href=\"Translattribute/\"><code>Translattribute</code></a> </li><li><a href=\"Translprim/\"><code>Translprim</code></a> </li><li><a href=\"Translcore/\"><code>Translcore</code></a> </li><li><a href=\"Translclass/\"><code>Translclass</code></a> </li><li><a href=\"Translmod/\"><code>Translmod</code></a> </li><li><a href=\"Tmc/\"><code>Tmc</code></a> <span class=\"synopsis\">Tail-modulo-cons optimization.</span></li><li><a href=\"Simplif/\"><code>Simplif</code></a> <span class=\"synopsis\">Lambda simplification.</span></li><li><a href=\"Runtimedef/\"><code>Runtimedef</code></a> </li><li><a href=\"Meta/\"><code>Meta</code></a> </li><li><a href=\"Opcodes/\"><code>Opcodes</code></a> </li><li><a href=\"Bytesections/\"><code>Bytesections</code></a> <span class=\"synopsis\">Recording sections written to a bytecode executable file</span></li><li><a href=\"Dll/\"><code>Dll</code></a> </li><li><a href=\"Symtable/\"><code>Symtable</code></a> </li><li><a href=\"Pparse/\"><code>Pparse</code></a> <span class=\"synopsis\">Driver for the parser and external preprocessors.</span></li><li><a href=\"Compenv/\"><code>Compenv</code></a> </li><li><a href=\"Main_args/\"><code>Main_args</code></a> </li><li><a href=\"Compmisc/\"><code>Compmisc</code></a> </li><li><a href=\"Makedepend/\"><code>Makedepend</code></a> </li><li><a href=\"Compile_common/\"><code>Compile_common</code></a> <span class=\"synopsis\">Common compilation pipeline between bytecode and native.</span></li></ul><h3 id=\"ocamltoplevel\"><a href=\"#ocamltoplevel\" class=\"anchor\"></a>ocamltoplevel</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Genprintval/\"><code>Genprintval</code></a> </li><li><a href=\"Topcommon/\"><code>Topcommon</code></a> <span class=\"synopsis\">This module provides common implementations for internals of <code>Toploop</code>, for bytecode and native code (see <code>Topeval</code> for the diverging parts of the implementation).</span></li><li><a href=\"Topeval/\"><code>Topeval</code></a> <span class=\"synopsis\">This module provides two alternative implementations for internals of <code>Toploop</code>, for bytecode and native code.</span></li><li><a href=\"Trace/\"><code>Trace</code></a> </li><li><a href=\"Toploop/\"><code>Toploop</code></a> </li><li><a href=\"Topdirs/\"><code>Topdirs</code></a> </li><li><a href=\"Topmain/\"><code>Topmain</code></a> </li></ul><h3 id=\"unix\"><a href=\"#unix\" class=\"anchor\"></a>unix</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Unix/\"><code>Unix</code></a> <span class=\"synopsis\">Interface to the Unix system.</span></li><li><a href=\"UnixLabels/\"><code>UnixLabels</code></a> <span class=\"synopsis\">Interface to the Unix system.</span></li></ul><h3 id=\"threads\"><a href=\"#threads\" class=\"anchor\"></a>threads</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Thread/\"><code>Thread</code></a> <span class=\"synopsis\">Lightweight threads for Posix <code>1003.1c</code> and Win32.</span></li><li><a href=\"Event/\"><code>Event</code></a> <span class=\"synopsis\">First-class synchronous communication.</span></li></ul><h3 id=\"str\"><a href=\"#str\" class=\"anchor\"></a>str</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Str/\"><code>Str</code></a> <span class=\"synopsis\">Regular expressions and high-level string processing</span></li></ul><h3 id=\"odoc_info\"><a href=\"#odoc_info\" class=\"anchor\"></a>odoc_info</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"Odoc_config/\"><code>Odoc_config</code></a> </li><li><a href=\"Odoc_messages/\"><code>Odoc_messages</code></a> </li><li><a href=\"Odoc_global/\"><code>Odoc_global</code></a> </li><li><a href=\"Odoc_types/\"><code>Odoc_types</code></a> </li><li><a href=\"Odoc_misc/\"><code>Odoc_misc</code></a> </li><li><a href=\"Odoc_text_parser/\"><code>Odoc_text_parser</code></a> </li><li><a href=\"Odoc_text_lexer/\"><code>Odoc_text_lexer</code></a> </li><li><a href=\"Odoc_text/\"><code>Odoc_text</code></a> </li><li><a href=\"Odoc_name/\"><code>Odoc_name</code></a> </li><li><a href=\"Odoc_parameter/\"><code>Odoc_parameter</code></a> </li><li><a href=\"Odoc_value/\"><code>Odoc_value</code></a> </li><li><a href=\"Odoc_type/\"><code>Odoc_type</code></a> </li><li><a href=\"Odoc_extension/\"><code>Odoc_extension</code></a> </li><li><a href=\"Odoc_exception/\"><code>Odoc_exception</code></a> </li><li><a href=\"Odoc_class/\"><code>Odoc_class</code></a> </li><li><a href=\"Odoc_module/\"><code>Odoc_module</code></a> </li><li><a href=\"Odoc_print/\"><code>Odoc_print</code></a> </li><li><a href=\"Odoc_str/\"><code>Odoc_str</code></a> </li><li><a href=\"Odoc_comments_global/\"><code>Odoc_comments_global</code></a> </li><li><a href=\"Odoc_parser/\"><code>Odoc_parser</code></a> </li><li><a href=\"Odoc_lexer/\"><code>Odoc_lexer</code></a> </li><li><a href=\"Odoc_see_lexer/\"><code>Odoc_see_lexer</code></a> </li><li><a href=\"Odoc_env/\"><code>Odoc_env</code></a> </li><li><a href=\"Odoc_merge/\"><code>Odoc_merge</code></a> </li><li><a href=\"Odoc_sig/\"><code>Odoc_sig</code></a> </li><li><a href=\"Odoc_ast/\"><code>Odoc_ast</code></a> </li><li><a href=\"Odoc_control/\"><code>Odoc_control</code></a> </li><li><a href=\"Odoc_inherit/\"><code>Odoc_inherit</code></a> </li><li><a href=\"Odoc_search/\"><code>Odoc_search</code></a> </li><li><a href=\"Odoc_scan/\"><code>Odoc_scan</code></a> </li><li><a href=\"Odoc_cross/\"><code>Odoc_cross</code></a> </li><li><a href=\"Odoc_comments/\"><code>Odoc_comments</code></a> </li><li><a href=\"Odoc_dep/\"><code>Odoc_dep</code></a> </li><li><a href=\"Odoc_analyse/\"><code>Odoc_analyse</code></a> </li><li><a href=\"Odoc_info/\"><code>Odoc_info</code></a> <span class=\"synopsis\">Interface to the information collected in source files.</span></li></ul><h3 id=\"dynlink\"><a href=\"#dynlink\" class=\"anchor\"></a>dynlink</h3><p>Documentation: </p><ul class=\"modules\"><li><code>Dynlink_compilerlibs</code> </li><li><code>Dynlink_types</code> </li><li><code>Dynlink_platform_intf</code> </li><li><code>Dynlink_common</code> </li><li><a href=\"Dynlink/\"><code>Dynlink</code></a> <span class=\"synopsis\">Dynamic loading of .cmo, .cma and .cmxs files.</span></li></ul><h3 id=\"stdlib\"><a href=\"#stdlib\" class=\"anchor\"></a>stdlib</h3><p>Documentation: </p><ul class=\"modules\"><li><a href=\"CamlinternalFormatBasics/\"><code>CamlinternalFormatBasics</code></a> </li><li><a href=\"Stdlib/\"><code>Stdlib</code></a> <span class=\"synopsis\">The OCaml Standard library.</span></li><li><a href=\"CamlinternalLazy/\"><code>CamlinternalLazy</code></a> <span class=\"synopsis\">Run-time support for lazy values. All functions in this module are for system use only, not for the casual user.</span></li><li><a href=\"CamlinternalFormat/\"><code>CamlinternalFormat</code></a> </li><li><a href=\"CamlinternalOO/\"><code>CamlinternalOO</code></a> <span class=\"synopsis\">Run-time support for objects and classes. All functions in this module are for system use only, not for the casual user.</span></li><li><a href=\"CamlinternalMod/\"><code>CamlinternalMod</code></a> <span class=\"synopsis\">Run-time support for recursive modules. All functions in this module are for system use only, not for the casual user.</span></li></ul>"}
