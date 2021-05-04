(* Tailwind module *)

let numeric base n =
  if n < 0 then "-" ^ base ^ "-" ^ string_of_int (-n)
  else base ^ "-" ^ string_of_int n

(* {2 Layout} *)

let container = "container"

let block = "block"

let inline_block = "inline-block"

let flex = "flex"

let flex_none = "flex-none"

let inline_flex = "inline-flex"

let hidden = "hidden"

let float_right = "float-right"

let overflow_auto = "overflow-auto"

let overflow_hidden = "overflow-hidden"

let sticky = "sticky"

let relative = "relative"

let absolute = "absolute"

let transform = "transform"

let top = numeric "top"

let bottom = numeric "bottom"

let right = numeric "right"

let left = numeric "left"

let inset_x = numeric "inset-x"

let left_1_2 = "left-1/2"

let z = numeric "z"

(** {2 Flexbox} *)

let flex_row = "flex-row"

let flex_col = "flex-col"

let flex_1 = "flex-1"

(** {2 Grid} *)

let grid = "grid"

let gap n = "gap-" ^ string_of_int n

(** {2 Box alignment} *)

let justify_between = "justify-between"

let justify_start = "justify-start"

let items_center = "items-center"

let align_middle = "align-middle"

(* {2 Spacing} *)

let px = numeric "px"

let py = numeric "py"

let p = numeric "p"

let pr = numeric "pr"

let pl = numeric "pl"

let ml = numeric "ml"

let mt = numeric "mt"

let mb = numeric "mb"

let mx_auto = "mx-auto"

let m = numeric "m"

let my = numeric "my"

let space_x = numeric "space-x"

(** {2 Sizing} *)

let w = numeric "w"

let max_w_5xl = "max-w-5xl"

let max_w_7xl = "max-w-7xl"

let w_full = "w-full"

let w_auto = "w-auto"

let w_screen = "w-screen"

let h_screen = "h-screen"

let h_full = "h-full"

let h = numeric "h"

let max_w_screen_xl = "max-w-screen-xl"

let max_w_xs = "max-w-xs"

(** {2 Typeography} *)

let font_medium = "font-medium"

let font_normal = "font-normal"

let italic = "italic"

let list_disc = "list-disc"

let list_decimal = "list-decimal"

let font_semibold = "font-semibold"

let font_sans = "font-sans"

let font_mono = "font-mono"

let text_black = "text-black"

let text_white = "text-white"

let text_gray n = "text-gray-" ^ string_of_int n

let text_blue n = "text-blue-" ^ string_of_int n

let opacity n = "opacity-" ^ string_of_int n

(* Text size *)

let text_sm = "text-sm"

let text_base = "text-base"

let text_lg = "text-lg"

let text_xl = "text-xl"

let text_2xl = "text-2xl"

let text_3xl = "text-3xl"

(** {2 Backgrounds} *)

let bg_gray n = "bg-gray-" ^ string_of_int n

let bg_yellow n = "bg-yellow-" ^ string_of_int n

let bg_white = "bg-white"

(** {2 Borders} *)

type border_width = [ `b0 | `b1 | `b2 | `b4 | `b6 | `b8 ]

let border_fn stem : border_width -> string = function
  | `b0 -> stem ^ "-0"
  | `b1 -> stem
  | `b2 -> stem ^ "-2"
  | `b4 -> stem ^ "-4"
  | `b6 -> stem ^ "-6"
  | `b8 -> stem ^ "-8"

let rounded_md = "rounded-md"

let rounded_lg = "rounded-lg"

let rounded = "rounded"

let rounded_l_none = "rounded_l_none"

let border_t = border_fn "border-t"

let border_b = border_fn "border-b"

let border_l = border_fn "border-l"

let border_r = border_fn "border-r"

let border_yellow n = "border-yellow-" ^ string_of_int n

let border_gray n = "border-gray-" ^ string_of_int n

let border_blue n = "border-blue-" ^ string_of_int n

let ring n = "ring-" ^ string_of_int n

let ring_black = "ring-black"

let ring_opacity n = "ring-opacity-" ^ string_of_int n

let ring_offset n = "ring-offset-" ^ string_of_int n

(** {2 Effects} *)
let ring_yellow n = "ring-yellow-" ^ string_of_int n

let shadow = "shadow"

let shadow_lg = "shadow-lg"

(* Modifiers *)

let hover x = "hover:" ^ x

let sm x = "sm:" ^ x

let lg x = "lg:" ^ x

let md x = "md:" ^ x

let focus x = "focus:" ^ x

(** Accessibility *)

let sr_only = "sr-only"

(** {2 Interactivity} *)

let cursor_pointer = "cursor-pointer"

let outline_none = "outline-none"

let transition = "transition"

let ease_in_out = "ease-in-out"

let duration = numeric "duration-"
