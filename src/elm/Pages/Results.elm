module Pages.Results exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Css
import Html.CssHelpers
import MainCss
import List exposing (..)

import Auth

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
  , girlsResults : List String
  , boysPlace : String
  , boysPoints : String
  , boysResults : List String
  }

type alias ResultSet =
  { name : String
  , results : List Results
  }

rs2017 : ResultSet
rs2017 =
  { name = "2017"
  , results =
    [ { date = "Sept. 21 2017"
      , location = "Tahanto"
      , locationLink = ""
      , girlsPlace = "1st"
      , girlsPoints = "?, ?"
      , girlsResults = [ "static/img/results/2017/20170921GIRLS-Tahanto.jpg" ]
      , boysPlace = "2nd"
      , boysPoints = "?, ?"
      , boysResults =
        [ "static/img/results/2017/20170921BOYS-Tahanto.1.jpg"
        , "static/img/results/2017/20170921BOYS-Tahanto.2.jpg"
        ]
      }
    , { date = "Sept. 18 2017"
      , location = "Sizer"
      , locationLink = ""
      , girlsPlace = "1st"
      , girlsPoints = "?, ?"
      , girlsResults = [ "static/img/results/2017/20170918GIRLS-Sizer.jpg" ]
      , boysPlace = "2nd"
      , boysPoints = "?, ?"
      , boysResults = [ "static/img/results/2017/20170918BOYS-Sizer.jpg" ]
      }
    , { date = "Sept. 14 2017"
      , location = "Quabbin (+Bromfield)"
      , locationLink = ""
      , girlsPlace = "1st, 1st"
      , girlsPoints = "?, ?"
      , girlsResults = [ "static/img/results/2017/20170916GIRLS-Bromfield-Quabbin.jpg" ]
      , boysPlace = "2nd, 2nd"
      , boysPoints = "?, ?"
      , boysResults = [ "static/img/results/2017/20170916BOYS-Bromfield-Quabbin.jpg" ]
      }
    , { date = "Sept. 7 2017"
      , location = "Maynard"
      , locationLink = "/#/coursemap"
      , girlsPlace = "2nd"
      , girlsPoints = "36"
      , girlsResults = [ "static/img/results/2017/20170907GIRLS-Littleton.pdf" ]
      , boysPlace = "2nd"
      , boysPoints = "30"
      , boysResults = [ "static/img/results/2017/20170907BOYS-Littleton.pdf" ]
      }

    ]
  }

rs2016 : ResultSet
rs2016 =
  { name = "2016 Results"
  , results =
      [ { date = "Nov. 12 2016"
        , location = "District Meet (Gardner)"
        , locationLink = "http://www.mstca.org/Fall_Season/Course%20Maps/MSTCA%20Gardner%20course.pdf"
        , girlsPlace = "10th"
        , girlsPoints = "275"
        , girlsResults = [ "http://coolrunning.com/results/16/ma/Nov12_MIAACe_set3.shtml" ]
        , boysPlace = "24th"
        , boysPoints = "695"
        , boysResults = [ "http://coolrunning.com/results/16/ma/Nov12_MIAACe_set1.shtml" ]
        }
      , { date = "Nov. 2 2016"
        , location = "Hudson"
        , locationLink = ""
        , girlsPlace = "1st"
        , girlsPoints = "28"
        , girlsResults = [ "static/img/results/20161102 @ Hudson-Girls.jpg" ]
        , boysPlace = "2nd"
        , boysPoints = "42"
        , boysResults = [ "static/img/results/20161102 @ Hudson-Boys.jpg" ]
        }
      , { date = "Oct. 25 2016"
        , location = "Littleton"
        , locationLink = ""
        , girlsPlace = "1st"
        , girlsPoints = "28"
        , girlsResults = [ "static/img/results/20161025-Girls vs. Littleton @ Littleton.jpg" ]
        , boysPlace = "2nd"
        , boysPoints = "49"
        , boysResults = [ "static/img/results/20161025-Boys vs Littleton @ Littleton.jpg" ]
        }
      , { date = "Oct. 13 2016"
        , location = "Bromfield (+Murdock)"
        , locationLink = ""
        , girlsPlace = "2nd, 1st"
        , girlsPoints = "???"
        , girlsResults = [ "static/img/results/20161013Bromfield&Murdock @ Bromfield-Girls.jpg" ]
        , boysPlace = "2nd, 2nd"
        , boysPoints = "???"
        , boysResults = [ "static/img/results/20161013-Bromfield&Murdock @ Bromfield-Boys.jpg" ]
        }
      , { date = "Oct. 5 2016"
        , location = "Westford (+Acton-Boxboro)"
        , locationLink = ""
        , girlsPlace = "2nd, 2nd"
        , girlsPoints = "???"
        , girlsResults = [ "static/img/results/20161005-Westford&AB @ Stonybrook-Girls.jpg" ]
        , boysPlace = "2nd, 2nd"
        , boysPoints = "???"
        , boysResults = [ "static/img/results/20161005-Westford&AB @ Stonybrook-Boys.jpg" ]
        }
      , { date = "Sept. 29 2016"
        , location = "Naragansett (+Bromfield)"
        , locationLink = ""
        , girlsPlace = "2nd, 2nd"
        , girlsPoints = "???"
        , girlsResults = [ "static/img/results/2016 Girls naragansett & bromfield @ naragansett.jpg" ]
        , boysPlace = "2nd, 2nd"
        , boysPoints = "???"
        , boysResults = [ "static/img/results/2016 Boys naragansett & bromfield @ naragansett.jpeg" ]
        }
      , { date = "Sept. 22 2016"
        , location = "Clinton"
        , locationLink = ""
        , girlsPlace = "1st"
        , girlsPoints = "22"
        , girlsResults = [ "static/img/results/20160922Murdock-Clinton @ Murdock - Girls.jpg" ]
        , boysPlace = "2nd"
        , boysPoints = "43"
        , boysResults = [ "static/img/results/20160922 Murdock-Clinton @ Murdock - Boys.jpg" ]
        }
      , { date = "Sept. 9 2016"
        , location = "Maynard"
        , locationLink = ""
        , girlsPlace = "1st"
        , girlsPoints = "15"
        , girlsResults = [ "static/img/results/2016 Sizer Charter - Girls.tif" ]
        , boysPlace = "1st"
        , boysPoints = "24"
        , boysResults = [ "static/img/results/2016 Sizer Charter - Boys.tif" ]
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


view : Model -> Auth.Model -> Html Msg
view model authModel =
  let
    isAuthorized = Auth.isAuthorized authModel.calendar
  in
    div [] (List.map (viewResultSet isAuthorized) results)
          --  (List.map (elementView address) model.gifList)


viewResultSet : Bool -> ResultSet -> Html Msg
viewResultSet isAuthorized rs =
  div [ class "container" ]
    [ table [ class "table table-hover" ]
      [ thead []
        [ tr []
          [ th [] [ h3 [] [ text rs.name ] ]
          , th [] [ text "" ]
          , th [] [ text "" ]
          , th [] [ text "" ]
          ]
        , tr []
          [ th [] [ text "Date" ]
          , th [] [ text "Meet Location" ]
          , th [] [ text "Girls" ]
          , th [] [ text "Boys" ]
          ]
        ]
      , tbody [] (List.map (viewResults isAuthorized) rs.results)
      ]
    ]

viewResults : Bool -> Results -> Html Msg
viewResults isAuthorized result =
  tr []
    [ td [] [ text result.date ]
    , td [] [ (viewLocation result.location result.locationLink) ]
    , td [] (resultsValue result.girlsResults result.girlsPlace isAuthorized)
    , td [] (resultsValue result.boysResults result.boysPlace isAuthorized)
    ]

resultsValue : List String -> String -> Bool -> List (Html Msg)
resultsValue ll r isAuthorized =
  case isAuthorized of
    True ->
      List.indexedMap (listResults r) ll
      -- [ a [ href ll ] [ text r ] ]
    False -> [ text r ]

listResults : String -> Int -> String -> Html Msg
listResults firstText index theLink =
  case index of
    0 ->
      a [ href theLink ] [ text firstText ]
    _ ->
      a [ href theLink ] [ text (" (page " ++ toString (index + 1) ++ ")") ]


viewLocation location locationLink =
  case locationLink of
    "" -> text location
    _  -> a [ href locationLink ] [ text location ]
