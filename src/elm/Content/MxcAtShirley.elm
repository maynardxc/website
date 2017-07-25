module Content.MxcAtShirley exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "press" ] ]
    |> Card.headerH3 [] [ text "Beacon-Villager, 2016-11-09" ]
    |> Card.block []
      [ Card.text []
        [ a
          [ href "http://maynard.wickedlocal.com/news/20161109/maynard-cross-country-competes-in-shirley" ]
          [ text ("Maynard High School’s cross-country team showed talent and strength on "
              ++ "Oct. 29 at the Midland-Wachussett League Division D meet, where the first-year "
              ++ "Tigers squad was pitted against more experienced runners from Ayer-Shirley, "
              ++ "Bromfield, Clinton, Littleton, Lunenburg, Murdock, Narragansett and Tahanto on "
              ++ "the 5-kilometer course at Holdenwood Wildlife Refuge in Shirley.") ]
        ]
      ]
