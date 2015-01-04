module Language.Iso.Target.SML where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype SML = SML String

  runSML (SML ps) = ps

  instance showSML :: Show SML where
    show (SML ps) = ps

  instance varSML :: Var SML where
    var x = SML x

  instance lamSML :: Lam SML where
    lam v b = SML $ "fn " ++ v ++ " => " ++ runSML b

  instance appSML :: App SML where
    app f x = SML $ "(" ++ runSML f ++ ") (" ++ runSML x ++ ")"

  instance truSML :: Tru SML where
    tru = SML $ "true"

  instance flsSML :: Fls SML where
    fls = SML $ "false"

  instance iteSML :: Ite SML where
    ite b t f = SML $
      "if " ++ runSML b ++
      " then " ++ runSML t ++
      " else " ++ runSML f
