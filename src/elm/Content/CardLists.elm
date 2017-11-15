module Content.CardLists exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card

import Content.CrossCountryIs
import Content.TeamPhoto
import Content.MaynardStartsNewXCTeam
import Content.MxcAtShirley
import Content.MaynardGirlsRunStrong
import Content.MaynardGirlsRunPastMurdock
import Content.MaynardHoldFirstMeet
import Content.TigerInTheCat
import Content.BannerPhoto
import Content.DistrictAwardsPhoto
import Content.DistrictPhoto
import Content.NewsDistricts2017
import Content.NewsLeague2017

cards =
  [ Card.columns
    [ Content.BannerPhoto.card
    , Content.NewsDistricts2017.card
    , Content.NewsLeague2017.card
    , Content.DistrictAwardsPhoto.card
    , Content.TigerInTheCat.card
    , Content.DistrictPhoto.card
    , Content.MxcAtShirley.card
    , Content.MaynardGirlsRunStrong.card
    , Content.MaynardGirlsRunPastMurdock.card
    , Content.TeamPhoto.card
    , Content.CrossCountryIs.card
    , Content.MaynardHoldFirstMeet.card
    , Content.MaynardStartsNewXCTeam.card
    ]
  ]
