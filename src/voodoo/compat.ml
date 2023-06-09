module List = struct
  let concat_map f l = List.flatten (List.map f l)
end
