module Content.NewsDistricts2017 exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "press" ] ]
    |> Card.headerH3 [] [ text "Beacon-Villager, 2017-11-14" ]
    |> Card.block []
      [ Card.text []
        [ a
          [ href "http://maynard.wickedlocal.com/sports/20171114/maynard-girls-place-fourth-at-district-meet" ]
          [ text "Strong performances at the Division 2 Central cross-country meet"
          , img
            [ src "static/img/beacon_villager_2017_districts.jpg"
            , alt ("")
            , style [("width","100%")]
            ]
            []
          ]
        ]
      ]
