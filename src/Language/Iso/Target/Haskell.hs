module Language.Iso.Target.Haskell where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Haskell = Haskell { runHaskell :: String }

  instance Show Haskell where
    show (Haskell ps) = ps

  instance Var Haskell where
    var x = Haskell x

  instance Lam Haskell where
    lam v b = Haskell $ "\\" ++ v ++ " -> " ++ runHaskell b

  instance App Haskell where
    app f x = Haskell $ "(" ++ runHaskell f ++ ") (" ++ runHaskell x ++ ")"

  instance Tru Haskell where
    tru = Haskell $ "True"

  instance Fls Haskell where
    fls = Haskell $ "False"

  instance Ite Haskell where
    ite b t f = Haskell $
      "if " ++ runHaskell b ++
      " then " ++ runHaskell t ++
      " else " ++ runHaskell f
