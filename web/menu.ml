(* Menu definitions shared between client and server *)

module Item = struct
  type t =
    | WhyOCaml
    | IndustrialUsers
    | AcademicExcellence
    | SuccessStories
    | Language
    | Packages
    | Applications
    | BestPractices
    | Opportunities
    | News
    | AroundTheWeb
    | Archive

  let string_of : t -> string = function
    | WhyOCaml -> "why_ocaml"
    | IndustrialUsers -> "industrial_users"
    | AcademicExcellence -> "academic_excellence"
    | SuccessStories -> "success_stories"
    | Language -> "language"
    | Packages -> "packages"
    | Applications -> "applications"
    | BestPractices -> "best_practices"
    | Opportunities -> "opportunities"
    | News -> "news"
    | AroundTheWeb -> "around_the_web"
    | Archive -> "archive"

  let id_of x = "item_" ^ string_of x
end

module Section = struct
  type t = Principles | Resources | Communities

  let string_of : t -> string = function
    | Principles -> "principles"
    | Resources -> "resources"
    | Communities -> "communities"

  let button_id_of x = "button_section_" ^ string_of x

  let menu_id_of x = "menu_section_" ^ string_of x
end

let menu : (Section.t * Item.t list) list =
  [
    ( Principles,
      [ WhyOCaml; IndustrialUsers; AcademicExcellence; SuccessStories ] );
    (Resources, [ Language; Packages; Applications; BestPractices ]);
    (Communities, [ Opportunities; News; AroundTheWeb; Archive ]);
  ]
