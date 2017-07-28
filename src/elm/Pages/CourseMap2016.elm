module Pages.CourseMap2016 exposing (..)

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
        [ Card.titleH3 [] [ text "This course was used during 2016." ]
        , Card.text []
          [img
            [ src "static/img/coursemap_2016.jpg"
            , alt "2016 team"
            , style [("max-width", "100%"), ("max-height", "100%")]
            ] []
          ]
        ]
      |> Card.view
    ]
