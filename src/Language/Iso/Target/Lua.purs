module Language.Iso.Target.Lua where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Lua = Lua String

  runLua (Lua js) = js

  instance showLua :: Show Lua where
    show (Lua js) = js

  instance varLua :: Var Lua where
    var x = Lua x

  instance lamLua :: Lam Lua where
    lam v b = Lua $ "function (" ++ v ++ ") return " ++ runLua b ++ " end"

  instance appLua :: App Lua where
    app f x = Lua $ "(" ++ runLua f ++ ")(" ++ runLua x ++ ")"

  instance flsLua :: Fls Lua where
    fls = Lua $ "false"

  instance truLua :: Tru Lua where
    tru = Lua $ "true"
