val run :
  (string * string) list ->
  (string * string) list ->
  (unit, Bos_setup.R.msg) Bos_setup.result
(** [run universes ref_universes] prepares all packages installed in the current
    switch.

    For each package [p]:

    - copy some of the files installed by [p] to the [prep/] directory.
    - store the [ocamlobjinfo] of the [.cma] files in the same directory.
    - copy the [opam] file. *)
