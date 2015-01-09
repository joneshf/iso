module Language.Iso.Target.Scala where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Scala = Scala { runScala :: String }

  instance Show Scala where
    show (Scala ps) = ps

  instance Var Scala where
    var x = Scala x

  instance Lam Scala where
    lam v b = Scala $ "(" ++ v ++ ") => {" ++ runScala b ++ "}"

  instance App Scala where
    app f x = Scala $ "(" ++ runScala f ++ ") (" ++ runScala x ++ ")"

  instance Tru Scala where
    tru = Scala $ "true"

  instance Fls Scala where
    fls = Scala $ "false"

  instance Ite Scala where
    ite b t f = Scala $
      "if (" ++ runScala b ++
      ") {" ++ runScala t ++
      "} else {" ++ runScala f ++
      "}"
