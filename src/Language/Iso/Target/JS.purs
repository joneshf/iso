module Language.Iso.Target.JS where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype JS = JS String

  runJS (JS js) = js

  instance showJS :: Show JS where
    show (JS js) = js

  instance varJS :: Var JS where
    var x = JS x

  instance lamJS :: Lam JS where
    lam v b = JS $ "function (" ++ v ++ ") { return " ++ runJS b ++ "; }"

  instance appJS :: App JS where
    app f x = JS $ runJS f ++ "(" ++ runJS x ++ ")"

  instance flsJS :: Fls JS where
    fls = JS $ "false"

  instance truJS :: Tru JS where
    tru = JS $ "true"

  instance iteJS :: Ite JS where
    ite b t f = JS $
      runJS b ++ " ? " ++
      runJS t ++ " : " ++
      runJS f
