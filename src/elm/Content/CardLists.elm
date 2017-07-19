module Content.CardLists exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card

import Content.CrossCountryIs

cards =
  [ Card.deck
    [ Content.CrossCountryIs.card
    , Content.CrossCountryIs.card
    ]
  , Card.deck
    [ Content.CrossCountryIs.card
    , Content.CrossCountryIs.card
    , Content.CrossCountryIs.card
    ]
  ]
