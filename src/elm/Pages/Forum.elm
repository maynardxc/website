module Pages.Forum exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Css
import Html.CssHelpers
import MainCss
import FontAwesome.Web as Icon
import Bootstrap.Card as Card

import Auth

type Msg = None

type alias Model =
  {
  }


init : Model
init = { }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Auth.Model -> Html Msg
view model authModel =
  case (Auth.isAuthorized authModel.calendar) of
    False ->
      viewUnprivileged model

    True ->
      viewPrivileged model

-- embed forum failling with same origin
viewPrivileged : Model -> Html Msg
viewPrivileged model =
  div [ class "container text-center" ]
    [ Card.config [ Card.info, Card.attrs [] ]
      |> Card.block []
        [ Card.text []
          [ iframe
            [ id "forum_embed"
            , src "javascript:void(0)"
            , style
              [ ("scrolling", "no")
              , ("frameborder", "0")
              , ("width", "100%")
              , ("height", "600px")
              ]
            ]
            []
          , scriptOmatic [ style [("type","text/javascript")] ]
              """
                document.getElementById('forum_embed').src =
                   'https://groups.google.com/forum/embed/?place=forum/maynardxc'
                   + '&showsearch=true&showpopout=true&showtabs=false'
                   + '&parenturl=' + encodeURIComponent(window.location.href);
              """
          , small []
            [ a
              [ href "https://groups.google.com/forum/#!forum/maynardxc" ]
              [ text "Visit the MaynardXC forum on Google" ]
            ]
          ]
        ]
      |> Card.view
    ]

scriptOmatic attrs s = node "script" attrs [ text s ]

viewUnprivileged : Model -> Html Msg
viewUnprivileged model =
  div [ class "container text-center" ]
    [ Card.config [ Card.info, Card.attrs [] ]
      |> Card.block []
        [ Card.text []
          [ img
            [ src "static/img/unauthorized.gif"
            , alt "UNAUTHORIZED"
            , style
              [ ("width","100%")
              , ("height","100%")
              , ("frameBorder","0")
              ]
            ]
            []
          , small [] [ text "Contact Coach Karen for access to the team forum." ]
          ]
        ]
      |> Card.view
    ]
