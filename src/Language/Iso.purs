module Language.Iso where

  import qualified Language.Iso.AST as I
  import qualified Language.Iso.App as I
  import qualified Language.Iso.Fls as I
  import qualified Language.Iso.Ite as I
  import qualified Language.Iso.Lam as I
  import qualified Language.Iso.Tru as I
  import qualified Language.Iso.Prelude as I
  import qualified Language.Iso.Var as I
  import qualified Language.Iso.Target.Erlang as I
  import qualified Language.Iso.Target.JavaScript as I
  import qualified Language.Iso.Target.PureScript as I
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
  type Erlang = I.Erlang
  type JavaScript = I.JavaScript
  type PureScript = I.PureScript
  type Python = I.Python
  type Scheme = I.Scheme
