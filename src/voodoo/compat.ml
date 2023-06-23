module List = struct
  let concat_map f l = List.flatten (List.map f l)

  let rec find_opt p = function
    | [] -> None
    | x :: l -> if p x then Some x else find_opt p l
end
