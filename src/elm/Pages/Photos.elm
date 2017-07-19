module Pages.Photos exposing (..)

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


init : Model
init = { }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( { }, Cmd.none )


view : Model -> Html Msg
view model =
  div []
    [ img
        [ src "static/img/2016_team.jpg"
        , MainCss.styles
            [ Css.width (Css.pct 80)
            , Css.border3 (Css.px 4) Css.solid (Css.hex "#337AB7")
            ]
        ]
        []
    ]
