module Content.Template exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [] ]
    |> Card.block []
    |> Card.headerH3 [] [ text "Announcement" ]
      [ Card.text []
        [ text "<content>"
        ]
      ]
    |> Card.footer []
      [ small [ class "text-muted" ] [ text "<date>" ] ]
