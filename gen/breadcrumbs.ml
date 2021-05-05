(* Breadcrumbs *)
module T = Tailwind
module Html = Tyxml.Html

let breadcrumbs home_url items =
  let handle (text, link) =
    let link =
      Html.a
        ~a:
          [
            Html.a_href link;
            Html.a_class
              T.
                [
                  ml 4;
                  text_sm;
                  font_medium;
                  text_gray 100;
                  hover @@ text_gray 500;
                ];
          ]
        [ Html.txt text ]
    in
    let icon =
      Html.Unsafe.data
        {|
    <svg class="flex-shrink-0 w-6 h-full text-gray-100" viewBox="0 0 24 44" preserveAspectRatio="none" fill="currentColor" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
        <path d="M.293 0l22 22-22 22h1.414l22-22-22-22H.293z" />
      </svg>
    |}
    in
    let div =
      Html.div
        ~a:[ Html.a_class T.[ flex; items_center; text_gray 100 ] ]
        [ icon; link ]
    in
    Html.li ~a:[ Html.a_class T.[ flex ] ] [ div ]
  in
  let home_svg =
    Html.Unsafe.data
      {|
  <svg class="flex-shrink-0 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
          <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
        </svg>
  |}
  in
  let home_link =
    Html.a
      ~a:
        [
          Html.a_href home_url;
          Html.a_class T.[ text_gray 100; hover @@ text_gray 500 ];
        ]
      [
        home_svg;
        Html.span ~a:[ Html.a_class T.[ sr_only ] ] [ Html.txt "Home" ];
      ]
  in
  let home_div =
    Html.div ~a:[ Html.a_class T.[ flex; items_center ] ] [ home_link ]
  in
  let home_li = Html.li ~a:[ Html.a_class T.[ flex ] ] [ home_div ] in
  Html.div
    ~a:[ Html.a_class T.[ flex_row; flex_1 ] ]
    [
      Html.nav
        ~a:
          [
            Html.a_class
              T.
                [
                  "bg-orange";
                  border_t `b1;
                  border_b `b1;
                  "border-orange";
                  flex;
                  flex_row;
                ];
          ]
        [
          Html.ol
            ~a:
              [
                Html.a_class
                  T.
                    [
                      max_w_screen_xl;
                      w_full;
                      px 4;
                      flex;
                      space_x 4;
                      sm @@ px 6;
                      lg @@ px 8;
                    ];
              ]
            (home_li :: List.map handle items);
        ];
    ]
