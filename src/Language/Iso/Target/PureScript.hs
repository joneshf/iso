module Language.Iso.Target.PureScript where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype PureScript = PureScript String

  runPureScript (PureScript ps) = ps

  instance Show PureScript where
    show (PureScript ps) = ps

  instance Var PureScript where
    var x = PureScript x

  instance Lam PureScript where
    lam v b = PureScript $ "\\" ++ v ++ " -> " ++ runPureScript b

  instance App PureScript where
    app f x = PureScript $ "(" ++ runPureScript f ++ ") (" ++ runPureScript x ++ ")"

  instance Tru PureScript where
    tru = PureScript $ "true"

  instance Fls PureScript where
    fls = PureScript $ "false"

  instance Ite PureScript where
    ite b t f = PureScript $
      "if " ++ runPureScript b ++
      " then " ++ runPureScript t ++
      " else " ++ runPureScript f
