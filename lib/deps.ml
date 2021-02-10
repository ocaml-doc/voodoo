module M = Fpath.Map

(** Internal normalization, also remove trailing separator. *)
let norm p = Fpath.(rem_empty_seg (normalize p))

module Target : sig
  type target = private { mutable path : Fpath.t; mutable deps : target list }

  val add : target M.t ref -> Fpath.t -> target list -> target
  (** Add a new target or update an existing one. *)

  val rename : target M.t ref -> target -> dst:Fpath.t -> unit
  (** [dst] must not exist in the map. *)
end = struct
  type target = { mutable path : Fpath.t; mutable deps : target list }
  (** Mutable to support renaming. *)

  (** This is the only function that can create a [target]. *)
  let add tbl path deps =
    let path = norm path in
    match M.find_opt path !tbl with
    | Some t ->
        t.deps <- deps @ t.deps;
        t
    | None ->
        let t = { path; deps } in
        tbl := M.add path t !tbl;
        t

  let rename tbl target ~dst =
    let dst = norm dst in
    if M.mem dst !tbl then failwith "Deps.rename: Collision";
    let old_target = target.path in
    target.path <- dst;
    tbl := M.add dst target (M.remove old_target !tbl)
end

type t = Target.target M.t ref

let create () = ref M.empty

let add tbl path deps =
  let deps = List.rev_map (fun dep -> Target.add tbl dep []) deps in
  ignore (Target.add tbl path deps)

let rename tbl src ~dst =
  let src = norm src in
  let rec rename_loop = function
    | Seq.Nil -> ()
    | Cons ((_, target), tl) -> (
        match Fpath.rem_prefix src target.Target.path with
        | None -> ()
        | Some suffix ->
            Target.rename tbl target ~dst:(Fpath.( // ) dst suffix);
            rename_loop (tl ()) )
  in
  rename_loop (M.to_seq_from src !tbl ())

let fold f tbl acc =
  M.fold
    (fun _ { Target.path; deps } acc ->
      f path (List.rev_map (fun t -> t.Target.path) deps) acc)
    !tbl acc
