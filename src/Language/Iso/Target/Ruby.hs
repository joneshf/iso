module Language.Iso.Target.Ruby where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Ruby = Ruby { runRuby :: String }

  instance Show Ruby where
    show (Ruby js) = js

  instance Var Ruby where
    var x = Ruby x

  instance App Ruby where
    app f x = Ruby $ "(" ++ runRuby f ++ ")(" ++ runRuby x ++ ")"

  instance Fls Ruby where
    fls = Ruby $ "false"

  instance Tru Ruby where
    tru = Ruby $ "true"

  instance Ite Ruby where
    ite b t f = Ruby $
      "if " ++ runRuby b ++
      " then " ++ runRuby t ++
      " else " ++ runRuby f ++
      " end"
