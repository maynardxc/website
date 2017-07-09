module Router exposing (..)

import Html exposing (..)
import Navigation exposing (Location)
import Html exposing (Html, Attribute, a)
import Bootstrap.Grid as Grid
import Bootstrap.Navbar
import Pages.Home
import Pages.Results
import Pages.CourseMap
import Pages.Photos
import Pages.Schedule
import Pages.About
import Navbar
import RouteHelper exposing (..)


type Msg
    = ChangeLocation String
    | OnLocationChange Location
    | NavbarMsg Bootstrap.Navbar.State
    | HomePageMsg Pages.Home.Msg
    | ResultsPageMsg Pages.Results.Msg
    | CourseMapPageMsg Pages.CourseMap.Msg
    | PhotosPageMsg Pages.Photos.Msg
    | SchedulePageMsg Pages.Schedule.Msg
    | AboutPageMsg Pages.About.Msg


type alias Model =
    { route : Route
    , navbarState : Bootstrap.Navbar.State
    , homePageModel : Pages.Home.Model
    , resultsPageModel : Pages.Results.Model
    , courseMapPageModel : Pages.CourseMap.Model
    , photosPageModel : Pages.Photos.Model
    , schedulePageModel : Pages.Schedule.Model
    , aboutPageModel : Pages.About.Model
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location

        ( navbarState, navbarCmd ) =
            Bootstrap.Navbar.initialState NavbarMsg
    in
        ( { route = currentRoute
          , navbarState = navbarState
          , homePageModel = Pages.Home.init
          , resultsPageModel = Pages.Results.init
          , courseMapPageModel = Pages.CourseMap.init
          , photosPageModel = Pages.Photos.init
          , schedulePageModel = Pages.Schedule.init
          , aboutPageModel = Pages.About.init
          }
        , navbarCmd
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

        PhotosPageMsg photosPageMsg ->
            updatePhotosPage photosPageMsg model

        SchedulePageMsg schedulePageMsg ->
            updateSchedulePage schedulePageMsg model

        AboutPageMsg aboutPageMsg ->
            updateAboutPage aboutPageMsg model


updateHomePage : Pages.Home.Msg -> Model -> ( Model, Cmd Msg )
updateHomePage msg model =
    let
        ( homePageModel, homePageCmd ) =
            Pages.Home.update msg model.homePageModel
    in
        ( { model | homePageModel = homePageModel }, homePageCmd |> Cmd.map HomePageMsg )

updateAboutPage : Pages.About.Msg -> Model -> ( Model, Cmd Msg )
updateAboutPage msg model =
    let
        ( aboutPageModel, aboutPageCmd ) =
            Pages.About.update msg model.aboutPageModel
    in
        ( { model | aboutPageModel = aboutPageModel }, aboutPageCmd |> Cmd.map AboutPageMsg )

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

updatePhotosPage : Pages.Photos.Msg -> Model -> ( Model, Cmd Msg )
updatePhotosPage msg model =
    let
        ( photosPageModel, photosPageCmd ) =
            Pages.Photos.update msg model.photosPageModel
    in
        ( { model | photosPageModel = photosPageModel }, photosPageCmd |> Cmd.map PhotosPageMsg )

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
        [ Navbar.view model.navbarState model.route ChangeLocation NavbarMsg
        , page model
        ]


page : Model -> Html Msg
page model =
    Grid.container []
        [ case model.route of
            HomeRoute ->
                Html.map HomePageMsg (Pages.Home.view model.homePageModel)

            ResultsRoute ->
                Html.map ResultsPageMsg (Pages.Results.view model.resultsPageModel)

            CourseMapRoute ->
                Html.map CourseMapPageMsg (Pages.CourseMap.view model.courseMapPageModel)

            PhotosRoute ->
                Html.map PhotosPageMsg (Pages.Photos.view model.photosPageModel)

            ScheduleRoute ->
                Html.map SchedulePageMsg (Pages.Schedule.view model.schedulePageModel)

            AboutRoute ->
                Html.map AboutPageMsg (Pages.About.view model.aboutPageModel)

            NotFoundRoute ->
                text "Not Found"
        ]
