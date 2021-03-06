module Content.MaynardStartsNewXCTeam exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "press" ] ]
    |> Card.headerH3 [] [ text "Beacon-Villager, 2016-06-26" ]
    |> Card.block []
      [ Card.text []
        [ a
          [ href "http://maynard.wickedlocal.com/sports/20160726/maynard-high-wants-to-start-cross-country-team" ]
          [ text ("Maynard’s been able to offer several fall sports to our students to date, "
              ++ "and an impressive number of Maynard kids participate,” said Dr. Robert Gerardi, "
              ++ "district superintendent. “Cross country would offer an option to both boys and "
              ++ "girls who’d like to try something other than our other fall team sports.") ]
        ]
      ]
