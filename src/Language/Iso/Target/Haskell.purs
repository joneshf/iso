module Language.Iso.Target.Haskell where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Haskell = Haskell String

  runHaskell (Haskell ps) = ps

  instance showHaskell :: Show Haskell where
    show (Haskell ps) = ps

  instance varHaskell :: Var Haskell where
    var x = Haskell x

  instance lamHaskell :: Lam Haskell where
    lam v b = Haskell $ "\\" ++ v ++ " -> " ++ runHaskell b

  instance appHaskell :: App Haskell where
    app f x = Haskell $ "(" ++ runHaskell f ++ ") (" ++ runHaskell x ++ ")"

  instance truHaskell :: Tru Haskell where
    tru = Haskell $ "True"

  instance flsHaskell :: Fls Haskell where
    fls = Haskell $ "False"

  instance iteHaskell :: Ite Haskell where
    ite b t f = Haskell $
      "if " ++ runHaskell b ++
      " then " ++ runHaskell t ++
      " else " ++ runHaskell f
