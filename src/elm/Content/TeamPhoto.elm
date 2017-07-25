module Content.TeamPhoto exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "w-100" ] ]
    |> Card.block []
      [ Card.text [] [ img
        [ src "static/img/2016_team.jpg"
        , alt "2016 team"
        , style [("max-width", "100%"), ("max-height", "100%")]
        ] [] ] ]
    -- |> Card.footer []
    --   [ small [ class "text-muted" ] [ text "The dATE" ] ]
