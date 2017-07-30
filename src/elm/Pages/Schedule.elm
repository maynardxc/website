module Pages.Schedule exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Css
import Html.CssHelpers
import MainCss
import FontAwesome.Web as Icon

type Msg = None

type HomeAway = Home | Away

type alias Link = Maybe String

type alias Meet =
  { date : String
  , day : String
  , homeAway : HomeAway
  , mapLink : Link
  , team : String
  , teamLink : Link
  }

type alias Model =
  { schedule : List Meet
  }


maynardLocationLink = "https://sites.google.com/a/maynard.k12.ma.us/maynard-high-school/about-us/general-information"
littletonTeamLink = "http://www.freewebs.com/lpsathletics/fall-sports"

sched2017 : List Meet
sched2017 =
  [ { date = "Sept 7"
    , day = "Thursday"
    , homeAway = Home
    , mapLink = Just maynardLocationLink
    , team = "Littleton"
    , teamLink = Just littletonTeamLink
    }
  , { date = "Sept 14"
    , day = "Thursday"
    , homeAway = Home
    , mapLink = Just maynardLocationLink
    , team = "Quabbin/Bromfield"
    , teamLink = Nothing
    }
  , { date = "Sept 18"
    , day = "Monday"
    , homeAway = Away
    , mapLink = Just "http://www.saima-park.org/"
    , team = "Sizer (Saima Park)"
    , teamLink = Nothing
    }
  , { date = "Sept 21"
    , day = "Thursday"
    , homeAway = Away
    , mapLink = Just "https://www.google.com/maps/place/Tahanto+Regional+High+School/@42.3712783,-71.7234027,17z/data=!4m12!1m6!3m5!1s0x89e3f721802c8b85:0x116ce7ea81d13832!2sTahanto+Regional+High+School!8m2!3d42.3712783!4d-71.721214!3m4!1s0x89e3f721802c8b85:0x116ce7ea81d13832!8m2!3d42.3712783!4d-71.721214"
    , team = "Tahanto"
    , teamLink = Nothing
    }
  , { date = "Sept 25"
    , day = "Monday"
    , homeAway = Home
    , mapLink = Just maynardLocationLink
    , team = "Hudson"
    , teamLink = Nothing
    }
  , { date = "Sept 28"
    , day = "Thursday"
    , homeAway = Away
    , mapLink =Nothing
    , team = "Invitational"
    , teamLink = Nothing
    }
  , { date = "Oct 5"
    , day = "Thursday"
    , homeAway = Home
    , mapLink = Just maynardLocationLink
    , team = "Clinton"
    , teamLink = Nothing
    }
  , { date = "Oct 12"
    , day = "Thursday"
    , homeAway = Home
    , mapLink = Just maynardLocationLink
    , team = "Ayer-Shirley"
    , teamLink = Nothing
    }
  , { date = "Oct 19"
    , day = "Thursday"
    , homeAway = Home
    , mapLink = Just maynardLocationLink
    , team = "Murdock"
    , teamLink = Nothing
    }
  , { date = "Oct 28"
    , day = "Saturday"
    , homeAway = Home
    , mapLink = Just maynardLocationLink
    , team = "Murdock"
    , teamLink = Nothing
    }
  ]


init : Model
init = { schedule = sched2017 }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ table [ class "table table-hover" ]
      [ thead []
        [ tr [] [ th [ colspan 3 ] [ h3 [] [ text "2017 Schedule" ] ] ] ]
      , tbody [] (List.map viewSchedule model.schedule)
      ]
    ]

viewSchedule : Meet -> Html Msg
viewSchedule meet =
  tr []
    [ td [] [ text meet.day ]
    , td [] [ text meet.date ]
    , td []
      [ span []
        [ viewHomeAway meet.homeAway
        , text " "
        , viewLink meet.mapLink Icon.map_marker
        , text " "
        , viewLink meet.teamLink (text meet.team)
        ]
      ]
    ]

viewHomeAway : HomeAway -> Html Msg
viewHomeAway homeAway =
  case homeAway of
    Home -> small [] [ text ("(home)") ]
    Away -> small [] [ text ("(away)") ]

viewLink : Link -> Html Msg -> Html Msg
viewLink link text =
  case link of
    Nothing -> text
    Just actualLink -> a [ href actualLink ] [ text ]
