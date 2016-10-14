module Main exposing (..)


import Units exposing (..)
import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


type alias Model =
  { armyName : String
  , hQ1 : Unit
  , hQ2 : Unit
  , t1 : Unit
  , t2 : Unit
  , t3 : Unit
  , t4 : Unit
  , t5 : Unit
  , t6 : Unit
  , elite1 : Unit
  , elite2 : Unit
  , elite3 : Unit
  , fa1 : Unit
  , fa2 : Unit
  , fa3 : Unit
  , hs1 : Unit
  , hs2 : Unit
  , hs3 : Unit
  , totalCost : Int
  }



model : Model
model =
  { armyName = "Tyranid Army List"
  , hQ1 = emptyUnit
  , hQ2 = emptyUnit
  , t1 = emptyUnit
  , t2 = emptyUnit
  , t3 = emptyUnit
  , t4 = emptyUnit
  , t5 = emptyUnit
  , t6 = emptyUnit
  , elite1 = emptyUnit
  , elite2 = emptyUnit
  , elite3 = emptyUnit
  , fa1 = emptyUnit
  , fa2 = emptyUnit
  , fa3 = emptyUnit
  , hs1 = emptyUnit
  , hs2 = emptyUnit
  , hs3 = emptyUnit
  , totalCost = 0
  }



view : Model -> Html Msg
view model =

    let

      emptyHQ2View =
        div [] [
          p [] [ text "Empty HQ Slot"]
          , div [] [
             button [type' "button", onClick (ChangeHQ2 hiveTyrant)] [text "Add Hive Tyrant"]
             , button [type' "button", onClick (ChangeHQ2 tyranidPrime)] [text "Add Tyranid Prime"]
          ]
        ]

      emptyHQ1View =
        div [] [
          p [] [ text "Empty HQ Slot"]
          , div [] [
             button [type' "button", onClick (ChangeHQ1 hiveTyrant)] [text "Add Hive Tyrant"]
             , button [type' "button", onClick (ChangeHQ1 tyranidPrime)] [text "Add Tyranid Prime"]
          ]
        ]




      hQ1View : Unit -> Html Msg
      hQ1View unit =
          div []
            [ h2 []
                [ text ((toString unit.initialSize) ++ " " ++ unit.name) ]
            , h3 []
                [ text (toString unit.totalCost ++ " points") ]
            , p [] []
            , button [type' "button", onClick (ChangeHQ1 emptyUnit)] [text "Remove this unit"]
            ]

      hQ2View : Unit -> Html Msg
      hQ2View unit =
          div []
            [ h2 []
                [ text ((toString unit.initialSize) ++ " " ++ unit.name) ]
            , h3 []
                [ text (toString unit.totalCost ++ " points") ]
            , p [] []
            , button [type' "button", onClick (ChangeHQ2 emptyUnit)] [text "Remove this unit"]
            ]


      hq1UnitView =
        if model.hQ1 == emptyUnit then
          emptyHQ1View
        else
          hQ1View model.hQ1


      hq2UnitView =
        if model.hQ2 == emptyUnit then
          emptyHQ2View
        else
          hQ2View model.hQ2


      emptyTroop1View =
        div [] [
          p [] [ text "Empty Troop Slot"]
          , div [] [
             button [type' "button", onClick (ChangeT1 termagant1)] [text "Add Termagant Squad"]
          ]
        ]

      troop1View : Unit -> Html Msg
      troop1View unit =
          div []
            [ h2 []
                [ text ((toString unit.currentSize) ++ " " ++ unit.name) ]
            , h3 []
                [ text (toString unit.totalCost ++ " points") ]
            , p [] []
            , button [type' "button", onClick (AlterT1 unit 1)] [text "Add Units"]
            , button [type' "button", onClick (AlterT1 unit 2)] [text "Remove Units"]

            , br [] []
            , button [type' "button", onClick (ChangeT1 emptyUnit)] [text "Remove this unit"]
            ]




      troop1UnitView =
        if model.t1 == emptyUnit then
          emptyTroop1View
        else
          troop1View model.t1


    in

      div []
        [ h1 [] [ text model.armyName]
        , input [ onInput ChangeName ] [  ]
        , h3 [] [ text ((toString model.totalCost) ++ " points")]
        , br [] []
      --Current addition context
        , br [] []
        , hq1UnitView
        , br [] []
        , hq2UnitView
        , br [] []
        , hr [] []
        , br [] []
        , troop1UnitView
        ]

changeNumUnit : Unit -> Int -> Unit
changeNumUnit unit num =
  { unit | currentSize = num }




type Msg =
  ChangeName String
  | ChangeHQ1 Unit
  | ChangeHQ2 Unit
  | ChangeT1 Unit
  | ChangeT2 Unit
  | ChangeT3 Unit
  | ChangeT4 Unit
  | ChangeT5 Unit
  | ChangeT6 Unit
  | ChangeElite1 Unit
  | ChangeElite2 Unit
  | ChangeElite3 Unit
  | ChangeFA1 Unit
  | ChangeFA2 Unit
  | ChangeFA3 Unit
  | ChangeHS1 Unit
  | ChangeHS2 Unit
  | ChangeHS3 Unit
  | AlterT1 Unit Int




getValue : Model -> Int
getValue model =
  model.hQ1.totalCost
  + model.hQ2.totalCost
  + model.t1.totalCost
  + model.t2.totalCost
  + model.t3.totalCost
  + model.t4.totalCost
  + model.t5.totalCost
  + model.t6.totalCost
  + model.elite1.totalCost
  + model.elite2.totalCost
  + model.elite3.totalCost
  + model.fa1.totalCost
  + model.fa2.totalCost
  + model.fa3.totalCost
  + model.hs1.totalCost
  + model.hs2.totalCost
  + model.hs3.totalCost

updateCost : Unit -> Unit
updateCost unit =
  {unit | totalCost = unit.currentSize * unit.unitVal}



update : Msg -> Model -> Model
update msg model =
    case msg of
      ChangeName armyName ->
        { model | armyName = armyName }

      ChangeHQ1 context ->
        let updatedModel = { model | hQ1 = context }
        in { updatedModel | totalCost = getValue updatedModel }

      ChangeHQ2 context ->
          let updatedModel = { model | hQ2 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeT1 context ->
          let updatedModel = { model | t1 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeT2 context ->
          let updatedModel = { model | t2 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeT3 context ->
          let updatedModel = { model | t3 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeT4 context ->
          let updatedModel = { model | t4 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeT5 context ->
          let updatedModel = { model | t5 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeT6 context ->
        let updatedModel = { model | t6 = context }
        in { updatedModel | totalCost = getValue updatedModel }

      ChangeElite1 context ->
          let updatedModel = { model | elite1 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeElite2 context ->
          let updatedModel = { model | elite2 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeElite3 context ->
          let updatedModel = { model | elite3 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeFA1 context ->
          let updatedModel = { model | fa1 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeFA2 context ->
          let updatedModel = { model | fa2 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeFA3 context ->
          let updatedModel = { model | fa3 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeHS1 context ->
          let updatedModel = { model | hs1 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeHS2 context ->
          let updatedModel = { model | hs2 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      ChangeHS3 context ->
          let updatedModel = { model | hs3 = context }
          in { updatedModel | totalCost = getValue updatedModel }

      AlterT1 unit num ->
        if num == 1 then
            if unit.currentSize >= unit.maxSize then
              let updatedModel = { model | t1 = changeNumUnit unit unit.maxSize }
                  updatedModel2 = { updatedModel | t1 = updateCost updatedModel.t1}
              in { updatedModel2 | totalCost = getValue updatedModel2 }
            else
              let updatedModel = { model | t1 = changeNumUnit unit ( unit.currentSize + 1 ) }
                  updatedModel2 = { updatedModel | t1 = updateCost updatedModel.t1}
              in { updatedModel2 | totalCost = getValue updatedModel2 }
        else
            if unit.currentSize <= unit.initialSize then
              let updatedModel = { model | t1 = changeNumUnit unit unit.initialSize }
                  updatedModel2 = { updatedModel | t1 = updateCost updatedModel.t1}
              in { updatedModel2 | totalCost = getValue updatedModel2 }
            else
              let updatedModel = { model | t1 = changeNumUnit unit ( unit.currentSize - 1 ) }
                  updatedModel2 = { updatedModel | t1 = updateCost updatedModel.t1}
              in { updatedModel2 | totalCost = getValue updatedModel2 }






main : Program Never
main =
  Html.beginnerProgram
        { view = view
        , update = update
        , model = model
        }
