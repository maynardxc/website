module Pages.Home exposing (..)

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
    div [ class [ MainCss.Jumbotron ] ]
        [ blockquote []
          [ h3 []
            [ text("Cross country is...free running on open-air courses, over dirt "
                ++ "and grass and bridges. It is challenging and exhilarating, "
                ++ "both easy and hard. Cross country is teamwork and individual "
                ++ "accomplishments rolled into one. It is getting lost and finding "
                ++ "your way. Cross country is friends bound by sweat, tears, and cheers.")
            ]
          , footer [] [ text "Coach Karen" ]
          ]
        -- , hello model.count
        -- , p [] [ text ("Elm Bootstrap Webpack Starter") ]
        -- , Button.button
        --     [ Button.primary
        --     , Button.large
        --     , Button.attrs [ onClick Increment ]
        --     ]
        --     [ span [] []
        --     , span [] [ text "FTW!" ]
        --     ]
        ]
