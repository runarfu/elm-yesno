module State exposing (update, getAnswerFromAPI)

import Http
import Json.Decode exposing (at, string)
import Types exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ResponseFromAPI (Ok s) ->
            ( Loaded (stringToAnswer s), Cmd.none )

        ResponseFromAPI (Err _) ->
            ( NotLoaded, Cmd.none )

        GetNewAnswer ->
            ( Loading, getAnswerFromAPI )


stringToAnswer : String -> Answer
stringToAnswer s =
    case s of
        "yes" ->
            Yes

        "no" ->
            No

        value ->
            Debug.crash ("'" ++ value ++ "' is not a valid value!")


getAnswerFromAPI : Cmd Msg
getAnswerFromAPI =
    let
        url =
            "https://yesno.wtf/api/"

        jsonDecoder =
            at [ "answer" ] string

        request =
            Http.get url jsonDecoder
    in
        Http.send ResponseFromAPI request
