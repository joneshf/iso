module Language.Iso.Target.JavaScript where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype JavaScript = JavaScript String

  runJavaScript (JavaScript js) = js

  instance Show JavaScript where
    show (JavaScript js) = js

  instance Var JavaScript where
    var x = JavaScript x

  instance Lam JavaScript where
    lam v b = JavaScript $ "function (" ++ v ++ ") { return " ++ runJavaScript b ++ "; }"

  instance App JavaScript where
    app f x = JavaScript $ "(" ++ runJavaScript f ++ ")(" ++ runJavaScript x ++ ")"

  instance Fls JavaScript where
    fls = JavaScript $ "false"

  instance Tru JavaScript where
    tru = JavaScript $ "true"

  instance Ite JavaScript where
    ite b t f = JavaScript $
      runJavaScript b ++ " ? " ++
      runJavaScript t ++ " : " ++
      runJavaScript f
