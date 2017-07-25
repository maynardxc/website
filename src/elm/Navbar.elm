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


{ id, class, classList } =
    Html.CssHelpers.withNamespace "ebws"


view : State -> Route -> (String -> msg) -> (State -> msg) -> Html msg
view state currentRoute changeLocationMsgTagger navbarMsgTagger =
    div [ ]
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
                [ routeToItemLink changeLocationMsgTagger currentRoute HomeRoute Icon.home " Home"
                , routeToItemLink changeLocationMsgTagger currentRoute ResultsRoute Icon.trophy " Results"
                , routeToItemLink changeLocationMsgTagger currentRoute ScheduleRoute Icon.calendar " Schedule"
                , routeToItemLink changeLocationMsgTagger currentRoute CourseMapRoute Icon.map_marker " Course Map"
                -- , routeToItemLink changeLocationMsgTagger currentRoute PhotosRoute Icon.photo " Photos"
                -- , routeToItemLink changeLocationMsgTagger currentRoute PressRoute Icon.newspaper_o " Press"
                ]
            |> Navbar.view state
        ]


routeToItemLink : (String -> msg) -> Route -> Route -> Html msg -> String -> Navbar.Item msg
routeToItemLink changeLocationMsgTagger currentRoute linkedToRoute icon title =
    let
        path =
            encode linkedToRoute

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


routeToDropdownItem : (String -> msg) -> Route -> String -> Navbar.DropdownItem msg
routeToDropdownItem changeLocationMsgTagger linkedToRoute title =
    let
        path =
            encode linkedToRoute
    in
        Navbar.dropdownItem
            [ href path
            , attribute "data-navigate" path
            , catchNavigationClicks (changeLocationMsgTagger path)
            ]
            [ text title ]
