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
import Pages.Press
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
    | PressPageMsg Pages.Press.Msg


type alias Model =
    { route : Route
    , navbarState : Bootstrap.Navbar.State
    , homePageModel : Pages.Home.Model
    , resultsPageModel : Pages.Results.Model
    , courseMapPageModel : Pages.CourseMap.Model
    , photosPageModel : Pages.Photos.Model
    , schedulePageModel : Pages.Schedule.Model
    , pressPageModel : Pages.Press.Model
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
          , pressPageModel = Pages.Press.init
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

        PressPageMsg pressPageMsg ->
            updatePressPage pressPageMsg model


updateHomePage : Pages.Home.Msg -> Model -> ( Model, Cmd Msg )
updateHomePage msg model =
    let
        ( homePageModel, homePageCmd ) =
            Pages.Home.update msg model.homePageModel
    in
        ( { model | homePageModel = homePageModel }, homePageCmd |> Cmd.map HomePageMsg )

updatePressPage : Pages.Press.Msg -> Model -> ( Model, Cmd Msg )
updatePressPage msg model =
    let
        ( pressPageModel, pressPageCmd ) =
            Pages.Press.update msg model.pressPageModel
    in
        ( { model | pressPageModel = pressPageModel }, pressPageCmd |> Cmd.map PressPageMsg )

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

            PressRoute ->
                Html.map PressPageMsg (Pages.Press.view model.pressPageModel)

            NotFoundRoute ->
                text "Not Found"
        ]
