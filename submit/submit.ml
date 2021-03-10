open Builder

module M2 = Map.Make(Universe.T)

let _ = ()

let s3cfg = {|
[default]
host_base = s3.fr-par.scw.cloud
host_bucket = %(bucket)s.s3.fr-par.scw.cloud
bucket_location = fr-par
use_https = True
# endpoint: https://docs.ocaml.org-cmts.s3.fr-par.scw.cloud
# Login credentials
access_key = XXXXXX
secret_key = XXXXXX
|}

let read_file dir f =
  try
    let ic = open_in (Fpath.to_string (Fpath.(v dir / f))) in
    Fun.protect ~finally:(fun () -> close_in ic) @@ fun () ->
      let rec inner lines =
        try inner @@ input_line ic :: lines
        with End_of_file -> List.rev lines
      in f, inner []
  with Sys_error _ -> f, []

let parse_file (filename, lines) =
  match lines with
  | line :: _ -> begin
    let atoms = Astring.String.cuts ~sep:" " line in
    let atoms = List.filter (fun atom -> atom <> filename) atoms in
    let atoms = List.filter_map Opam.of_string atoms in
    let pkg = match Opam.of_string filename with |Some p -> p | None -> failwith "Failed to parse package name" in
    let filter = ["base-unix"; "base-bigarray"; "base-threads"; "ocaml-base-compiler"; "ocaml-config"] @
      if pkg.Opam.name = "ocaml-base-compiler" then ["ocaml";] else [] in
    let atoms = List.filter (fun atom -> not @@ List.mem atom.Opam.name filter) atoms in
    let packages = List.fold_left (fun acc pkg ->
      Universe.M.add pkg.Opam.name pkg.version acc) Universe.M.empty atoms
    in
    match Opam.of_string filename with
    | Some pkg -> Some (pkg, Universe.of_packages packages)
    | None -> Format.eprintf "bad string: %s!\n%!" filename; None
    end 
  | _ -> None

let read dir =
  let contents = Sys.readdir dir |> Array.to_list in
  let pkgs = List.map (read_file dir) contents |> List.filter_map parse_file in
  let pkgs = List.filter (fun (pkg, _universe) -> not @@ List.mem pkg.Opam.name ["ocaml-base-compiler"; "ocaml"]) pkgs in
  List.iter (fun (pkg, universe) -> Universe.All.add pkg universe) pkgs;
  Format.eprintf "Detected %d packages %d universes\n%!" (List.length pkgs) (Universe.H.length Universe.All.v);
  pkgs


  open Lwt.Infix

let cache () =
  let opam_cache = Obuilder_spec.Cache.v "opam-archives" ~target:"/home/opam/.opam/download-cache" in
  if false then
    let dune_cache = Obuilder_spec.Cache.v "dune-cache" ~target:"/home/opam/.config/dune" in
    [opam_cache; dune_cache]
  else
    [opam_cache]

let network = ["host"]

let obuilder_to_string spec =
  Sexplib0.Sexp.to_string_hum (Obuilder_spec.sexp_of_stage spec)

let ocluster_build ~cap ~base_obuilder ~stdout ~stderr c =
  let obuilder_content =
    let open Obuilder_spec in
    { base_obuilder with
      ops = base_obuilder.ops @ [run ~cache:(cache ()) ~network "%s" c] }
  in
  Capnp_rpc_lwt.Sturdy_ref.connect_exn cap >>= fun service ->
  Capnp_rpc_lwt.Capability.with_ref service @@ fun submission_service ->
  let action = Cluster_api.Submission.obuilder_build (obuilder_to_string obuilder_content) in
  Capnp_rpc_lwt.Capability.with_ref (Cluster_api.Submission.submit submission_service ~urgent:false ~pool:"linux-x86_64" ~action ~cache_hint:"") @@ fun ticket ->
  Capnp_rpc_lwt.Capability.with_ref (Cluster_api.Ticket.job ticket) @@ fun job ->
  Capnp_rpc_lwt.Capability.wait_until_settled job >>= fun () ->
  let proc =
    let rec tail job start =
      Cluster_api.Job.log job start >>= function
      | Error (`Capnp e) -> Lwt_io.write stderr (Fmt.str "Error tailing logs: %a" Capnp_rpc.Error.pp e)
      | Ok ("", _) -> Lwt.return_unit
      | Ok (data, next) -> Lwt_io.write stdout data >>= fun () -> tail job next
    in
    tail job 0L >>= fun () ->
    Cluster_api.Job.result job >>= function
    | Ok _ ->
        Lwt.return (Ok ())
    | Error (`Capnp e) ->
        Lwt_io.write stdout (Fmt.str "%a" Capnp_rpc.Error.pp e) >>= fun () ->
        Lwt.return (Error ())
  in
  (* NOTE: any processes shouldn't take more than 2 hours *)
  let timeout =
    let hours = 2 in
    Lwt_unix.sleep (float_of_int (hours * 60 * 60)) >>= fun () ->
    Lwt_io.write_line stdout "+++ Timeout!! (2 hours) +++" >>= fun () ->
    Lwt_io.write_line stderr ("Command '"^c^"' timed-out ("^string_of_int hours^" hours).") >>= fun () ->
    Lwt.return (Error ())
  in
  Lwt.pick [timeout; proc]

let exec_out ~fexec ~fout =
  let stdin, stdout = Lwt_io.pipe () in
  let proc =
    Lwt.finalize
      (fun () -> fexec ~stdout)
      (fun () -> Lwt_io.close stdout)
  in
  fout ~stdin >>= fun res ->
  Lwt_io.close stdin >>= fun () ->
  proc >|= fun r ->
  (r, res)

let ocluster_build_str ~cap ~base_obuilder ~stderr ~default c =
  let rec aux ~stdin =
    Lwt_io.read_line_opt stdin >>= function
    | Some "@@@" ->
        let rec aux acc =
          Lwt_io.read_line_opt stdin >>= function
          | Some "@@@" -> Lwt.return (List.rev acc)
          | Some x -> aux (x :: acc)
          | None -> Lwt.return_nil (* Something went wrong, ignore. *)
        in
        aux []
    | Some _ -> aux ~stdin
    | None -> Lwt.return_nil
  in
  exec_out ~fout:aux ~fexec:begin fun ~stdout ->
    ocluster_build ~cap ~base_obuilder ~stdout ~stderr ("echo @@@ && "^c^" && echo @@@")
  end >>= function
  | (Ok (), r) ->
      Lwt.return r
  | (Error (), _) ->
      Lwt_io.write_line stderr ("Failure in ocluster: "^c) >>= fun () ->
      match default with
      | None -> Lwt.fail_with ("Failure in ocluster: "^c) (* TODO: Replace this with "send message to debug slack webhook" *)
      | Some v -> Lwt.return v

let failure_kind logfile =
  Lwt_io.with_file ~mode:Lwt_io.Input (Fpath.to_string logfile) begin fun ic ->
    let rec lookup res =
      Lwt_io.read_line_opt ic >>= function
      | Some "+- The following actions failed" -> lookup `Failure
      | Some "+- The following actions were aborted" -> Lwt.return `Partial
      | Some "[ERROR] Package conflict!" -> lookup `NotAvailable
      | Some "This package failed and has been disabled for CI using the 'x-ci-accept-failures' field." -> lookup `AcceptFailures
      | Some "+++ Timeout!! (2 hours) +++" -> Lwt.return `Timeout
      | Some _ -> lookup res
      | None -> Lwt.return res
    in
    lookup `Other
  end

let distribution_used = "debian-unstable"

let with_test pkg = {|
elif [ $res = 0 ]; then
    opam reinstall -vty "|}^pkg^{|"
    res=$?
    if [ $res = 20 ]; then
        res=0
    fi
|}

let with_test pkg =
  if false then
    with_test pkg
  else
    ""

let run_script pkg universe =
  let packages = Universe.M.fold (fun name version s -> Opam.{name; version} :: s) universe.Universe.packages [pkg] in
  let packages_str = String.concat " " (List.map (fun pkg -> Format.asprintf "%a" Opam.pp_package pkg) packages) in
  {|
opam depext -vy |}^packages_str^{|
opam install -vy |}^packages_str^{|
echo hi
~/voodoo_prep
find prep -type d
~/odoc-upload.sh    
|}

let run_job ~cap ~stderr ~base_obuilder ~num ~pool pkg universe =
  Lwt_pool.use pool begin fun () ->
    Lwt_io.write_line stderr (Format.asprintf "[%s] Checking %a..." num Opam.pp_package pkg ) >>= fun () ->
    let logfile = Fpath.v (Format.asprintf "%a.log" Opam.pp_package pkg) in
    Lwt_io.with_file ~flags:Unix.[O_WRONLY; O_CREAT; O_TRUNC] ~perm:0o640 ~mode:Lwt_io.Output (Fpath.to_string logfile) begin fun stdout ->
      ocluster_build ~cap ~base_obuilder ~stdout ~stderr (run_script pkg universe)
    end >>= function
    | Ok () ->
        Lwt_io.write_line stderr ("["^num^"] succeeded.") >>= fun () ->
        Lwt_io.open_file ~mode:Output (Format.asprintf "%a.success" Opam.pp_package pkg) >>= fun c ->
        Lwt_io.write_line c "success" >>= fun () ->
        Lwt_io.close c
    | Error () ->
        failure_kind logfile >>= begin function
        | `Partial ->
            Lwt_io.write_line stderr ("["^num^"] finished with a partial failure.")
        | `Failure ->
            Lwt_io.write_line stderr ("["^num^"] failed.")
        | `NotAvailable ->
            Lwt_io.write_line stderr ("["^num^"] finished with not available.")
        | `Other | `AcceptFailures | `Timeout ->
            Lwt_io.write_line stderr ("["^num^"] finished with an internal failure.")
        end
  end

let () =
  Lwt.async_exception_hook := begin fun e ->
    let msg = Printexc.to_string e in
    prerr_endline ("Async exception raised: "^msg);
  end

let get_obuilder from =
  let open Obuilder_spec in
  let cache = [ Obuilder_spec.Cache.v "opam-archives" ~target:"/home/opam/.opam/download-cache" ] in
  stage ~from begin
    [ user ~uid:1000 ~gid:1000;
      workdir "/home/opam";
      run ~network "sudo apt-get update";
      run ~network "sudo apt-get install -yy m4 python3-pip";
      run ~network "python3 -m pip install git+https://github.com/s3tools/s3cmd.git";
      run "echo running again and again and again and again and again and again";
      run ~network "git -C opam-repository pull origin master"; (* "&& git -C opam-repository checkout %s" (Filename.quote opam_repo_commit); *)
    ] @
    (if false then
       [run ~network "git -C opam-repository pull git://github.com/kit-ty-kate/opam-repository.git opam-health-check"]
     else
       []
    ) @ [
      env "OPAMPRECISETRACKING" "1"; (* NOTE: See https://github.com/ocaml/opam/issues/3997 *)
      env "OPAMDEPEXTYES" "1";
      run "opam update";
      run "echo > /home/opam/.s3cfg \"%s\"" s3cfg;
      run ~network "~/.local/bin/s3cmd ls";
      run ~network ~cache "opam pin add -y git://github.com/jonludlam/voodoo-prep";
      run "cp $(opam config var bin)/voodoo_prep /home/opam";
      run "cp $(opam config var bin)/odoc-upload.sh /home/opam";
      run "opam remove -ay";
    ]
  end

module Pkg_set = Set.Make (String)

let run_jobs ~cap ~stderr ~pool pkgs =
  Format.eprintf "run jobs: %d packages\n%!" (List.length pkgs);
  (* let pp fmt (pkg, universe) = Format.fprintf fmt "%a (universe %a)" Opam.pp_package pkg Universe.pp universe in *)
  List.map begin fun (pkg, universe) ->
    (* let blacklist = M2.find pkg blacklist in *)
    Format.eprintf "Finding...\n%!";
    (* Format.eprintf "Blacklisted: [ @[<v>%a@]" (Format.pp_print_list pp) blacklist; *)
    Format.eprintf "pkg: %a universe: %a" Opam.pp_package pkg Universe.pp universe;
    let ocaml_version = Universe.M.find "ocaml" universe.Universe.packages in
    Format.eprintf "Found...\n%!";

    let base_image_version =
      match Astring.String.cuts ~sep:"." ocaml_version with
      | [major; minor; _micro] ->
        Format.eprintf "major: %s minor: %s\n%!" major minor;
        Some (major ^ "." ^ minor)
      | _xs ->
        Format.eprintf "erk, %s\n%!" ocaml_version; None
    in
    match base_image_version with
    | Some v ->
      Format.eprintf "version: %s\n%!" v;
      let docker_tag = Printf.sprintf "ocaml/opam:debian-unstable-ocaml-%s" v in
      let base_obuilder = get_obuilder docker_tag in
      run_job ~cap ~stderr ~base_obuilder ~num:"" ~pool pkg universe
    | None -> Lwt.return ()
  end pkgs |> Lwt.join

let get_cap ~stderr =
  let home = Sys.getenv "HOME" in
  let cap_file = home^"/ocluster.cap" in (* TODO: fix that *)
  let vat = Capnp_rpc_unix.client_only_vat () in
  match Capnp_rpc_unix.Cap_file.load vat cap_file with
  | Ok sr ->
      Lwt.return sr
  | Error _ ->
      Lwt_io.write_line stderr "cap file couldn't be loaded" >>= fun () ->
      Lwt.fail_with "cap file not found"

let run_locked = ref false

let is_running () = !run_locked

let wait_current_run_to_finish =
  let rec loop () =
    if is_running () then
      Lwt_unix.sleep 1. >>= loop
    else
      Lwt.return_unit
  in
  loop


let rec take n l =
  match n, l with
  | 0, _ -> []
  | _, [] -> []
  | n, x::xs -> x :: take (n-1) xs

let rec drop n l =
  match n, l with
  | 0, x -> x
  | _, [] -> []
  | n, _::xs -> drop (n-1) xs

let run pkgs =
  let pool = Lwt_pool.create 100 (fun () -> Lwt.return ()) in

  let stderr = Lwt_io.stderr in
  get_cap ~stderr >>= fun cap ->
  run_jobs ~cap ~stderr ~pool pkgs


let analysis dir =
  let pkgs = read dir in
  (* let sets = List.map (fun (pkg, universe) ->
    let s = Universe.M.fold (fun name version acc -> Universe.S.add Opam.{name; version} acc) (Universe.add universe pkg).packages Universe.S.empty in
    (pkg, s, universe)) pkgs in

  let blacklist =
    List.fold_left (fun acc ((pkg : Opam.package), deps, universe) ->
    let supersets =
      List.fold_left (fun acc (pkg', deps', _) ->
        if pkg = pkg'
        then acc
        else 
          if Universe.S.subset deps deps' then (pkg',deps',Universe.S.cardinal deps')::acc else acc) [] sets in
    if List.length supersets > 0

    then begin
      let all = List.sort (fun (_, _, n1) (_, _, n2) -> Int.compare n2 n1) supersets in
      let (_ok_pkg, _, _) = List.hd all in
      let blk = List.tl all in
      (* Format.eprintf "Package %a to be used for %a in universe %s\n%!" Opam.pp_package ok_pkg Opam.pp_package pkg digest; *)
      List.fold_left (fun acc (pkg', _, _) ->
        (* Format.eprintf "  Blacklisting from package %a\n%!" Opam.pp_package pkg'; *)
        M2.update pkg'
          (function
          | None -> Some [pkg, universe]
          | Some l -> Some ((pkg, universe)::l)) acc) acc blk
    end else acc
  ) M2.empty sets in *)
  (* M2.iter (fun k v ->
    Format.fprintf Format.std_formatter "%a\n" Opam.pp_package k;
    List.iter (fun (p,d) -> Format.fprintf Format.std_formatter "  %s: %a\n%!" d Opam.pp_package p) v) blacklist *)
  pkgs

let _ =
  let pkgs = analysis Sys.argv.(1) in
  Lwt_main.run (run pkgs)



