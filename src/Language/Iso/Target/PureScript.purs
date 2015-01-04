module Language.Iso.Target.PureScript where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype PureScript = PureScript String

  runPureScript (PureScript ps) = ps

  instance showPureScript :: Show PureScript where
    show (PureScript ps) = ps

  instance varPureScript :: Var PureScript where
    var x = PureScript x

  instance lamPureScript :: Lam PureScript where
    lam v b = PureScript $ "\\" ++ v ++ " -> " ++ runPureScript b

  instance appPureScript :: App PureScript where
    app f x = PureScript $ "(" ++ runPureScript f ++ ") (" ++ runPureScript x ++ ")"

  instance truPureScript :: Tru PureScript where
    tru = PureScript $ "true"

  instance flsPureScript :: Fls PureScript where
    fls = PureScript $ "false"

  instance itePureScript :: Ite PureScript where
    ite b t f = PureScript $
      "if " ++ runPureScript b ++
      " then " ++ runPureScript t ++
      " else " ++ runPureScript f
