module Content.DistrictAwardsPhoto exposing (..)

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
          [ src "static/img/district_girls_top_15.jpg"
          , alt "Districts Girls Top 15"
          , style [("max-width", "100%"), ("max-height", "100%")]
          ] []
          , small [] [ text "Central District Girl Division 2, top 15" ]
        ]
      ]
