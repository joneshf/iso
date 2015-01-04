module Language.Iso.Target.Python where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Python = Python String

  runPython (Python ps) = ps

  instance showPython :: Show Python where
    show (Python ps) = ps

  instance varPython :: Var Python where
    var x = Python x

  instance lamPython :: Lam Python where
    lam v b = Python $ "lambda " ++ v ++ ": " ++ runPython b

  instance appPython :: App Python where
    app f x = Python $ runPython f ++ "(" ++ runPython x ++ ")"

  instance flsPython :: Fls Python where
    fls = Python $ "false"

  instance truPython :: Tru Python where
    tru = Python $ "true"

  instance itePython :: Ite Python where
    ite b t f = Python $
      runPython t ++ " if " ++
      runPython b ++ " else " ++
      runPython f
