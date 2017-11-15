module Content.BannerPhoto exposing (..)

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
          [ src "static/img/2017_banner.jpg"
          , alt "2017 Maynard XC"
          , style [("max-width", "100%"), ("max-height", "100%")]
          ] []
        ]
      ]
