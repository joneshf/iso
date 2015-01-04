module Language.Iso.Target.Scheme where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Scheme = Scheme String

  runScheme (Scheme ps) = ps

  instance showScheme :: Show Scheme where
    show (Scheme ps) = ps

  instance varScheme :: Var Scheme where
    var x = Scheme x

  instance lamScheme :: Lam Scheme where
    lam v b = Scheme $ "(lambda (" ++ v ++ ") " ++ runScheme b ++ ")"

  instance appScheme :: App Scheme where
    app f x = Scheme $ "(" ++ runScheme f ++ " " ++ runScheme x ++ ")"

  instance flsScheme :: Fls Scheme where
    fls = Scheme "#f"

  instance iteScheme :: Ite Scheme where
    ite b t f= Scheme $
      "(if " ++ runScheme b ++ " "
             ++ runScheme t ++ " "
             ++ runScheme f ++ ")"

  instance truScheme :: Tru Scheme where
    tru = Scheme "#t"
