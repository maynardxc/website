module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

-- component import example
import Components.Hello exposing ( hello )


-- APP
main : Program Never Int Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model = Int

model : number
model = 0


-- UPDATE
type Msg = NoOp | Increment

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    Increment -> model + 1


-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div [ class "container-fluid", style [("margin-top", "30px"), ( "text-align", "center" )] ][    -- inline CSS (literal)
    div [ class "row" ][
      div [ class "col-xs-12" ][
        div [ class "jumbotron" ]
          [ img [ src "static/img/2016_team.jpg", style styles.img ] []                             -- inline CSS (via var)
          , hello model                                                                     -- ext 'hello' component (takes 'model' as arg)
          ]
        ]
      ]
    ]
  


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "80%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
