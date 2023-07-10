module Result = Bos_setup.R
open Result.Infix

let cmd = Bos.Cmd.v "ocamlfind"

let list () =
  Util.lines_of_process Bos.Cmd.(Opam.exec () %% cmd % "list")
  |> List.map (fun line -> Astring.String.fields line |> List.hd)

let cma_of_package pkg =
  try
    let cmd =
      Bos.Cmd.(
        Opam.exec () %% cmd % "query" % "-predicates" % "byte,javascript"
        % "-a-format" % pkg)
    in
    let exec_answer = Util.lines_of_process cmd |> List.hd in
    Some (Fpath.v exec_answer)
  with _ -> None

let stdlib_path () =
  let cmd = Bos.Cmd.(Opam.exec () %% cmd % "printconf" % "stdlib") in
  Util.lines_of_process cmd |> List.hd |> Fpath.v

let include_paths pkg =
  let cmd =
    Bos.Cmd.(
      Opam.exec () %% cmd % "query" % "-predicates" % "byte,javascript"
      % "-i-format" % "-r" % pkg)
  in
  let lines = Util.lines_of_process cmd in
  List.map
    (fun f ->
      match Astring.String.fields f with
      | [ "-I"; path ] -> path ^ "/"
      | _ -> assert false)
    lines

let js_files pkg =
  let cmd =
    Bos.Cmd.(
      Opam.exec () %% cmd % "query" % "-predicates" % "byte,javascript"
      % "-o-format" % "-r" % pkg)
  in
  Util.lines_of_process cmd
  |> List.map (fun s ->
         match s.[0] with
         | '-' ->
             Format.eprintf "Ignoring jsoo option passed: %s\n%!" s;
             Ok None
         | '+' -> Ok (Some (String.sub s 1 (String.length s - 1) |> Fpath.v))
         | _ -> Bos_setup.R.error_msg s)
  |> Util.R.combine_list
  >>| fun js_files ->
  List.fold_right
    (fun f acc -> match f with Some x -> x :: acc | None -> acc)
    js_files []

let dep_cmas pkg =
  let cmd =
    Bos.Cmd.(
      Opam.exec () %% cmd % "query" % "-predicates" % "byte,javascript"
      % "-a-format" % "-r" % pkg)
  in
  Util.lines_of_process cmd |> List.map Fpath.v
