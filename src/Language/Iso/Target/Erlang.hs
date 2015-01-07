module Language.Iso.Target.Erlang where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype Erlang = Erlang String

  runErlang (Erlang ps) = ps

  instance Show Erlang where
    show (Erlang ps) = ps

  instance Var Erlang where
    var x = Erlang x

  instance Lam Erlang where
    lam v b = Erlang $ "fun(" ++ v ++ ") -> " ++ runErlang b ++ " end"

  instance App Erlang where
    app f x = Erlang $ "(" ++ runErlang f ++ ")(" ++ runErlang x ++ ")"

  instance Tru Erlang where
    tru = Erlang $ "true"

  instance Fls Erlang where
    fls = Erlang $ "false"

  instance Ite Erlang where
    ite b t f = Erlang $
      "if " ++ runErlang b ++ " -> " ++
               runErlang t ++ "; true -> " ++
               runErlang f ++ " end"
