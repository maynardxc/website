module Pages.CourseMap exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Css
import Html.CssHelpers
import MainCss
import Components.Hello exposing (hello)


type Msg
    = Increment


type alias Model =
    { count : Int
    }


{ id, class, classList } =
    Html.CssHelpers.withNamespace "ebws"


init : Model
init =
    { count = 0
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( { count = model.count + 1 }, Cmd.none )


view : Model -> Html Msg
view model =
  div [ class [ "jumbotron" ] ]
    [
      img [ src "static/img/coursemap_2016.jpg" ] []
    ]
