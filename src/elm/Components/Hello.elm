module Components.Hello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

-- hello component
hello : Int -> Html a
hello model =
  div
    [ class "h3" ]
    [ text ( "The 2016 Maynard XC team" ++ ( "!" |> String.repeat model ) ) ]
