module Language.Iso.Target.Scala where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Scala = Scala String

  runScala (Scala ps) = ps

  instance showScala :: Show Scala where
    show (Scala ps) = ps

  instance varScala :: Var Scala where
    var x = Scala x

  instance lamScala :: Lam Scala where
    lam v b = Scala $ "(" ++ v ++ ") => {" ++ runScala b ++ "}"

  instance appScala :: App Scala where
    app f x = Scala $ "(" ++ runScala f ++ ") (" ++ runScala x ++ ")"

  instance truScala :: Tru Scala where
    tru = Scala $ "true"

  instance flsScala :: Fls Scala where
    fls = Scala $ "false"

  instance iteScala :: Ite Scala where
    ite b t f = Scala $
      "if (" ++ runScala b ++
      ") {" ++ runScala t ++
      "} else {" ++ runScala f ++
      "}"
