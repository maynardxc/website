module Content.MaynardHoldFirstMeet exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "press" ] ]
    |> Card.headerH3 [] [ text "Beacon-Villager, 2016-09-12" ]
    |> Card.block []
      [ Card.text []
        [ a
          [ href "http://maynard.wickedlocal.com/sports/20160912/maynard-holds---wins---first-meet-in-30-years" ]
          [ text ("The organization was typical for a first meet of the season – well, in the last 30 seasons. "
              ++ "But after a late start, Maynard High’s cross-country team, it’s first since 1986, began the "
              ++ "season with a confidence-boosting sweep of Sizer Charter School.")
          ]
        ]
      ]
