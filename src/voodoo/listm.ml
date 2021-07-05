(* List monad *)

let rec setify = function
  | x :: xs -> if List.mem x xs then setify xs else x :: setify xs
  | [] -> []

let ( >>= ) l f = List.flatten (List.map f l)

let filter pred item = if pred item then [ item ] else []
