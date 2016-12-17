module Main exposing (..)

import Html
import Types exposing (..)
import Views exposing (..)
import State exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = ( NotLoaded, getAnswerFromAPI )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
