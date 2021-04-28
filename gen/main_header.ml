(* Main site header *)

module Html = Tyxml.Html
module T = Tailwind

let v =
  let menu_items =
    [
      ( "Industry",
        [
          ("https://v3.ocaml.org/industry/whatisocaml", "What is OCaml");
          ("https://v3.ocaml.org/industry/users", "Industrial Users");
          ("https://v3.ocaml.org/industry/successstories", "Success Stories");
        ] );
      ( "Resources",
        [
          ("https://v3.ocaml.org/resources/releases", "Releases");
          ("https://v3.ocaml.org/resources/applications", "Applications");
          ("https://v3.ocaml.org/resources/language", "Language");
          ("https://v3.ocaml.org/resources/archive", "Archive");
        ] );
      ( "Community",
        [
          ("https://v3.ocaml.org/community/opportunities", "Opportunities");
          ("https://v3.ocaml.org/community/news", "News");
          ("https://v3.ocaml.org/community/aroundweb", "Around the Web");
        ] );
    ]
  in
  let submenu_item (href, text) =
    Html.a
      ~a:
        [
          Html.a_class
            T.
              [
                m (-3);
                p 3;
                block;
                rounded_md;
                hover @@ bg_gray 50;
                transition;
                ease_in_out;
                duration 150;
              ];
          Html.a_href href;
        ]
      [
        Html.p
          ~a:[ Html.a_class T.[ text_base; font_medium; text_gray 900 ] ]
          [ Html.txt text ];
      ]
  in

  let submenu items =
    Html.div
      ~a:
        [
          Html.Unsafe.string_attrib ":class"
            "{ 'opacity-100' : isOn, 'translate-y-0': isOn, 'opacity-0': \
             !isOn, 'translate-y-1': !isOn, 'hidden': !isOn }";
          Html.a_class
            T.
              [
                absolute;
                z 10;
                left_1_2;
                transform;
                "-translate-x-1/2";
                mt 3;
                px 2;
                w_screen;
                max_w_xs;
                sm @@ px 0;
              ];
        ]
      [
        Html.div
          ~a:
            [
              Html.a_class
                T.
                  [
                    rounded_lg;
                    shadow_lg;
                    ring 1;
                    ring_black;
                    ring_opacity 5;
                    overflow_hidden;
                  ];
            ]
          [
            Html.div
              ~a:
                [
                  Html.a_class
                    T.
                      [
                        relative;
                        grid;
                        gap 6;
                        bg_white;
                        px 5;
                        py 6;
                        sm @@ gap 8;
                        sm @@ p 8;
                      ];
                ]
              (List.map submenu_item items);
          ];
      ]
  in
  let button_svg =
    Html.Unsafe.data
      {|
  <svg aria-hidden=
                  "true" class=
                  "text-gray-400 ml-2 h-5 w-5 group-hover:text-gray-500"
                  fill="currentColor" viewbox="0 0 20 20" xmlns=
                  "http://www.w3.org/2000/svg">
                  <path clip-rule="evenodd" d=
                  "M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                  fill-rule="evenodd"></path></svg>
  |}
  in
  let button x =
    Html.button
      ~a:
        [
          Html.a_class
            T.
              [
                text_gray 500;
                (* group; ??? *)
                bg_white;
                rounded_md;
                inline_flex;
                items_center;
                text_base;
                font_medium;
                hover @@ text_gray 900;
                focus outline_none;
                focus @@ ring 2;
                focus @@ ring_offset 2;
                focus @@ ring_yellow 500;
              ];
        ]
      [ Html.span [ Html.txt x ]; button_svg ]
  in
  let menu (x, items) =
    Html.div
      ~a:
        [
          Html.Unsafe.string_attrib "x-data" "{ isOn: false }";
          Html.Unsafe.string_attrib "@click" "isOn = !isOn";
          Html.a_class T.[ relative ];
        ]
      [ button x; submenu items ]
  in
  let nav menu_items =
    Html.nav
      ~a:[ Html.a_class T.[ hidden; md flex; space_x 10 ] ]
      (List.map menu menu_items)
  in
  let caml_image =
    Html.div
      ~a:[ Html.a_class T.[ flex; justify_start ] ]
      [
        Html.a
          ~a:[ Html.a_href "https://v3.ocaml.org/" ]
          [
            Html.img ~src:"/logo1.jpeg" ~alt:""
              ~a:[ Html.a_class T.[ h 8; w_auto; sm @@ h 10 ] ]
              ();
          ];
      ]
  in
  Html.div
    ~a:[ Html.a_class T.[ relative; shadow ] ]
    [
      Html.div
        ~a:[ Html.a_class T.[ relative ] ]
        [
          Html.div
            ~a:[ Html.a_class T.[ max_w_7xl; mx_auto; px 4; sm @@ px 6 ] ]
            [
              Html.div
                ~a:
                  [
                    Html.a_class
                      T.
                        [
                          flex;
                          justify_between;
                          items_center;
                          md justify_start;
                          py 6;
                          md @@ space_x 10;
                        ];
                  ]
                [ caml_image; nav menu_items ];
            ];
        ];
    ]
