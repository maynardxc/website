module Content.SummerTraining exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Color
import Bootstrap.Card as Card

card : Card.Config a
card =
  Card.config [ Card.attrs [ class "announcement" ] ]
    |> Card.headerH3 [] [ text "Announcement" ]
    |> Card.block []
      [ Card.text [] [ cardBody ] ]
    -- |> Card.footer []
    --   [ small [ class "text-muted" ] [ text "Coach Karen" ] ]

cardBody : Html a
cardBody =
  div []
    [ h4 [] [ text "Summer Training" ]
    , p [] [ text "Regardless of the parent led runs/workouts, each of you should be doing the following:" ]
    , ul []
      [ li [] [ text "Running 3-5 days a week" ]
      , li [] [ text "Varying the intensity of those runs (some days easy/light jog, other days throw in some higher intensity sessions in the middle of your runs" ]
      , li [] [ text "Distances of 3-5 miles/run or 25-40 minutes/run" ]
      ]
    , p [] [ text "Please ensure that you're considering the following:" ]
    , ul []
     [ li [] [ text "Proper Hydration" ]
     , li [] [ text "Proper Footwear" ]
     , li [] [ text "Awareness of your surroundings when out running" ]
     ]
    ]

--
-- Optional Running Opportunities:
--
-- •  7 AM Wednesday Track Workouts at the AB Track led by Acton Town Resident and friend of mine and Coach Karen.  Coach Karen will be showing up for many of these to get in her own workout she would love to see you there! If you plan to attend any of these workouts, you will need to subscribe to the #RunActon Google Groups - important information about each weeks workouts and about the start time (currently 7am, but might change) will be posted there.   To subscribe, send an email to RunActon+subscribe@googlegroups.com.
--
--
--
-- •  Tiki 5k Trail Race Series in Westford @ Nashoba Ski Resort on Wednesday nights at 7pm on July 12, 2017, July 19, 2017 & July 26, 2017.  This is a REALLY FUN XC style trail race that finishes at the beach with a post race meal and AWESOME Raffles (in previous years the top raffle prizes included tickets to Blue man group and weekends at Killington and even a Samsung Galaxy phone! among other cool things like Hats and Stuff)
