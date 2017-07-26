module Pages.Schedule exposing (..)

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
  div [ class "container" ]
    [ table [ class "table table-inverse" ]
      [ thead []
        [ tr []
          [ th [] [ text "Date" ]
          , th [] [ text "" ]
          , th [] [ text "Team" ]
          ]
        ]
      , tbody []
        [ scheduleRow "Thursday Sept 7" "home" "Littleton"
        , scheduleRow "Thursday Sept 14" "home" "Quabbin/Bromfield"
        , scheduleRow "Monday Sept 18" "away" "Sizer(Saima Park)"
        , scheduleRow "Thursday Sept 21" "away" "Tahanto"
        , scheduleRow "Monday Sept 25" "home" "Hudson"
        , scheduleRow "Thursday Sept 28" "away" "Invitational"
        , scheduleRow "Thursday Oct. 5" "home" "Clinton"
        , scheduleRow "Thursday Oct. 12" "home" "Ayer-Shirley"
        , scheduleRow "Thursday Oct. 19" "home" "Murdock"
        , scheduleRow "Saturday Oct. 28" "away" "League Meet"
        ]
      ]
    ]

scheduleRow : String -> String -> String -> Html Msg
scheduleRow date ha team =
  tr []
    [ td [] [ text date ]
    , td [] [ text ha ]
    , td [] [ text team ]
    ]
