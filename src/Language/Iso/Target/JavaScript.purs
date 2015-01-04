module Language.Iso.Target.JavaScript where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  newtype JavaScript = JavaScript String

  runJavaScript (JavaScript js) = js

  instance showJavaScript :: Show JavaScript where
    show (JavaScript js) = js

  instance varJavaScript :: Var JavaScript where
    var x = JavaScript x

  instance lamJavaScript :: Lam JavaScript where
    lam v b = JavaScript $ "function (" ++ v ++ ") { return " ++ runJavaScript b ++ "; }"

  instance appJavaScript :: App JavaScript where
    app f x = JavaScript $ runJavaScript f ++ "(" ++ runJavaScript x ++ ")"

  instance flsJavaScript :: Fls JavaScript where
    fls = JavaScript $ "false"

  instance truJavaScript :: Tru JavaScript where
    tru = JavaScript $ "true"

  instance iteJavaScript :: Ite JavaScript where
    ite b t f = JavaScript $
      runJavaScript b ++ " ? " ++
      runJavaScript t ++ " : " ++
      runJavaScript f
