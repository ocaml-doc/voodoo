(* Opam metadata sidebar *)
open Result
module Html = Tyxml.Html
module T = Tailwind

let link_icon =
  Html.Unsafe.data
    {|<svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
  <path fill-rule="evenodd" d="M12.586 4.586a2 2 0 112.828 2.828l-3 3a2 2 0 01-2.828 0 1 1 0 00-1.414 1.414 4 4 0 005.656 0l3-3a4 4 0 00-5.656-5.656l-1.5 1.5a1 1 0 101.414 1.414l1.5-1.5zm-5 5a2 2 0 012.828 0 1 1 0 101.414-1.414 4 4 0 00-5.656 0l-3 3a4 4 0 105.656 5.656l1.5-1.5a1 1 0 10-1.414-1.414l-1.5 1.5a2 2 0 11-2.828-2.828l3-3z" clip-rule="evenodd" />
</svg>|}

let license_icon =
  Html.Unsafe.data
    {|<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
  <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1.323l3.954 1.582 1.599-.8a1 1 0 01.894 1.79l-1.233.616 1.738 5.42a1 1 0 01-.285 1.05A3.989 3.989 0 0115 15a3.989 3.989 0 01-2.667-1.019 1 1 0 01-.285-1.05l1.715-5.349L11 6.477V16h2a1 1 0 110 2H7a1 1 0 110-2h2V6.477L6.237 7.582l1.715 5.349a1 1 0 01-.285 1.05A3.989 3.989 0 015 15a3.989 3.989 0 01-2.667-1.019 1 1 0 01-.285-1.05l1.738-5.42-1.233-.617a1 1 0 01.894-1.788l1.599.799L9 4.323V3a1 1 0 011-1zm-5 8.274l-.818 2.552c.25.112.526.174.818.174.292 0 .569-.062.818-.174L5 10.274zm10 0l-.818 2.552c.25.112.526.174.818.174.292 0 .569-.062.818-.174L15 10.274z" clip-rule="evenodd" />
</svg>|}

let readme_icon =
  Html.Unsafe.data
    {|
    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
  <path d="M9 4.804A7.968 7.968 0 005.5 4c-1.255 0-2.443.29-3.5.804v10A7.969 7.969 0 015.5 14c1.669 0 3.218.51 4.5 1.385A7.962 7.962 0 0114.5 14c1.255 0 2.443.29 3.5.804v-10A7.968 7.968 0 0014.5 4c-1.255 0-2.443.29-3.5.804V12a1 1 0 11-2 0V4.804z" />
</svg>
    |}

let changes_icon =
  Html.Unsafe.data
    {|
  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd" />
</svg>
  |}

let opt_to_list = function None -> [] | Some x -> [ x ]

let get_ok = function Ok x -> x | _ -> failwith "Not OK"

let package_url name : Link.Url.t =
  {
    page =
      {
        kind = "container-page";
        name;
        parent =
          Some { kind = "container-page"; name = "packages"; parent = None };
      };
    anchor = "";
    kind = "";
  }

let v cur o (otherversions : Odoc_model.Paths.Identifier.t list)
    (otherdocs : (Odoc_model.Paths.Identifier.t * Fpath.t) list) namever =
  let stripped x =
    let strip prefix x =
      if Astring.String.is_prefix ~affix:prefix x then
        Astring.String.with_range ~first:(String.length prefix) x
      else x
    in
    List.fold_right strip [ "https://"; "http://" ] x
  in
  Format.eprintf "%d other versions in metadata\n%!" (List.length otherversions);
  let title = namever in
  let synopsis =
    opt_to_list (OpamFile.OPAM.synopsis o)
    |> List.map (fun s ->
           Html.p ~a:[ Html.a_class T.[ mb 5; italic; text_sm ] ] [ Html.txt s ])
  in
  let iconed_link l =
    [
      Html.div
        ~a:[ Html.a_class T.[ mb 3 ] ]
        (List.map
           (fun (icon, h, txt) ->
             Html.div
               ~a:[ Html.a_class T.[ flex; space_x 2 ] ]
               [
                 icon;
                 Html.a
                   ~a:
                     [
                       Html.a_class
                         T.[ "text-orange"; cursor_pointer; mb 2; text_sm ];
                       Html.a_href h;
                     ]
                   [ Html.txt txt ];
               ])
           l);
    ]
  in
  let links name x =
    [
      Html.h2
        ~a:[ Html.a_class T.[ font_semibold; mb 2; text_sm ] ]
        [ Html.txt name ];
      Html.div
        ~a:[ Html.a_class T.[ mb 3 ] ]
        (List.map
           (fun h ->
             Html.a
               ~a:
                 [
                   Html.a_class
                     T.[ "text-orange"; cursor_pointer; mb 2; text_sm ];
                   Html.a_href h;
                 ]
               [ Html.txt (stripped h) ])
           x);
    ]
  in
  let text name x =
    [
      Html.h2
        ~a:[ Html.a_class T.[ font_semibold; mb 2; text_sm ] ]
        [ Html.txt name ];
      Html.p
        ~a:[ Html.a_class T.[ mb 3; text_sm ] ]
        [ Html.txt (String.concat "," x) ];
    ]
  in
  let license_file, others =
    List.partition
      (fun (_id, doc) ->
        Astring.String.is_prefix ~affix:"license"
          (Astring.String.Ascii.lowercase (Fpath.basename doc)))
      otherdocs
  in
  let readme, others =
    List.partition
      (fun (_id, doc) ->
        Astring.String.is_prefix ~affix:"readme"
          (Astring.String.Ascii.lowercase (Fpath.basename doc)))
      others
  in
  let changes, others =
    List.partition
      (fun (_id, doc) ->
        Astring.String.is_prefix ~affix:"change"
          (Astring.String.Ascii.lowercase (Fpath.basename doc)))
      others
  in
  let homepage =
    iconed_link
      (List.map (fun l -> (link_icon, l, stripped l)) o.homepage
      @ List.map
          (fun (id, p) ->
            let name = Fpath.basename p in
            let url =
              Odoc_document.Url.Anchor.from_identifier
                (id :> Odoc_model.Paths.Identifier.t)
              |> get_ok
            in
            let l = Link.href ~resolve:(Current cur) url in
            (license_icon, l, name))
          license_file
      @ List.map
          (fun (id, p) ->
            let name = Fpath.basename p in
            let url =
              Odoc_document.Url.Anchor.from_identifier
                (id :> Odoc_model.Paths.Identifier.t)
              |> get_ok
            in
            let l = Link.href ~resolve:(Current cur) url in
            (readme_icon, l, name))
          readme
      @ List.map
          (fun (id, p) ->
            let name = Fpath.basename p in
            let url =
              Odoc_document.Url.Anchor.from_identifier
                (id :> Odoc_model.Paths.Identifier.t)
              |> get_ok
            in
            let l = Link.href ~resolve:(Current cur) url in
            (changes_icon, l, name))
          changes)
  in

  let otherversions =
    [
      Html.details
        ~a:[ Html.a_class T.[ font_normal; mb 2; text_sm ] ]
        (Html.summary [ Html.txt "Other versions" ])
        [ Html.div ~a:[ Html.a_id "versions_container" ] [] ];
    ]
  in

  let authors = text "Authors" (OpamFile.OPAM.author o) in
  let issues = links "Issues" (OpamFile.OPAM.bug_reports o) in

  let otherdocs =
    match others with
    | [] -> []
    | _ ->
        links "Otherdocs"
          (List.map
             (fun (id, _y) ->
               let url =
                 Odoc_document.Url.Anchor.from_identifier
                   (id :> Odoc_model.Paths.Identifier.t)
                 |> get_ok
               in
               let l = Link.href ~resolve:(Current cur) url in
               l)
             others)
  in

  let rec formula_list = function
    | [] -> []
    | OpamTypes.Empty :: r -> formula_list r
    | Block f :: r -> formula_list (f :: r)
    | (And _ as a) :: r ->
        Html.li [ Html.txt "all of"; and_formula a ] :: formula_list r
    | (Or _ as o) :: r ->
        Html.li [ Html.txt "any of"; or_formula o ] :: formula_list r
    | Atom (name, _f) :: r ->
        (* let name, constr =
             html_atom univ.st ~prefix:(Uri.of_string prefix) pkg (name, f)
           in *)
        let sname = OpamPackage.Name.to_string name in
        let package_url = package_url sname in
        Html.li
          [
            Html.a
              ~a:
                [
                  Html.a_href (Link.href ~resolve:(Current cur) package_url);
                  Html.a_class T.[ "text-orange"; cursor_pointer ];
                ]
              [ Html.txt sname ];
          ]
        :: formula_list r
  and and_formula : OpamTypes.filtered_formula -> Html_types.flow5 Html.elt =
    function
    | Empty -> Html.txt ""
    | f -> Html.ul (formula_list (OpamFormula.ands_to_list f))
  and or_formula = function
    | OpamTypes.Empty -> Html.txt ""
    | f -> Html.ul @@ formula_list (OpamFormula.ors_to_list f)
  in

  let dependencies =
    [
      Html.details
        ~a:[ Html.a_class T.[ font_semibold; mb 2; text_sm ] ]
        (Html.summary [ Html.txt "Package dependencies" ])
        [
          Html.div
            ~a:[ Html.a_class T.[ font_normal ] ]
            [ and_formula (OpamFile.OPAM.depends o) ];
        ];
    ]
  in

  [
    Html.div
      ~a:[ Html.a_class T.[ flex; h 20; border_b `b1; relative ] ]
      [
        Html.h2
          ~a:
            [
              Html.a_class
                T.
                  [
                    text_xl;
                    absolute;
                    inset_x 0;
                    p 3;
                    bottom 0;
                    mt 7;
                    font_semibold;
                    text_gray 500;
                  ];
            ]
          [ Html.txt title ];
      ];
    Html.div
      ~a:[ Html.a_class T.[ m 3 ] ]
      (synopsis @ homepage @ otherdocs @ otherversions @ authors @ issues
     @ dependencies);
  ]
