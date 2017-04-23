import Html exposing (Html, button, div, text, br, input, ul, li)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import String


renderLi lst = 
  ul [] 
    (List.map (\l -> li [] [text l]) lst)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = {
  counter: Int,
  messages: List String,
  currentMessage: String

}

model : Model
model =
  Model 0 [] ""


-- UPDATE

type Msg = Increment | Decrement | Reset | ListenChange String | AddMessage


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      {model| counter =  model.counter + 1}

    Decrement ->
      {model| counter = model.counter - 1}

    Reset ->
      {model| counter = 0}
    
    ListenChange message -> 
      {model| currentMessage = message }

    AddMessage ->
      {model| messages = List.append model.messages [model.currentMessage] }

-- VIEW

view : Model -> Html Msg



view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.counter) ]
    , button [ onClick Increment ] [ text "+" ]
    , br [] []
    , button [ onClick Reset ] [ text "0" ]
    , input [ placeholder "Put your question", onInput ListenChange] []
    , renderLi model.messages
    , button [ onClick AddMessage] [text "Add Message"] 
    ]