module Result = Bos_setup.R

let switch = ref None

let find package =
  let path = Package.prep_path package in
  Bos.OS.Dir.fold_contents ~dotfiles:true
    (fun p acc ->
      let _, name = Fpath.split_base p in
      if name = Fpath.v "opam" then Ok p else acc)
    (Error (`Msg "No opam file found"))
    path
  |> Result.join
