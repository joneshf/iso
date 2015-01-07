module Language.Iso.Target.FSharp where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype FSharp = FSharp String

  runFSharp (FSharp ps) = ps

  instance Show FSharp where
    show (FSharp ps) = ps

  instance Var FSharp where
    var x = FSharp x

  instance Lam FSharp where
    lam v b = FSharp $ "fun " ++ v ++ " -> " ++ runFSharp b

  instance App FSharp where
    app f x = FSharp $ "(" ++ runFSharp f ++ ") (" ++ runFSharp x ++ ")"

  instance Tru FSharp where
    tru = FSharp $ "true"

  instance Fls FSharp where
    fls = FSharp $ "false"

  instance Ite FSharp where
    ite b t f = FSharp $
      "if " ++ runFSharp b ++
      " then " ++ runFSharp t ++
      " else " ++ runFSharp f
