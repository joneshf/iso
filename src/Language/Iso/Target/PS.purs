module Language.Iso.Target.PS where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype PS = PS String

  runPS (PS ps) = ps

  instance showPS :: Show PS where
    show (PS ps) = ps

  instance varPS :: Var PS where
    var x = PS x

  instance lamPS :: Lam PS where
    lam v b = PS $ "\\" ++ v ++ " -> " ++ runPS b

  instance appPS :: App PS where
    app f x = PS $ "(" ++ runPS f ++ ") (" ++ runPS x ++ ")"

  instance truPS :: Tru PS where
    tru = PS $ "true"

  instance flsPS :: Fls PS where
    fls = PS $ "false"

  instance itePS :: Ite PS where
    ite b t f = PS $
      "if " ++ runPS b ++
      " then " ++ runPS t ++
      " else " ++ runPS f
