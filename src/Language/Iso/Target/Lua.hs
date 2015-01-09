module Language.Iso.Target.Lua where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Lua = Lua { runLua :: String }

  instance Show Lua where
    show (Lua js) = js

  instance Var Lua where
    var x = Lua x

  instance Lam Lua where
    lam v b = Lua $ "function (" ++ v ++ ") return " ++ runLua b ++ " end"

  instance App Lua where
    app f x = Lua $ "(" ++ runLua f ++ ")(" ++ runLua x ++ ")"

  instance Fls Lua where
    fls = Lua $ "false"

  instance Tru Lua where
    tru = Lua $ "true"
