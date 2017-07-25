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
import Content.MaynardGirlsRunStrong
import Content.MaynardGirlsRunPastMurdock
import Content.MaynardHoldFirstMeet
import Content.TigerInTheCat

cards =
  [ Card.columns
    [ Content.SummerRunningOpportunities.card
    , Content.TigerInTheCat.card
    , Content.SummerTraining.card
    , Content.MxcAtShirley.card
    , Content.MaynardGirlsRunStrong.card
    , Content.MaynardGirlsRunPastMurdock.card
    , Content.TeamPhoto.card
    , Content.CrossCountryIs.card
    , Content.MaynardHoldFirstMeet.card
    , Content.MaynardStartsNewXCTeam.card
    ]
  ]
