module Language.Iso.AST where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  data AST = VAR String
           | LAM String AST
           | APP AST AST
           deriving (Eq, Show)

  ast2Repr :: (App repr, Lam repr, Var repr) => AST -> repr
  ast2Repr (VAR x) = var x
  ast2Repr (LAM x b) = lam x (ast2Repr b)
  ast2Repr (APP f x) = app (ast2Repr f) (ast2Repr x)

  instance Var AST where
    var = VAR

  instance Lam AST where
    lam = LAM

  instance App AST where
    app = APP

  instance Tru AST where
    tru = LAM "t" (LAM "f" (VAR "t"))

  instance Fls AST where
    fls = LAM "t" (LAM "f" (VAR "f"))

  instance Ite AST where
    ite b t f = app (app b t) f

  alpha :: String -> AST -> AST -> AST
  alpha x n (VAR y)
    | x == y    = n
    | otherwise = VAR y
  alpha x n (LAM y b)
    | x == y    = LAM y b
    | otherwise = LAM y $ alpha x n b
  alpha x n (APP f y) = APP (alpha x n f) (alpha x n y)

  beta :: AST -> AST
  beta (VAR x) = VAR x
  beta (LAM x b) = LAM x (beta b)
  beta (APP (LAM x b) y) = alpha x y b
  beta a@(APP f x) =
    let red = APP (beta f) (beta x)
    in if red == a then red else beta red
