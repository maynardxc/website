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

import Bootstrap.Card as Card
import Bootstrap.Navbar as Navbar exposing (State)

import Debug exposing (log)

-- Endpoints to interact with Google OAuth

authorizationEndpoint : String
authorizationEndpoint =
    "https://accounts.google.com/o/oauth2/v2/auth"


profileEndpoint : String
profileEndpoint =
    "https://www.googleapis.com/oauth2/v1/userinfo"

calendarEndpoint : String
calendarEndpoint =
  "https://www.googleapis.com/calendar/v3/calendars/4sl4aopkrgcftcs6qg90fa06lc@group.calendar.google.com"
  -- "https://www.googleapis.com/auth/calendar.readonly"
  -- "https://www.googleapis.com/auth/calendar"

type Msg
    = Nop
    | Authorize
    | SignOut
    | UpdateClientId String
    | GetProfile (Result Http.Error Profile)
    | GetCalendar (Result Http.Error CalendarData)

type alias Model =
  { oauth :
    { clientId : String
    , redirectUri : String
    }
  , error : Maybe String
  , token : Maybe OAuth.Token
  , profile : Maybe Profile
  , calendar : Maybe Calendar
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

type alias Calendar =
  { authorized : Bool
  , calendarData : Maybe CalendarData
  }

type alias CalendarData =
  { kind : String
  , etag : String
  , id : String
  , summary : String
  , description : String
  , timeZone : String
  }

calendarDecoder : Json.Decoder CalendarData
calendarDecoder =
  Json.map6 CalendarData
    (Json.field "kind" Json.string)
    (Json.field "etag" Json.string)
    (Json.field "id" Json.string)
    (Json.field "summary" Json.string)
    (Json.field "description" Json.string)
    (Json.field "timeZone" Json.string)


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
      , calendar = Nothing
      }
  in
    case OAuth.Implicit.parse location of
      Ok { token } ->
        let
          theToken = OAuth.use token []
          profileReq =
            Http.request
              { method = "GET"
              , body = Http.emptyBody
              , headers = theToken
              , withCredentials = False
              , url = profileEndpoint
              , expect = Http.expectJson profileDecoder
              , timeout = Nothing
              }
          calendarReq =
            Http.request
              { method = "GET"
              , body = Http.emptyBody
              , headers = theToken ++ [ Http.header "foo" "bar" ]
              , withCredentials = False
              , url = calendarEndpoint
              , expect = Http.expectJson calendarDecoder
              , timeout = Nothing
              }
        in
          ( { model | token = Just token }
          , Cmd.batch
            [ Navigation.modifyUrl model.oauth.redirectUri
            , Http.send GetProfile profileReq
            , Http.send GetCalendar calendarReq
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
        ( { model | error = Just "parsing error while authenticating to Google" }, Cmd.batch [] )


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

      GetCalendar res ->
        let
          calendar = case res of
            Ok calendarData ->
              { authorized = True
              , calendarData = Just calendarData
              }
            Err err ->
              { authorized = False
              , calendarData = Nothing
              }
        in
          case res of
            Ok calendarData ->
              { model
                | calendar = Just
                  { authorized = True
                  , calendarData = Just calendarData
                  }
              , error = Nothing
              } ! []
            Err err ->
              { model
                | calendar = Just
                  { authorized = False
                  , calendarData = Nothing
                  }
              , error = Just "Failed to validate access to the team calendar!"
              } ! []

      Authorize ->
        model
          ! [ OAuth.Implicit.authorize
              { clientId = model.oauth.clientId
              , redirectUri = model.oauth.redirectUri
              , responseType = OAuth.Token
              , scope = [ "email", "profile", "https://www.googleapis.com/auth/calendar.readonly" ]
              , state = Nothing
              , url = authorizationEndpoint
              }
            ]

      SignOut ->
        { model
          | error = Nothing
          , token = Nothing
          , profile = Nothing
          , calendar = Nothing
        } ! []

view : Model -> Html Msg
view model =
  let
    content = case ( model.token, model.profile, model.calendar ) of
      ( Nothing, Nothing, _ ) ->
        div []
          [ p []
            [ text
              ( "If you are a member (or parent) of the cross country team log in "
              ++ "using your Google account to see photos and the team calendar."
              )
            ]
          , button [ onClick Authorize ] [ text "Sign in" ]
          ]

      ( Just token, Nothing, _ ) ->
        div [] [ text "...emboldening HTML5 technologies..." ]

      ( _, Just profile, Nothing ) ->
        div [] [ text "...leaveraging corporate synergies..." ]

      ( _, Just profile, Just calendar ) ->
        case calendar.authorized of
          False ->
            div []
              [ viewProfilePhoto profile
              , p []
                [ text
                  ( "Hey " ++ profile.name ++ "! "
                  ++ "You do not seem to be allowed to access the team content."
                  )
                ]
              , p []
                [ text
                  ( "If you would like to access team content, please ask Coach Karen"
                  ++ " to add you to the team calendar."
                  )
                ]
              , viewSignOut
              ]

          True ->
            div []
              [ viewProfilePhoto profile
              , p [] [ text ( "Hi " ++ profile.name ++ "! " ) ]
              , viewSignOut
              ]

  in
    viewLogin model content

viewLogin : Model -> Html Msg -> Html Msg
viewLogin model content =
  div [ class "container text-center" ]
    [ Card.config [ Card.info, Card.attrs [] ]
      |> Card.block []
        [ Card.titleH3 [] [ text "Access Team Content" ]
        , Card.text [] [ content ]
        ]
      |> Card.footer [] []
      |> Card.view
    ]

viewProfilePhoto : Profile -> Html Msg
viewProfilePhoto profile =
  img
    [ src profile.picture
    , alt profile.email
    , style
      [ ( "height", "250px" )
      , ( "margin", "1em" )
      , ( "width", "250px" )
      ]
    ]
    []

viewSignOut : Html Msg
viewSignOut =
  button [ onClick SignOut ] [ text "Sign Out" ]

isAuthorized : Maybe Calendar -> Bool
isAuthorized calendar =
  case calendar of
    Just calendar ->
      calendar.authorized

    Nothing ->
      False
