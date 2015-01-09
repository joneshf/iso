module Language.Iso.Target.Python where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Python = Python { runPython :: String }

  instance Show Python where
    show (Python ps) = ps

  instance Var Python where
    var x = Python x

  instance Lam Python where
    lam v b = Python $ "lambda " ++ v ++ ": " ++ runPython b

  instance App Python where
    app f x = Python $ "(" ++ runPython f ++ ")(" ++ runPython x ++ ")"

  instance Fls Python where
    fls = Python $ "false"

  instance Tru Python where
    tru = Python $ "true"

  instance Ite Python where
    ite b t f = Python $
      runPython t ++ " if " ++
      runPython b ++ " else " ++
      runPython f
