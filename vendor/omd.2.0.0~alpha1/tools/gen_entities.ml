let split_on_char sep s =
  let open String in
  let r = ref [] in
  let j = ref (length s) in
  for i = length s - 1 downto 0 do
    if unsafe_get s i = sep then begin
      r := sub s (i + 1) (!j - i - 1) :: !r;
      j := i
    end
  done;
  sub s 0 !j :: !r

let f s =
  Scanf.sscanf s " \"&%s@;\": { %_S: [%s@], %_S: \"%_s@\" }"
    (fun s nums ->
       s, List.map (fun s -> int_of_string (String.trim s)) (split_on_char ',' nums))

let main ic =
  let rec loop () =
    match input_line ic with
    | s ->
        begin match f s with
        | name, codepoints ->
            Printf.printf "  | %S -> [" name;
            List.iteri (fun i cp -> if i > 0 then print_string "; "; Printf.printf "Compat.Uchar.of_int %d" cp) codepoints;
            Printf.printf "]\n"
        | exception _ ->
            ()
        end;
        loop ()
    | exception End_of_file ->
        Printf.printf "  | _ -> []\n%!"
  in
  Printf.printf "let f = function\n";
  loop ()

let () =
  let ic = open_in Sys.argv.(1) in
  main ic;
  close_in ic
