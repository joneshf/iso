module Language.Iso.Target.Scheme where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Scheme = Scheme { runScheme :: String }

  instance Show Scheme where
    show (Scheme ps) = ps

  instance Var Scheme where
    var x = Scheme x

  instance Lam Scheme where
    lam v b = Scheme $ "(lambda (" ++ v ++ ") " ++ runScheme b ++ ")"

  instance App Scheme where
    app f x = Scheme $ "(" ++ runScheme f ++ " " ++ runScheme x ++ ")"

  instance Fls Scheme where
    fls = Scheme "#f"

  instance Ite Scheme where
    ite b t f= Scheme $
      "(if " ++ runScheme b ++ " "
             ++ runScheme t ++ " "
             ++ runScheme f ++ ")"

  instance Tru Scheme where
    tru = Scheme "#t"
