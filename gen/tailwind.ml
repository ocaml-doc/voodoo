(* Tailwind module *)

(* {2 Layout} *)

let container = "container"

let block = "block"

let inline_block = "inline-block"

let flex = "flex"

let inline_flex = "inline-flex"

let hidden = "hidden"

let float_right = "float-right"

let overflow_auto = "overflow-auto"

let overflow_hidden = "overflow-hidden"

let sticky = "sticky"

let relative = "relative"

let absolute = "absolute"

let transform = "transform"

let top n = "top-" ^ string_of_int n

let bottom n = "bottom-" ^ string_of_int n

let inset_x n = "inset-x-" ^ string_of_int n

let left_1_2 = "left-1/2"

let z n = "z-" ^ string_of_int n

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

(* {2 Spacing} *)

let px n = "px-" ^ string_of_int n

let py n = "py-" ^ string_of_int n

let p n = "p-" ^ string_of_int n

let ml n = "ml-" ^ string_of_int n

let mt n = "mt-" ^ string_of_int n

let mb n = "mb-" ^ string_of_int n

let mx_auto = "mx-auto"

let m n = "m-" ^ string_of_int n

let space_x n = "space-x-" ^ string_of_int n

(** {2 Sizing} *)

let w n = "w-" ^ string_of_int n

let max_w_5xl = "max-w-5xl"

let max_w_7xl = "max-w-7xl"

let w_full = "w-full"

let w_auto = "w-auto"

let w_screen = "w-screen"

let h_screen = "h-screen"

let h_full = "h-full"

let h n = "h-" ^ string_of_int n

let max_w_screen_xl = "max-w-screen-xl"

let max_w_xs = "max-w-xs"

(** {2 Typeography} *)

let font_medium = "font-medium"

let italic = "italic"

let font_semibold = "font-semibold"

let font_sans = "font-sans"

let text_black = "text-black"

let text_white = "text-white"

let text_gray n = "text-gray-" ^ string_of_int n

let text_blue n = "text-blue-" ^ string_of_int n

(* Text size *)

let text_sm = "text-sm"

let text_base = "text-base"

(** {2 Backgrounds} *)
let text_xl = "text-xl"

let bg_gray n = "bg-gray-" ^ string_of_int n

let bg_yellow n = "bg-yellow-" ^ string_of_int n

let bg_white = "bg-white"

(** {2 Borders} *)

let rounded_md = "rounded-md"

let rounded_lg = "rounded-lg"

let border_t = "border-t"

let border_b = "border-b"

let border_l = "border-l"

let border_r = "border-r"

let border_yellow n = "border-yellow-" ^ string_of_int n

let border_gray n = "border-gray-" ^ string_of_int n

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

let duration n = "duration-" ^ string_of_int n
