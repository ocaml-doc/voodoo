let process_one file =
  let ic = open_in (Fpath.to_string file) in
  let lines = Util.lines_of_channel ic in
  let affix = "Unit name: " in
  let len = String.length affix in
  close_in ic;
  let units =
    List.map
      (fun line ->
        if Astring.String.is_prefix ~affix line then
          Some (String.sub line len (String.length line - len))
        else None)
      lines
  in
  let units =
    List.fold_right
      (fun l acc -> match l with Some x -> x :: acc | None -> acc)
      units []
  in
  let _, library_name = Fpath.split_base file in
  let library_name =
    Fpath.rem_ext ~multi:true library_name |> Fpath.to_string
  in
  (library_name, units)

let process packages = List.map process_one packages

let find package =
  let path = Package.prep_path package in
  Bos.OS.Dir.fold_contents ~dotfiles:true
    (fun p acc -> if Fpath.get_ext p = ".ocamlobjinfo" then p :: acc else acc)
    [] path
