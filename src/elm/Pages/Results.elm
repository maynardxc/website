module Pages.Results exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Css
import Html.CssHelpers
import MainCss
import List exposing (..)


type Msg
    = None


type alias Model = { }


-- { id, class, classList } =
--     Html.CssHelpers.withNamespace "ebws"


init : Model
init = { }

type alias Results =
  { date : String
  , location : String
  , locationLink : String
  , girlsPlace : String
  , girlsPoints : String
  , girlsResults : String
  , boysPlace : String
  , boysPoints : String
  , boysResults : String
  }

type alias ResultSet =
  { name : String
  , results : List Results
  }

rs2017 : ResultSet
rs2017 =
  { name = "2017"
  , results = []
  }

rs2016 : ResultSet
rs2016 =
  { name = "2016"
  , results =
      [ { date = "Nov. 12 2016"
        , location = "District Meet (Gardner)"
        , locationLink = "http://www.mstca.org/Fall_Season/Course%20Maps/MSTCA%20Gardner%20course.pdf"
        , girlsPlace = "10th"
        , girlsPoints = "275"
        , girlsResults = "http://coolrunning.com/results/16/ma/Nov12_MIAACe_set3.shtml"
        , boysPlace = "24th"
        , boysPoints = "695"
        , boysResults = "http://coolrunning.com/results/16/ma/Nov12_MIAACe_set1.shtml"
        }
      , { date = "Nov. 2 2016"
        , location = "Hudson"
        , locationLink = ""
        , girlsPlace = "1st"
        , girlsPoints = "28"
        , girlsResults = "static/img/results/20161102 @ Hudson-Girls.jpg"
        , boysPlace = "2nd"
        , boysPoints = "42"
        , boysResults = "static/img/results/20161102 @ Hudson-Boys.jpg"
        }
      , { date = "Oct. 25 2016"
        , location = "Littleton"
        , locationLink = ""
        , girlsPlace = "1st"
        , girlsPoints = "28"
        , girlsResults = "static/img/results/20161025-Girls vs. Littleton @ Littleton.jpg"
        , boysPlace = "2nd"
        , boysPoints = "49"
        , boysResults = "static/img/results/20161025-Boys vs Littleton @ Littleton.jpg"
        }
      , { date = "Oct. 13 2016"
        , location = "Bromfield"
        , locationLink = ""
        , girlsPlace = "???"
        , girlsPoints = "???"
        , girlsResults = "static/img/results/20161013Bromfield&Murdock @ Bromfield-Girls.jpg"
        , boysPlace = "???"
        , boysPoints = "???"
        , boysResults = "static/img/results/20161013-Bromfield&Murdock @ Bromfield-Boys.jpg"
        }
      , { date = "Oct. 5 2016"
        , location = "Westford"
        , locationLink = ""
        , girlsPlace = "???"
        , girlsPoints = "???"
        , girlsResults = "static/img/results/20161005-Westford&AB @ Stonybrook-Girls.jpg"
        , boysPlace = "???"
        , boysPoints = "???"
        , boysResults = "static/img/results/20161005-Westford&AB @ Stonybrook-Boys.jpg"
        }
      , { date = "Sept. 29 2016"
        , location = "Naragansett"
        , locationLink = ""
        , girlsPlace = "???"
        , girlsPoints = "???"
        , girlsResults = "static/img/results/2016 Girls naragansett & bromfield @ naragansett.jpg"
        , boysPlace = "???"
        , boysPoints = "???"
        , boysResults = "static/img/results/2016 Boys naragansett & bromfield @ naragansett.jpeg"
        }
      , { date = "Sept. 22 2016"
        , location = "Clinton"
        , locationLink = ""
        , girlsPlace = "1st"
        , girlsPoints = "22"
        , girlsResults = "static/img/results/20160922Murdock-Clinton @ Murdock - Girls.jpg"
        , boysPlace = "2nd"
        , boysPoints = "43"
        , boysResults = "static/img/results/20160922 Murdock-Clinton @ Murdock - Boys.jpg"
        }
      , { date = "Sept. 9 2016"
        , location = "Maynard"
        , locationLink = ""
        , girlsPlace = "1st"
        , girlsPoints = "15"
        , girlsResults = "static/img/results/2016 Sizer Charter - Girls.tif"
        , boysPlace = "1st"
        , boysPoints = "24"
        , boysResults = "static/img/results/2016 Sizer Charter - Boys.tif"
        }
      ]
  }


results : List ResultSet
results =
  [ rs2017
  , rs2016
  ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( { }, Cmd.none )


view : Model -> Html Msg
view model =
  div [] (List.map viewResultSet results)

viewResultSet : ResultSet -> Html Msg
viewResultSet rs =
  div [ class "container" ]
    [ table [ class "table table-inverse" ]
      [ thead [] [ tr [] [ td [ rowspan 8 ] [ text rs.name ] ] ]
      , tbody [] (List.map viewResults rs.results)
      ]
    ]

viewResults : Results -> Html Msg
viewResults result =
  tr []
    [ td [] [ text result.date ]
    , td [] [ (viewLocation result.location result.locationLink) ]
    , td [] [ a [ href result.girlsResults ] [ text result.girlsPlace ] ]
    , td [] [ text result.girlsPoints ]
    , td [] [ a [ href result.boysResults ] [ text result.boysPlace ] ]
    , td [] [ text result.boysPoints ]
    ]

viewLocation location locationLink =
  case locationLink of
    "" -> text location
    _  -> a [ href locationLink ] [ text location ]
