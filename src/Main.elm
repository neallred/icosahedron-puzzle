module Main exposing
    ( Choice
    , Color(..)
    , Edge(..)
    , EdgeColor(..)
    , EdgeVertex(..)
    , Face(..)
    , Model
    , Msg(..)
    , Vertex(..)
    , VertexPair
    , baseGuesses
    , colorsToOrder
    , init
    , main
    , remainingBlue
    , remainingGreen
    , remainingOrange
    , remainingPink
    , remainingYellow
    , update
    , view
    )

import Browser
import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Random



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { randoms : List Float
    , choices : List EdgeColor
    }



-- order matters a LOT


init : () -> ( Model, Cmd Msg )
init _ =
    ( { randoms = [], choices = [] }, newGuesses )



-- UPDATE


type Msg
    = GetNextRandoms (List Float)
    | NoOp


fractions : Random.Generator (List Float)
fractions =
    Random.list (List.length baseGuesses) (Random.float 0 1)


newGuesses : Cmd Msg
newGuesses =
    Random.generate GetNextRandoms fractions


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetNextRandoms randoms ->
            let
                trumm =
                    Debug.log "got randoms" (Debug.toString randoms)
            in
            ( { model | randoms = randoms }, Cmd.none )

        -- in GetNextRandoms branch, have some condition to create a guess solution, check it
        -- and conditionally ask to guess again via newGuesses if the solution was not a success.
        NoOp ->
            ( model, Cmd.none )


pickRandomColor : Float -> List Color -> Color
pickRandomColor randomFloat colors =
    let
        trumm =
            ""
    in
    case List.head colors of
        Just c ->
            c

        Nothing ->
            P



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "" ]
        ]



-- TYPES


type Color
    = P
    | G
    | B
    | O
    | Y


type Face
    = F_01
    | F_02
    | F_03
    | F_04
    | F_05
    | F_06
    | F_07
    | F_08
    | F_09
    | F_10
    | F_11
    | F_12
    | F_13
    | F_14
    | F_15
    | F_16
    | F_17
    | F_18
    | F_19
    | F_20


type Vertex
    = V_01
    | V_02
    | V_03
    | V_04
    | V_05
    | V_06
    | V_07
    | V_08
    | V_09
    | V_10
    | V_11
    | V_12


type Edge
    = E_01
    | E_02
    | E_03
    | E_04
    | E_05
    | E_06
    | E_07
    | E_08
    | E_09
    | E_10
    | E_11
    | E_12
    | E_13
    | E_14
    | E_15
    | E_16
    | E_17
    | E_18
    | E_19
    | E_20
    | E_21
    | E_22
    | E_23
    | E_24
    | E_25
    | E_26
    | E_27
    | E_28
    | E_29
    | E_30


type alias Choice =
    ( Vertex, Vertex, Color )


type alias VertexPair =
    ( Vertex, Vertex )


type EdgeColor
    = EC_01 Vertex Vertex Color
    | EC_02 Vertex Vertex Color
    | EC_03 Vertex Vertex Color
    | EC_04 Vertex Vertex Color
    | EC_05 Vertex Vertex Color
    | EC_06 Vertex Vertex Color
    | EC_07 Vertex Vertex Color
    | EC_08 Vertex Vertex Color
    | EC_09 Vertex Vertex Color
    | EC_10 Vertex Vertex Color
    | EC_11 Vertex Vertex Color
    | EC_12 Vertex Vertex Color
    | EC_13 Vertex Vertex Color
    | EC_14 Vertex Vertex Color
    | EC_15 Vertex Vertex Color
    | EC_16 Vertex Vertex Color
    | EC_17 Vertex Vertex Color
    | EC_18 Vertex Vertex Color
    | EC_19 Vertex Vertex Color
    | EC_20 Vertex Vertex Color
    | EC_21 Vertex Vertex Color
    | EC_22 Vertex Vertex Color
    | EC_23 Vertex Vertex Color
    | EC_24 Vertex Vertex Color
    | EC_25 Vertex Vertex Color
    | EC_26 Vertex Vertex Color
    | EC_27 Vertex Vertex Color
    | EC_28 Vertex Vertex Color
    | EC_29 Vertex Vertex Color
    | EC_30 Vertex Vertex Color


type EdgeVertex
    = EV_01 Vertex Vertex
    | EV_02 Vertex Vertex
    | EV_03 Vertex Vertex
    | EV_04 Vertex Vertex
    | EV_05 Vertex Vertex
    | EV_06 Vertex Vertex
    | EV_07 Vertex Vertex
    | EV_08 Vertex Vertex
    | EV_09 Vertex Vertex
    | EV_10 Vertex Vertex
    | EV_11 Vertex Vertex
    | EV_12 Vertex Vertex
    | EV_13 Vertex Vertex
    | EV_14 Vertex Vertex
    | EV_15 Vertex Vertex
    | EV_16 Vertex Vertex
    | EV_17 Vertex Vertex
    | EV_18 Vertex Vertex
    | EV_19 Vertex Vertex
    | EV_20 Vertex Vertex
    | EV_21 Vertex Vertex
    | EV_22 Vertex Vertex
    | EV_23 Vertex Vertex
    | EV_24 Vertex Vertex
    | EV_25 Vertex Vertex
    | EV_26 Vertex Vertex
    | EV_27 Vertex Vertex
    | EV_28 Vertex Vertex
    | EV_29 Vertex Vertex
    | EV_30 Vertex Vertex


icosahedron =
    [ EV_01 V_01 V_02
    , EV_02 V_01 V_03
    , EV_03 V_01 V_04
    , EV_04 V_01 V_05
    , EV_05 V_01 V_06
    , EV_06 V_02 V_03
    , EV_07 V_02 V_06
    , EV_08 V_02 V_07
    , EV_09 V_02 V_11
    , EV_10 V_03 V_04
    , EV_11 V_03 V_07
    , EV_12 V_03 V_08
    , EV_13 V_04 V_05
    , EV_14 V_04 V_08
    , EV_15 V_04 V_09
    , EV_16 V_05 V_06
    , EV_17 V_05 V_09
    , EV_18 V_05 V_10
    , EV_19 V_06 V_10
    , EV_20 V_06 V_11
    , EV_21 V_07 V_08
    , EV_22 V_07 V_11
    , EV_23 V_07 V_12
    , EV_24 V_08 V_09
    , EV_25 V_08 V_12
    , EV_26 V_09 V_10
    , EV_27 V_09 V_12
    , EV_28 V_10 V_11
    , EV_29 V_10 V_12
    , EV_30 V_11 V_12
    ]


edgeVertexToEdgeColor : EdgeVertex -> Color -> EdgeColor
edgeVertexToEdgeColor edgeVertex c =
    case edgeVertex of
        EV_01 v1 v2 ->
            EC_01 v1 v2 c

        EV_02 v1 v2 ->
            EC_02 v1 v2 c

        EV_03 v1 v2 ->
            EC_03 v1 v2 c

        EV_04 v1 v2 ->
            EC_04 v1 v2 c

        EV_05 v1 v2 ->
            EC_05 v1 v2 c

        EV_06 v1 v2 ->
            EC_06 v1 v2 c

        EV_07 v1 v2 ->
            EC_07 v1 v2 c

        EV_08 v1 v2 ->
            EC_08 v1 v2 c

        EV_09 v1 v2 ->
            EC_09 v1 v2 c

        EV_10 v1 v2 ->
            EC_10 v1 v2 c

        EV_11 v1 v2 ->
            EC_11 v1 v2 c

        EV_12 v1 v2 ->
            EC_12 v1 v2 c

        EV_13 v1 v2 ->
            EC_13 v1 v2 c

        EV_14 v1 v2 ->
            EC_14 v1 v2 c

        EV_15 v1 v2 ->
            EC_15 v1 v2 c

        EV_16 v1 v2 ->
            EC_16 v1 v2 c

        EV_17 v1 v2 ->
            EC_17 v1 v2 c

        EV_18 v1 v2 ->
            EC_18 v1 v2 c

        EV_19 v1 v2 ->
            EC_19 v1 v2 c

        EV_20 v1 v2 ->
            EC_20 v1 v2 c

        EV_21 v1 v2 ->
            EC_21 v1 v2 c

        EV_22 v1 v2 ->
            EC_22 v1 v2 c

        EV_23 v1 v2 ->
            EC_23 v1 v2 c

        EV_24 v1 v2 ->
            EC_24 v1 v2 c

        EV_25 v1 v2 ->
            EC_25 v1 v2 c

        EV_26 v1 v2 ->
            EC_26 v1 v2 c

        EV_27 v1 v2 ->
            EC_27 v1 v2 c

        EV_28 v1 v2 ->
            EC_28 v1 v2 c

        EV_29 v1 v2 ->
            EC_29 v1 v2 c

        EV_30 v1 v2 ->
            EC_30 v1 v2 c


viewColor : Color -> String
viewColor color =
    case color of
        P ->
            "Pink"

        G ->
            "Green"

        B ->
            "Blue"

        O ->
            "Orange"

        Y ->
            "Yellow"


viewVertex : Vertex -> String
viewVertex vertex =
    case vertex of
        V_01 ->
            "V_01"

        V_02 ->
            "V_02"

        V_03 ->
            "V_03"

        V_04 ->
            "V_04"

        V_05 ->
            "V_05"

        V_06 ->
            "V_06"

        V_07 ->
            "V_07"

        V_08 ->
            "V_08"

        V_09 ->
            "V_09"

        V_10 ->
            "V_10"

        V_11 ->
            "V_11"

        V_12 ->
            "V_12"


viewEdgeVertex : EdgeVertex -> String
viewEdgeVertex edgeVertex =
    case edgeVertex of
        EV_01 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_02 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_03 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_04 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_05 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_06 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_07 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_08 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_09 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_10 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_11 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_12 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_13 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_14 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_15 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_16 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_17 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_18 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_19 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_20 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_21 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_22 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_23 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_24 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_25 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_26 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_27 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_28 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_29 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2

        EV_30 v1 v2 ->
            viewVertex v1 ++ " <-> " ++ viewVertex v2


baseGuesses =
    [ [ P ]
    , [ G ]
    , [ B ]
    , [ O ]
    , [ Y ]
    , [ B, O, Y ]
    , [ G, B, O ]
    , [ G, B, O, Y ]
    , [ G, B, O, Y ]
    , [ P, O, Y ]
    , [ P, B, O, Y ]
    , [ P, B, O, Y ]
    , [ P, G, Y ]
    , [ P, G, O, Y ]
    , [ P, G, O, Y ]
    , [ P, G, B ]
    , [ P, G, B, Y ]
    , [ P, G, B, Y ]
    , [ P, G, B, O ]
    , [ P, G, B, O ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    , [ P, G, B, O, Y ]
    ]


baseColorSequence : List Color
baseColorSequence =
    [ P, G, B, O, Y ]


remainingPink =
    [ P, P, P, P, P ]


remainingGreen =
    [ G, G, G, G, G ]


remainingBlue =
    [ B, B, B, B, B ]


remainingOrange =
    [ O, O, O, O, O ]


remainingYellow =
    [ Y, Y, Y, Y, Y ]


type alias RemainingColors =
    List ( Color, Int )


colorsToOrder =
    remainingPink
        ++ remainingGreen
        ++ remainingBlue
        ++ remainingOrange
        ++ remainingYellow
