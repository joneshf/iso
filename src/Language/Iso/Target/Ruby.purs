module Language.Iso.Target.Ruby where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Ruby = Ruby String

  runRuby (Ruby js) = js

  instance showRuby :: Show Ruby where
    show (Ruby js) = js

  instance varRuby :: Var Ruby where
    var x = Ruby x

  instance appRuby :: App Ruby where
    app f x = Ruby $ "(" ++ runRuby f ++ ")(" ++ runRuby x ++ ")"

  instance flsRuby :: Fls Ruby where
    fls = Ruby $ "false"

  instance truRuby :: Tru Ruby where
    tru = Ruby $ "true"

  instance iteRuby :: Ite Ruby where
    ite b t f = Ruby $
      "if " ++ runRuby b ++
      " then " ++ runRuby t ++
      " else " ++ runRuby f ++
      " end"
