module Content.TigerInTheCat exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "quotes" ] ]
    -- |> Card.headerH3 [] [ text "Quote" ]
    |> Card.block []
      [ Card.text []
        [ text "The long run puts the tiger in the cat."
        , p [] [ small [] [ text "Bill Squires" ] ]
      ] ]
