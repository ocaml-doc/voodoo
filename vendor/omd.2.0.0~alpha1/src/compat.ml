module Uchar = struct
  external format_int : string -> int -> string = "caml_format_int"

let err_no_pred = "U+0000 has no predecessor"
let err_no_succ = "U+10FFFF has no successor"
let err_not_sv i = format_int "%X" i ^ " is not an Unicode scalar value"
let err_not_latin1 u = "U+" ^ format_int "%04X" u ^ " is not a latin1 character"

type t = int

let min = 0x0000
let max = 0x10FFFF
let lo_bound = 0xD7FF
let hi_bound = 0xE000

let bom = 0xFEFF
let rep = 0xFFFD

let succ u =
  if u = lo_bound then hi_bound else
  if u = max then invalid_arg err_no_succ else
  u + 1

let pred u =
  if u = hi_bound then lo_bound else
  if u = min then invalid_arg err_no_pred else
  u - 1

let is_valid i = (min <= i && i <= lo_bound) || (hi_bound <= i && i <= max)
let of_int i = if is_valid i then i else invalid_arg (err_not_sv i)
external unsafe_of_int : int -> t = "%identity"
external to_int : t -> int = "%identity"

let is_char u = u < 256
let of_char c = Char.code c
let to_char u =
  if u > 255 then invalid_arg (err_not_latin1 u) else
  Char.unsafe_chr u

let unsafe_to_char = Char.unsafe_chr

let equal : int -> int -> bool = ( = )
let compare : int -> int -> int = compare
let hash = to_int
end

module List = struct
  include List
  let rec find_opt p = function
  | [] -> None
  | x :: l -> if p x then Some x else find_opt p l
end

module Buffer = struct
  include Buffer
  let add_utf_8_uchar b u = match Uchar.to_int u with
  | u when u < 0 -> assert false
  | u when u <= 0x007F ->
      Buffer.add_char b (Char.unsafe_chr u)
  | u when u <= 0x07FF ->
      Buffer.add_char b (Char.unsafe_chr (0xC0 lor (u lsr 6)));
      Buffer.add_char b (Char.unsafe_chr (0x80 lor (u land 0x3F)))
  | u when u <= 0xFFFF ->
      Buffer.add_char b (Char.unsafe_chr (0xE0 lor (u lsr 12)));
      Buffer.add_char b (Char.unsafe_chr (0x80 lor ((u lsr 6) land 0x3F)));
      Buffer.add_char b (Char.unsafe_chr (0x80 lor (u land 0x3F)))
  | u when u <= 0x10FFFF ->
      Buffer.add_char b (Char.unsafe_chr (0xF0 lor (u lsr 18)));
      Buffer.add_char b (Char.unsafe_chr (0x80 lor ((u lsr 12) land 0x3F)));
      Buffer.add_char b (Char.unsafe_chr (0x80 lor ((u lsr 6) land 0x3F)));
      Buffer.add_char b (Char.unsafe_chr (0x80 lor (u land 0x3F)))
  | _ -> assert false
end
