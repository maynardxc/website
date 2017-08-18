module Router exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Navigation exposing (Location)
import Html exposing (Html, Attribute, a)
import Bootstrap.Grid as Grid
import Bootstrap.Navbar
import Pages.Home
import Pages.Results
import Pages.CourseMap
import Pages.CourseMap2016
import Pages.Photos
import Pages.Schedule
import Pages.Press
import Navbar
import RouteHelper exposing (..)

import Bootstrap.Card as Card

import Auth

type Msg
    = ChangeLocation String
    | OnLocationChange Location
    | NavbarMsg Bootstrap.Navbar.State
    | HomePageMsg Pages.Home.Msg
    | ResultsPageMsg Pages.Results.Msg
    | CourseMapPageMsg Pages.CourseMap.Msg
    | CourseMap2016PageMsg Pages.CourseMap2016.Msg
    | SchedulePageMsg Pages.Schedule.Msg
    | AuthMsg Auth.Msg


type alias Model =
    { route : Route
    , navbarState : Bootstrap.Navbar.State
    , homePageModel : Pages.Home.Model
    , resultsPageModel : Pages.Results.Model
    , courseMapPageModel : Pages.CourseMap.Model
    , courseMap2016PageModel : Pages.CourseMap2016.Model
    , schedulePageModel : Pages.Schedule.Model
    , authModel : Auth.Model
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
  let
    currentRoute = parseLocation location

    ( navbarState, navbarCmd ) =
      Bootstrap.Navbar.initialState NavbarMsg

    ( authModel, authCmd ) = Auth.init location

  in
    ( { route = currentRoute
      , navbarState = navbarState
      , homePageModel = Pages.Home.init
      , resultsPageModel = Pages.Results.init
      , courseMapPageModel = Pages.CourseMap.init
      , courseMap2016PageModel = Pages.CourseMap2016.init
      , schedulePageModel = Pages.Schedule.init
      , authModel = authModel
      }
    , Cmd.batch
      [ authCmd |> Cmd.map AuthMsg
      , navbarCmd
      ]
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLocation path ->
            ( model, Navigation.newUrl path )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        NavbarMsg state ->
            ( { model | navbarState = state }, Cmd.none )

        HomePageMsg homePageMsg ->
            updateHomePage homePageMsg model

        ResultsPageMsg resultsPageMsg ->
            updateResultsPage resultsPageMsg model

        CourseMapPageMsg courseMapPageMsg ->
            updateCourseMapPage courseMapPageMsg model

        CourseMap2016PageMsg courseMap2016PageMsg ->
            updateCourseMap2016Page courseMap2016PageMsg model

        SchedulePageMsg schedulePageMsg ->
            updateSchedulePage schedulePageMsg model

        AuthMsg authMsg ->
          updateSignInPage authMsg model

updateHomePage : Pages.Home.Msg -> Model -> ( Model, Cmd Msg )
updateHomePage msg model =
    let
        ( homePageModel, homePageCmd ) =
            Pages.Home.update msg model.homePageModel
    in
        ( { model | homePageModel = homePageModel }, homePageCmd |> Cmd.map HomePageMsg )

updateResultsPage : Pages.Results.Msg -> Model -> ( Model, Cmd Msg )
updateResultsPage msg model =
    let
        ( resultsPageModel, resultsPageCmd ) =
            Pages.Results.update msg model.resultsPageModel
    in
        ( { model | resultsPageModel = resultsPageModel }, resultsPageCmd |> Cmd.map ResultsPageMsg )

updateCourseMapPage : Pages.CourseMap.Msg -> Model -> ( Model, Cmd Msg )
updateCourseMapPage msg model =
    let
        ( courseMapPageModel, courseMapPageCmd ) =
            Pages.CourseMap.update msg model.courseMapPageModel
    in
        ( { model | courseMapPageModel = courseMapPageModel }, courseMapPageCmd |> Cmd.map CourseMapPageMsg )

updateCourseMap2016Page : Pages.CourseMap2016.Msg -> Model -> ( Model, Cmd Msg )
updateCourseMap2016Page msg model =
    let
        ( courseMap2016PageModel, courseMap2016PageCmd ) =
            Pages.CourseMap2016.update msg model.courseMap2016PageModel
    in
        ( { model | courseMap2016PageModel = courseMap2016PageModel }, courseMap2016PageCmd |> Cmd.map CourseMap2016PageMsg )

updateSignInPage : Auth.Msg -> Model -> ( Model, Cmd Msg )
updateSignInPage msg model =
  let
    ( authModel, signInPageCmd ) = Auth.update msg model.authModel
  in
    ( { model | authModel = authModel }, signInPageCmd |> Cmd.map AuthMsg )

updateSchedulePage : Pages.Schedule.Msg -> Model -> ( Model, Cmd Msg )
updateSchedulePage msg model =
    let
        ( schedulePageModel, schedulePageCmd ) =
            Pages.Schedule.update msg model.schedulePageModel
    in
        ( { model | schedulePageModel = schedulePageModel }, schedulePageCmd |> Cmd.map SchedulePageMsg )


view : Model -> Html Msg
view model =
    div []
        [ Navbar.view model.navbarState model.route ChangeLocation NavbarMsg model.authModel
        , page model
        ]


page : Model -> Html Msg
page model =
    Grid.containerFluid []
        [ case model.route of
            HomeRoute ->
                Html.map HomePageMsg (Pages.Home.view model.homePageModel)

            ResultsRoute ->
                Html.map ResultsPageMsg (Pages.Results.view model.resultsPageModel)

            CourseMapRoute ->
                Html.map CourseMapPageMsg (Pages.CourseMap.view model.courseMapPageModel)

            CourseMap2016Route ->
                Html.map CourseMap2016PageMsg (Pages.CourseMap2016.view model.courseMap2016PageModel)

            SignInRoute ->
                Html.map AuthMsg (Auth.view model.authModel)

            ScheduleRoute ->
                Html.map SchedulePageMsg (Pages.Schedule.view model.schedulePageModel model.authModel)

            NotFoundRoute ->
                  div [ class "container text-center" ]
                    [ Card.config [ Card.info, Card.attrs [] ]
                      |> Card.block []
                        [ Card.text []
                          [img
                            [ src "static/img/not_found_tiger.png"
                            , alt "NOT FOUND"
                            , style [("max-width", "100%"), ("max-height", "100%")]
                            ] []
                          ]
                        ]
                      |> Card.view
                    ]
        ]
