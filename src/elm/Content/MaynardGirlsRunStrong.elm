module Content.MaynardGirlsRunStrong exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.Card as Card


card : Card.Config a
card =
  Card.config [ Card.attrs [ class "press" ] ]
    |> Card.headerH3 [] [ text "Beacon-Villager, 2016-11-01" ]
    |> Card.block []
      [ Card.text []
        -- [ text ("Maynard’s girls [...] made great strides this season and a group "
        --     ++ "that featured a host of middle school runners did well enough to place "
        --     ++ "second in Saturday’s Mid Wach D championships Holdenwood.")
        [ a
          [ href "http://maynard.wickedlocal.com/sports/20161101/maynard-girls-run-strong" ]
          [ text "Maynard girls run strong..."
          , img
            [ src "http://maynard.wickedlocal.com/storyimage/WL/20161101/SPORTS/161109355/AR/0/AR-161109355.jpg&MaxH=800&MaxW=800"
            , alt ("Maynard’s girls [...] made great strides this season and a group "
                ++ "that featured a host of middle school runners did well enough to place "
                ++ "second in Saturday’s Mid Wach D championships Holdenwood.")
            , style [("width","100%")]
            ]
            []
          ]
        ]
      ]
