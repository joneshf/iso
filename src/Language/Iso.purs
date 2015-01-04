module Language.Iso where

  import qualified Language.Iso.AST as I
  import qualified Language.Iso.App as I
  import qualified Language.Iso.Fls as I
  import qualified Language.Iso.Ite as I
  import qualified Language.Iso.Lam as I
  import qualified Language.Iso.Tru as I
  import qualified Language.Iso.Prelude as I
  import qualified Language.Iso.Var as I
  import qualified Language.Iso.Target.JS as I
  import qualified Language.Iso.Target.PS as I
  import qualified Language.Iso.Target.Python as I
  import qualified Language.Iso.Target.Scheme as I

  app = I.app
  lam = I.lam
  var = I.var
  idiot = I.idiot
  kestrel = I.kestrel
  starling = I.starling
  tru = I.tru
  fls = I.fls
  ite = I.ite
  alpha = I.alpha
  beta = I.beta
  ast2Repr = I.ast2Repr
  type AST = I.AST
  type JS = I.JS
  type PS = I.PS
  type Python = I.Python
  type Scheme = I.Scheme
