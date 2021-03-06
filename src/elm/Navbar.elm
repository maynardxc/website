module Navbar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.CssHelpers
import Bootstrap.Button as Button
import Bootstrap.Form.Input as Input
import Bootstrap.Navbar as Navbar exposing (State)
import FontAwesome.Web as Icon
import MainCss
import RouteHelper exposing (..)

import Auth

{ id, class, classList } =
    Html.CssHelpers.withNamespace "ebws"


view : State -> Route -> (String -> msg) -> (State -> msg) -> Auth.Model -> Html msg
view state currentRoute changeLocationMsgTagger navbarMsgTagger authModel =
  let
    authItems = case Auth.isAuthorized authModel.calendar of
      False ->
        []
      True ->
        -- , routeToItemLink changeLocationMsgTagger currentRoute ForumRoute Icon.group " Forum"
        [ Navbar.itemLink
          [ href "https://groups.google.com/forum/#!forum/maynardxc" ]
          [ Icon.group
          , text " Forum"
          ]
        ]
  in
    div []
      [ Navbar.config navbarMsgTagger
        |> Navbar.withAnimation
        |> Navbar.collapseMedium
        |> Navbar.fixTop
        |> Navbar.brand
          [ href "/" ]
            [ img
              [ src "static/img/tiger_blink.gif"
              , class [ MainCss.BrandLogo ]
              ]
              []
            , text " Maynard Cross Country"
            ]
        |> Navbar.items
          ([ routeToItemLink changeLocationMsgTagger currentRoute HomeRoute Icon.home " Home"
          , routeToItemLink changeLocationMsgTagger currentRoute ResultsRoute Icon.trophy " Results"
          , routeToItemLink changeLocationMsgTagger currentRoute ScheduleRoute Icon.calendar " Schedule"
          , routeToItemLink changeLocationMsgTagger currentRoute CourseMapRoute Icon.map_marker " Course Map"
          , authItem changeLocationMsgTagger currentRoute authModel
          ] ++ authItems)
        |> Navbar.view state
      ]


authItem : (String -> msg) -> Route -> Auth.Model -> Navbar.Item msg
authItem changeLocationMsgTagger currentRoute authModel =
  case ( authModel.token, authModel.profile, authModel.calendar ) of
    ( Nothing, Nothing, _ ) ->
      routeToItemLink changeLocationMsgTagger currentRoute SignInRoute Icon.user " Sign In"

    ( Just token, Nothing, _ ) ->
      routeToItemLink changeLocationMsgTagger currentRoute SignInRoute Icon.spinner " checking you out..."

    ( _, Just profile, Nothing ) ->
      routeToItemLink changeLocationMsgTagger currentRoute SignInRoute Icon.spinner " validating..."

    ( _, Just profile, Just calendar ) ->
      let
        contents = case calendar.authorized of
          False ->
            [ Icon.ban
            , text " "
            , img
              [ src profile.picture
              , style
                [ ( "height", "25px" )
                , ( "width", "25px" )
                ]
              ]
              []
            ]
          True ->
            [ Icon.check_square
            , text " "
            , img
              [ src profile.picture
              , style
                [ ( "height", "25px" )
                , ( "width", "25px" )
                ]
              ]
              []
            ]
      in
        Navbar.itemLink
          [ href (encode SignInRoute)
          , attribute "data-navigate" (encode SignInRoute)
          , catchNavigationClicks (changeLocationMsgTagger (encode SignInRoute))
          ]
          contents



routeToItemLink : (String -> msg) -> Route -> Route -> Html msg -> String -> Navbar.Item msg
routeToItemLink changeLocationMsgTagger currentRoute linkedToRoute icon title =
  let
    path = encode linkedToRoute
    itemLink =
      if currentRoute == linkedToRoute then
        Navbar.itemLinkActive
      else
        Navbar.itemLink
  in
    itemLink
      [ href path
      , attribute "data-navigate" path
      , catchNavigationClicks (changeLocationMsgTagger path)
      ]
      [ icon, text title ]
