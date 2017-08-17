module Auth exposing (..)

-- https://github.com/truqu/elm-oauth2/blob/master/examples/

import Navigation exposing (Location)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Json
import OAuth
import OAuth.Implicit

-- Endpoints to interact with Google OAuth

authorizationEndpoint : String
authorizationEndpoint =
    "https://accounts.google.com/o/oauth2/v2/auth"


profileEndpoint : String
profileEndpoint =
    "https://www.googleapis.com/oauth2/v1/userinfo"


type Msg
    = Nop
    | Authorize
    | UpdateClientId String
    | GetProfile (Result Http.Error Profile)

type alias Model =
  { oauth :
    { clientId : String
    , redirectUri : String
    }
  , error : Maybe String
  , token : Maybe OAuth.Token
  , profile : Maybe Profile
  }

type alias Profile =
  { email : String
  , name : String
  , picture : String
  }

profileDecoder : Json.Decoder Profile
profileDecoder =
  Json.map3 Profile
    (Json.field "email" Json.string)
    (Json.field "name" Json.string)
    (Json.field "picture" Json.string)


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
  let
    model =
      { oauth =
        { clientId = "824966227423-mlh6seq9pvshpmh34o60mf90tfgiv09g.apps.googleusercontent.com"
        , redirectUri = location.origin ++ location.pathname
        }
      , error = Nothing
      , token = Nothing
      , profile = Nothing
      }
  in
    case OAuth.Implicit.parse location of
      Ok { token } ->
        let
          req =
            Http.request
              { method = "GET"
              , body = Http.emptyBody
              , headers = OAuth.use token []
              , withCredentials = False
              , url = profileEndpoint
              , expect = Http.expectJson profileDecoder
              , timeout = Nothing
              }
        in
          ( { model | token = Just token }
          , Cmd.batch
            [ Navigation.modifyUrl model.oauth.redirectUri
            , Http.send GetProfile req
            ]
          )

      Err OAuth.Empty ->
        ( model, Cmd.batch [] )

      Err (OAuth.OAuthErr err) ->
        ( { model | error = Just <| OAuth.showErrCode err.error }
        , Cmd.batch
          [ Navigation.modifyUrl model.oauth.redirectUri
          ]
        )

      Err _ ->
        ( { model | error = Just "parsing error" }, Cmd.batch [] )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ oauth } as model) =
    case msg of
      Nop ->
        model ! []

      UpdateClientId clientId ->
        let
          oauth_ =
            { oauth | clientId = clientId }
        in
          { model | oauth = oauth_ } ! []

      GetProfile res ->
        case res of
          Err err ->
            { model | error = Just "unable to fetch user profile ¯\\_(ツ)_/¯" } ! []

          Ok profile ->
            { model | profile = Just profile } ! []

      Authorize ->
        model
          ! [ OAuth.Implicit.authorize
              { clientId = model.oauth.clientId
              , redirectUri = model.oauth.redirectUri
              , responseType = OAuth.Token
              , scope = [ "email", "profile" ]
              , state = Nothing
              , url = authorizationEndpoint
              }
            ]


view : Model -> Html Msg
view model =
  case ( model.token, model.profile ) of
    ( Nothing, Nothing ) ->
      div [] [ button [ onClick Authorize ] [ text "Sign in" ] ]

    ( Just token, Nothing ) ->
      div [] [ text "fetching profile..." ]

    ( _, Just profile ) ->
      div []
        [ img
          [ src profile.picture
            , style
              [ ( "height", "50px" )
              , ( "margin", "1em" )
              , ( "width", "50px" )
              ]
            ]
            []
        -- , text <| profile.name ++ " <" ++ profile.email ++ ">"
        ]