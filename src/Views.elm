module Views exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


view : Model -> Html Msg
view model =
    case model of
        NotLoaded ->
            p [] [ text "Not loaded" ]

        Loading ->
            p [] [ text "Loading…" ]

        Loaded answer ->
            viewImage answer


viewImage : Answer -> Html Msg
viewImage answer =
    let
        filename =
            case answer of
                Yes ->
                    "yes.png"

                No ->
                    "no.png"
    in
        img
            [ onClick GetNewAnswer
            , title "Click to get a new answer"
            , src filename
            ]
            []
