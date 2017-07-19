module Pages.Results exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Css
import Html.CssHelpers
import MainCss


type Msg
    = None


type alias Model = { }


-- { id, class, classList } =
--     Html.CssHelpers.withNamespace "ebws"


init : Model
init = { }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( { }, Cmd.none )


view : Model -> Html Msg
view model =
  div []
    [ table [ class "table table-striped" ]
      [ thead [ class "thead-inverse" ]
        [ tr []
          [ th [] [ text "Date" ]
          , th [] [ text "Location" ]
          , th [ rowspan 4 ] [ text "Results" ]
          ]
        ]
      , tbody []
        [ resultRow "Nov. 12 2016" "District Meet" "" ""
                    ""
                    ""
        , resultRow "Nov. 2 2016" "Hudson" "" ""
                    "static/img/results/20161102 @ Hudson-Girls.jpg"
                    "static/img/results/20161102 @ Hudson-Boys.jpg"
        , resultRow "Oct. 25 2016" "Littleton" "" ""
                    "static/img/results/20161025-Girls vs. Littleton @ Littleton.jpg"
                    "static/img/results/20161025-Boys vs Littleton @ Littleton.jpg"
        , resultRow "Oct. 13 2016" "Naragansett" "" ""
                    "static/img/results/20161013Bromfield&Murdock @ Bromfield-Girls.jpg"
                    "static/img/results/20161013-Bromfield&Murdock @ Bromfield-Boys.jpg"
        , resultRow "Oct. 5 2016" "Naragansett" "" ""
                    "static/img/results/20161005-Westford&AB @ Stonybrook-Girls.jpg"
                    "static/img/results/20161005-Westford&AB @ Stonybrook-Boys.jpg"
        , resultRow "Sept. 29 2016" "Naragansett" "" ""
                    "static/img/results/2016 Girls naragansett & bromfield @ naragansett.jpg"
                    "static/img/results/2016 Boys naragansett & bromfield @ naragansett.jpeg"
        , resultRow "Sept. 22 2016" "Clinton" "" ""
                    "static/img/results/20160922Murdock-Clinton @ Murdock - Girls.jpg"
                    "static/img/results/20160922 Murdock-Clinton @ Murdock - Boys.jpg"
        , resultRow "Sept. 9 2016" "Maynard" "" ""
                    "static/img/results/2016 Sizer Charter - Girls.tif"
                    "static/img/results/2016 Sizer Charter - Boys.tif"
        ]
      ]
    ]

resultRow : String -> String -> String -> String -> String -> String -> Html Msg
resultRow date location points place girls boys =
  tr []
    [ td [] [ text date ]
    , td [] [ text location ]
    , td [] [ text points ]
    , td [] [ text place ]
    , img [ src girls, MainCss.styles [ Css.width (Css.px 30), Css.border3 (Css.px 4) Css.solid (Css.hex "#001212") ] ] []
    , img [ src boys, MainCss.styles [ Css.width (Css.px 30), Css.border3 (Css.px 4) Css.solid (Css.hex "#001212") ] ] []
    ]
