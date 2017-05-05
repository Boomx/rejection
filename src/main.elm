import Html exposing (Html, button, div, text, br, input, ul, li, h1, h3)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import String


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = {
  to_dos: List String,
  task: String
}

model : Model
model =
  Model [] ""


-- UPDATE

type Msg = ListenChange String | AddTask


update : Msg -> Model -> Model
update msg model =
  case msg of
    ListenChange message -> 
      {model| task = message }

    AddTask ->
      {model| to_dos = List.append model.to_dos [model.task] }



-- VIEW

render_to_do lst= 
  ul [] 
    (List.map (\msg -> li [] [text msg]) lst)

view : Model -> Html Msg



view model =
  div []
    [ 
      h3 [] [ text "A fazer"]
    , input [ placeholder "Todo", onInput ListenChange] []
    , h3 [] [ text "Feito"]
    , render_to_do model.to_dos
    , button [ onClick AddTask] [text "Add Message"] 
    ]