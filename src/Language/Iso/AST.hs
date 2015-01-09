module Language.Iso.AST where

  import Language.Iso.App
  import Language.Iso.Fls
  import Language.Iso.Ite
  import Language.Iso.Lam
  import Language.Iso.Tru
  import Language.Iso.Var

  import qualified Data.Set as S

  data AST = VAR String
           | LAM String AST
           | APP AST AST
           deriving (Eq, Show)

  ast2Repr :: (App repr, Lam repr, Var repr) => AST -> repr
  ast2Repr (VAR x) = var x
  ast2Repr (LAM x b) = lam x (ast2Repr b)
  ast2Repr (APP f x) = app (ast2Repr f) (ast2Repr x)

  boundVars :: AST -> S.Set String
  boundVars (VAR _) = S.empty
  boundVars (LAM x t) = S.singleton x `S.union` boundVars t
  boundVars (APP t t') = boundVars t `S.union` boundVars t'

  freeVars :: AST -> S.Set String
  freeVars (VAR x) = S.singleton x
  freeVars (LAM x t) = freeVars t S.\\ S.singleton x
  freeVars (APP t t') = freeVars t `S.union` freeVars t'

  instance Var AST where
    var = VAR

  instance Lam AST where
    lam = LAM

  instance App AST where
    app = APP

  instance Tru AST where
    tru = lam "t" $ lam "f" $ var "t"

  instance Fls AST where
    fls = lam "t" $ lam "f" $ var "f"

  instance Ite AST where
    ite b t = app (app b t)

  sub :: String -> AST -> AST -> AST
  sub x n v@(VAR y)
    | x == y    = n
    | otherwise = v
  sub x n l@(LAM y b)
    | x /= y && y `S.notMember` freeVars n = lam y $ sub x n b
    | otherwise                            = l
  sub x n (APP f y) = app (sub x n f) (sub x n y)

  beta :: AST -> AST
  beta v@(VAR _) = v
  beta (LAM x b) = lam x (beta b)
  beta (APP (LAM x b) y) = sub x y b
  beta a@(APP (VAR _) _) = a
  beta a@(APP t t') =
    let redex = app (beta t) (beta t')
    in if redex == a then a else beta a
