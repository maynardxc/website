module Pages.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Css
import Html.CssHelpers
import MainCss

import Bootstrap.Button as Button
import Bootstrap.Card as Card

import Content.CardLists

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
  div [] Content.CardLists.cards
