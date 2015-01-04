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

  ast2Repr :: forall repr. (App repr, Lam repr, Var repr) => AST -> repr
  ast2Repr (VAR x) = var x
  ast2Repr (LAM x b) = lam x (ast2Repr b)
  ast2Repr (APP f x) = app (ast2Repr f) (ast2Repr x)

  instance eqAST :: Eq AST where
    (==) (VAR x)   (VAR y)   = x == y
    (==) (LAM x b) (LAM y c) = x == y && b == c
    (==) (APP f x) (APP g y) = f == g && x == y
    (==) _         _         = false

    (/=) x         y         = not (x == y)

  instance showAST :: Show AST where
    show (VAR x) = "Var (" ++ x ++ ")"
    show (LAM x b) = "Lam (" ++ x ++ ") (" ++ show b ++ ")"
    show (APP f x) = "App (" ++ show f ++ ") (" ++ show x ++ ")"

  instance varAST :: Var AST where
    var = VAR

  instance lamAST :: Lam AST where
    lam = LAM

  instance appAST :: App AST where
    app = APP

  instance truAST :: Tru AST where
    tru = LAM "t" (LAM "f" (VAR "t"))

  instance flsAST :: Fls AST where
    fls = LAM "t" (LAM "f" (VAR "f"))

  instance iteAST :: Ite AST where
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
