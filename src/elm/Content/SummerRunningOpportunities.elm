module Content.SummerRunningOpportunities exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Color
import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.inverted Color.orange ]
    |> Card.headerH3 [] [ cardTitle ]
    |> Card.block []
      [ Card.text [] [ cardBody ] ]
    |> Card.footer []
      [ small [ class "text-muted" ] [ text "2017-07-24" ] ]

cardTitle : Html a
cardTitle =
  text "Summer Running Opportunities"

cardBody : Html a
cardBody =
  div []
    [ p [] [ text "Optional running opportunities this summer:" ]
    , ul []
      [ li []
        [ p []
          [ text "7 AM Wednesday Track Workouts at the AB Track. If interested send an email to "
          , a [ href "mailto:RunActon+subscribe@googlegroups.com" ] [ text "RunActon" ]
          , text " Google group."
          ]
        ]
      , li []
        [ text "Tiki 5k Trail Race Series in Westford @ Nashoba Ski Resort on Wednesday nights at 7pm, "
        , ul []
          [ li [] [ text "July 12, 2017" ]
          , li [] [ text "July 19, 2017" ]
          , li [] [ text "July 26, 2017" ]
          ]
        , text "This is a REALLY FUN XC style trail race that finishes at the beach with a post race meal and AWESOME Raffles."
        ]
      ]
    ]
