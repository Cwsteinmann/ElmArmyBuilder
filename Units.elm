module Units exposing (..)




type alias Unit =
  { name : String
  , unitVal : Int
  , initialVal : Int
  , initialSize : Int
  , currentSize : Int
  , maxSize : Int
  , unitID : String
  , totalCost : Int
  }


termagant : Unit
termagant =
  { name = "Termagants"
  , unitVal = 4
  , initialVal = 40
  , initialSize = 10
  , currentSize = 10
  , maxSize = 30
  , unitID = ""
  , totalCost = 40
  }

termagant1 = termagant
termagant2 = termagant
termagant3 = termagant
termagant4 = termagant
termagant5 = termagant
termagant6 = termagant

hiveTyrant : Unit
hiveTyrant =
  { name = "Hive Tyrant"
  , unitVal = 0
  , initialVal = 130
  , initialSize = 1
  , currentSize = 1
  , maxSize = 1
  , unitID = ""
  , totalCost = 130
  }

tyranidPrime : Unit
tyranidPrime =
  { name = "Tyranid Prime"
  , unitVal = 0
  , initialVal = 90
  , initialSize = 1
  , currentSize = 1
  , maxSize = 1
  , unitID = ""
  , totalCost = 90
  }

emptyUnit : Unit
emptyUnit =
  { name = ""
  , unitVal = 0
  , initialVal = 0
  , initialSize = 0
  , currentSize = 0
  , maxSize = 0
  , unitID = ""
  , totalCost = 0
  }
