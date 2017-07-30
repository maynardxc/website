module Content.TeamPhoto exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "photo" ] ]
    |> Card.block []
      [ Card.text [ class "text-center" ]
        [ img
          [ src "static/img/better_team_photo_2016.jpg"
          , alt "2016 team"
          , style [("max-width", "100%"), ("max-height", "100%")]
          ] []
          , small [] [ text "The 2016 Maynard Cross Country Team" ]
        ]
      ]
