module Content.NewsLeague2017 exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "press" ] ]
    |> Card.headerH3 [] [ text "Beacon-Villager, 2016-10-31" ]
    |> Card.block []
      [ Card.text []
        [ a
          [ href "http://maynard.wickedlocal.com/sports/20171031/charron-leads-maynard-runners" ]
          [ text "Maynard girls place second, boys 4th, at the Mid-Wach E championships"
          , img
            [ src "static/img/beacon_villager_2017.jpg"
            , alt ("In only its second year, the Maynard girls cross-country team placed second at the Mid-Wach "
                ++ "E championships held at Hollis Hills Farm in Fitchburg on Oct. 28. with the Maynard boys placing "
                ++ " fourth.")
            , style [("width","100%")]
            ]
            []
          ]
        ]
      ]
