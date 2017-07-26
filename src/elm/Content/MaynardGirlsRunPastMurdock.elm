module Content.MaynardGirlsRunPastMurdock exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "press" ] ]
    |> Card.headerH3 [] [ text "Beacon-Villager, 2016-10-14" ]
    |> Card.block []
      [ Card.text []
        [ a
          [ href "http://maynard.wickedlocal.com/sports/20161014/maynard-girls-run-past-murdock" ]
          [ text ("Grace Charron and Aurora Estabrook finished third and fourth as the Maynard girls "
              ++ "cross-country team defeated Murdock in a tri-meet with Bromfield on Oct. 13.")
          ]
        ]
      ]
