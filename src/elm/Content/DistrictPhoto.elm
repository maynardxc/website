module Content.DistrictPhoto exposing (..)

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
          [ src "static/img/districts_2017_daniel.jpg"
          , alt "Running at districts 2017"
          , style [("max-width", "100%"), ("max-height", "100%")]
          ] []
          , small [] [ text "Central District Boys Division 2" ]
        ]
      ]
