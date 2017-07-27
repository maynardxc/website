module Pages.Schedule exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Css
import Html.CssHelpers
import MainCss
import FontAwesome.Web as Icon

type Msg
    = None


type alias Model = { }


init : Model
init = { }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( { }, Cmd.none )


view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ table [ class "table" ]
      [ thead []
        [ tr []
          [ th [] [ text "Date" ]
          , th [] [ text "Team" ]
          ]
        ]
      , tbody []
        [ scheduleRow
            "Thursday Sept 7"
            "home" "https://sites.google.com/a/maynard.k12.ma.us/maynard-high-school/about-us/general-information"
            "Littleton" "http://www.freewebs.com/lpsathletics/fall-sports"
        , scheduleRow
          "Thursday Sept 14"
          "home" "https://sites.google.com/a/maynard.k12.ma.us/maynard-high-school/about-us/general-information"
          "Quabbin/Bromfield" "http://www.qrsd.org/our-schools/high-school/athletics/about-quabbin-athletics/"
        , scheduleRow
          "Monday Sept 18"
          "away" "http://www.saima-park.org/"
          "Sizer(Saima Park)" "https://www.sizerschool.org/content/athletics"
        , scheduleRow
          "Thursday Sept 21"
          "away" "https://www.google.com/maps/place/Tahanto+Regional+High+School/@42.3712783,-71.7234027,17z/data=!4m12!1m6!3m5!1s0x89e3f721802c8b85:0x116ce7ea81d13832!2sTahanto+Regional+High+School!8m2!3d42.3712783!4d-71.721214!3m4!1s0x89e3f721802c8b85:0x116ce7ea81d13832!8m2!3d42.3712783!4d-71.721214"
          "Tahanto" "http://tahantoregional.rschoolteams.com/page/2918/mn"
        , scheduleRow
          "Monday Sept 25"
          "home" "https://sites.google.com/a/maynard.k12.ma.us/maynard-high-school/about-us/general-information"
          "Hudson" "http://hudson-high-hudson-massachusetts.runnerspace.com/"
        , scheduleRow
          "Thursday Sept 28"
          "away" ""
          "Invitational" ""
        , scheduleRow
          "Thursday Oct. 5"
          "home" "https://sites.google.com/a/maynard.k12.ma.us/maynard-high-school/about-us/general-information"
          "Clinton" "http://hs.clinton.k12.ma.us/apps/pages/index.jsp?uREC_ID=78427&type=d"
        , scheduleRow
          "Thursday Oct. 12"
          "home" "https://sites.google.com/a/maynard.k12.ma.us/maynard-high-school/about-us/general-information"
          "Ayer-Shirley" "https://www.asrsd.org/schools/high-school/athletics/"
        , scheduleRow
          "Thursday Oct. 19"
          "home" "https://sites.google.com/a/maynard.k12.ma.us/maynard-high-school/about-us/general-information"
          "Murdock" "http://bluedevilathletics.weebly.com/"
        , scheduleRow
          "Saturday Oct. 28"
          "away" ""
          "League Meet" ""
        ]
      ]
    ]

scheduleRow : String -> String -> String -> String -> String -> Html Msg
scheduleRow date ha mapLink team teamLink =
  tr []
    [ td [] [ text date ]
    , td []
      [ span []
        [ small [] [ text ("(" ++ ha ++ ")") ]
        , text " "
        , a [ href mapLink ] [ Icon.map_marker ]
        , text " "
        , a [ href teamLink, class "team-name" ] [ text team ]
        ]
      ]
    ]
