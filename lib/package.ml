type universe_id = string
and package_name = string 
and package_version = string
and t = universe_id * package_name * package_version

let prep_path package =
  let (universe, pkg_name, pkg_version) = package in
  Fpath.(Paths.prep / "universes" / universe / pkg_name / pkg_version)

  let gen_parent : t -> blessed:bool -> modules:string list -> Mld.t =
  fun package ~blessed ~modules ->
    let cwd = Fpath.v "." in
    let children = List.map (fun m -> Odoc.CModule m) modules in
    let non_hidden = List.filter (fun m -> not (Util.is_hidden m)) modules in
    let childrentxt = List.map (fun m -> Printf.sprintf "{!childmodule:%s}\n" m) non_hidden in
    let (universe,package_name,package_version) = package in
    let top_parents =
      if blessed
      then begin
        let packages = Mld.v cwd "packages" None [Odoc.CPage package_name]
          (Printf.sprintf "{0 Packages}\n{!childpage:%s}\n" package_name) in
        packages
      end else begin
        let universes = Mld.v cwd "universes" None [Odoc.CPage universe]
          (Printf.sprintf "{0 Universes}\n{!childpage:%s}\n" universe) in
        let universe = Mld.v cwd universe (Some universes) [Odoc.CPage package_name]
          (Printf.sprintf "{0 %s}\n{!childpage:%s}\n" universe package_name) in
        universe
      end
    in
    let package = Mld.v cwd package_name (Some top_parents) [Odoc.CPage package_version]
      (Printf.sprintf "{0 %s}\n{!childpage:%s}\n" package_name package_version) in
    let version = Mld.v cwd package_version (Some package) children
      (Printf.sprintf "{0 %s}\n%s\n" package_version (String.concat "\n" childrentxt)) in
    Mld.compile version;
    version
