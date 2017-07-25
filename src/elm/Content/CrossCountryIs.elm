module Content.CrossCountryIs exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Color
import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "quotes" ] ]
    |> Card.headerH3 [] [ text "Quote" ]
    |> Card.block []
      [ Card.text [] [ crossCountryQuote
      , p [ class "text-muted" ] [ text "Coach Karen" ]
      ] ]
    -- |> Card.footer []
    --   [ small [ class "text-muted" ] [ text "Coach Karen" ] ]

crossCountryQuote : Html a
crossCountryQuote =
  text("Cross Country is...free running on open-air courses, over dirt "
    ++ "and grass and bridges. It is challenging and exhilarating, "
    ++ "both easy and hard. Cross country is teamwork and individual "
    ++ "accomplishments rolled into one. It is getting lost and finding "
    ++ "your way. Cross country is friends bound by sweat, tears, and cheers.")
