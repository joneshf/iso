module Language.Iso.Prelude where

  import Language.Iso.App
  import Language.Iso.Lam
  import Language.Iso.Var

  idiot :: (Var repr, Lam repr) => repr
  idiot = lam "x" (var "x")
  kestrel :: (Var repr, Lam repr) => repr
  kestrel = lam "x" (lam "y" (var "x"))
  starling :: (Var repr, Lam repr, App repr) => repr
  starling = lam "x" (lam "y" (lam "z" (app (app (var "x") (var "z")) (app (var "y") (var "z")))))
