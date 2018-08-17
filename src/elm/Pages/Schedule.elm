module Pages.Schedule exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Css
import Html.CssHelpers
import MainCss
import FontAwesome.Web as Icon
import Bootstrap.Card as Card

import Auth

type Msg = None

type HomeAway = Home | Away

type alias Link = Maybe String

type alias Meet =
  { date : String
  , day : String
  , homeAway : HomeAway
  , mapLink : Link
  , team : String
  , teamLink : Link
  }

type alias Model = { }



init : Model
init = { }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Auth.Model -> Html Msg
view model authModel =
  case (Auth.isAuthorized authModel.calendar) of
    _ ->
      viewPrivileged model


viewPrivileged : Model -> Html Msg
viewPrivileged model =
  div [ class "container text-center" ]
    [ Card.config [ Card.info, Card.attrs [] ]
      |> Card.block []
        [ Card.text []
          [ iframe
            [ src "https://calendar.google.com/calendar/embed?src=4sl4aopkrgcftcs6qg90fa06lc%40group.calendar.google.com&ctz=America/New_York"
            , style
              [ ("border","0")
              , ("width", "100%")
              , ("height", "600px")
              ]
            ]
            []
          ]
        ]
      |> Card.view
    ]
