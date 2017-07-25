module Content.CardLists exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card

import Content.CrossCountryIs
import Content.SummerTraining
import Content.SummerRunningOpportunities
import Content.TeamPhoto
import Content.MaynardStartsNewXCTeam
import Content.MxcAtShirley

cards =
  [ Card.columns
    [ Content.SummerRunningOpportunities.card
    , Content.SummerTraining.card
    , Content.MxcAtShirley.card
    , Content.TeamPhoto.card
    , Content.CrossCountryIs.card
    , Content.MaynardStartsNewXCTeam.card
    ]
  ]
