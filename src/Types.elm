module Types exposing (..)

import Http


type Model
    = NotLoaded
    | Loading
    | Loaded Answer


type Answer
    = Yes
    | No


type Msg
    = ResponseFromAPI (Result Http.Error String)
    | GetNewAnswer
