module Pages.CourseMap exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Css
import Html.CssHelpers
import MainCss

import Bootstrap.Card as Card


type Msg
    = None

type alias Model = { }


init : Model
init = { }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( { }, Cmd.none )


view : Model -> Html Msg
view model =
  div [ class "container text-center" ]
    [ Card.config [ Card.info, Card.attrs [] ]
      |> Card.block []
        [ Card.titleH3 [] [ text "New course for 2017!" ]
        , Card.text []
          [img
            [ src "static/img/2017_coursemap.jpg"
            , alt "2016 team"
            , style [("max-width", "100%"), ("max-height", "100%")]
            ] []
          ]
        ]
      |> Card.footer []
        [ small [ class "text-muted" ] [ a [ href "/#/coursemap2016" ] [ text "See the previous course" ] ] ]
      |> Card.view
    ]
