# Module Documentation

## Module Language.Iso

### Types

    type AST = I.AST

    type Erlang = I.Erlang

    type FSharp = I.FSharp

    type Haskell = I.Haskell

    type JavaScript = I.JavaScript

    type Lua = I.Lua

    type PureScript = I.PureScript

    type Python = I.Python

    type Ruby = I.Ruby

    type SML = I.SML

    type Scala = I.Scala

    type Scheme = I.Scheme


## Module Language.Iso.AST

### Types

    data AST where
      VAR :: String -> AST
      LAM :: String -> AST -> AST
      APP :: AST -> AST -> AST


### Type Class Instances

    instance appAST :: App AST

    instance eqAST :: Eq AST

    instance flsAST :: Fls AST

    instance iteAST :: Ite AST

    instance lamAST :: Lam AST

    instance showAST :: Show AST

    instance truAST :: Tru AST

    instance varAST :: Var AST


### Values

    alpha :: String -> AST -> AST -> AST

    ast2Repr :: forall repr. (App repr, Lam repr, Var repr) => AST -> repr

    beta :: AST -> AST


## Module Language.Iso.App

### Type Classes

    class App repr where
      app :: repr -> repr -> repr


## Module Language.Iso.Fls

### Type Classes

    class Fls repr where
      fls :: repr


## Module Language.Iso.Ite

### Type Classes

    class Ite repr where
      ite :: repr -> repr -> repr -> repr


## Module Language.Iso.Lam

### Type Classes

    class Lam repr where
      lam :: String -> repr -> repr


## Module Language.Iso.Prelude

### Values

    idiot :: forall repr. (Var repr, Lam repr) => repr

    kestrel :: forall repr. (Var repr, Lam repr) => repr

    starling :: forall repr. (Var repr, Lam repr, App repr) => repr


## Module Language.Iso.Tru

### Type Classes

    class Tru repr where
      tru :: repr


## Module Language.Iso.Var

### Type Classes

    class Var repr where
      var :: String -> repr


## Module Language.Iso.Target.Erlang

### Types

    newtype Erlang where
      Erlang :: String -> Erlang


### Type Class Instances

    instance appErlang :: App Erlang

    instance flsErlang :: Fls Erlang

    instance iteErlang :: Ite Erlang

    instance lamErlang :: Lam Erlang

    instance showErlang :: Show Erlang

    instance truErlang :: Tru Erlang

    instance varErlang :: Var Erlang


## Module Language.Iso.Target.FSharp

### Types

    newtype FSharp where
      FSharp :: String -> FSharp


### Type Class Instances

    instance appFSharp :: App FSharp

    instance flsFSharp :: Fls FSharp

    instance iteFSharp :: Ite FSharp

    instance lamFSharp :: Lam FSharp

    instance showFSharp :: Show FSharp

    instance truFSharp :: Tru FSharp

    instance varFSharp :: Var FSharp


## Module Language.Iso.Target.Haskell

### Types

    newtype Haskell where
      Haskell :: String -> Haskell


### Type Class Instances

    instance appHaskell :: App Haskell

    instance flsHaskell :: Fls Haskell

    instance iteHaskell :: Ite Haskell

    instance lamHaskell :: Lam Haskell

    instance showHaskell :: Show Haskell

    instance truHaskell :: Tru Haskell

    instance varHaskell :: Var Haskell


## Module Language.Iso.Target.JavaScript

### Types

    newtype JavaScript where
      JavaScript :: String -> JavaScript


### Type Class Instances

    instance appJavaScript :: App JavaScript

    instance flsJavaScript :: Fls JavaScript

    instance iteJavaScript :: Ite JavaScript

    instance lamJavaScript :: Lam JavaScript

    instance showJavaScript :: Show JavaScript

    instance truJavaScript :: Tru JavaScript

    instance varJavaScript :: Var JavaScript


## Module Language.Iso.Target.Lua

### Types

    newtype Lua where
      Lua :: String -> Lua


### Type Class Instances

    instance appLua :: App Lua

    instance flsLua :: Fls Lua

    instance lamLua :: Lam Lua

    instance showLua :: Show Lua

    instance truLua :: Tru Lua

    instance varLua :: Var Lua


## Module Language.Iso.Target.PureScript

### Types

    newtype PureScript where
      PureScript :: String -> PureScript


### Type Class Instances

    instance appPureScript :: App PureScript

    instance flsPureScript :: Fls PureScript

    instance itePureScript :: Ite PureScript

    instance lamPureScript :: Lam PureScript

    instance showPureScript :: Show PureScript

    instance truPureScript :: Tru PureScript

    instance varPureScript :: Var PureScript


## Module Language.Iso.Target.Python

### Types

    newtype Python where
      Python :: String -> Python


### Type Class Instances

    instance appPython :: App Python

    instance flsPython :: Fls Python

    instance itePython :: Ite Python

    instance lamPython :: Lam Python

    instance showPython :: Show Python

    instance truPython :: Tru Python

    instance varPython :: Var Python


## Module Language.Iso.Target.Ruby

### Types

    newtype Ruby where
      Ruby :: String -> Ruby


### Type Class Instances

    instance appRuby :: App Ruby

    instance flsRuby :: Fls Ruby

    instance iteRuby :: Ite Ruby

    instance showRuby :: Show Ruby

    instance truRuby :: Tru Ruby

    instance varRuby :: Var Ruby


## Module Language.Iso.Target.SML

### Types

    newtype SML where
      SML :: String -> SML


### Type Class Instances

    instance appSML :: App SML

    instance flsSML :: Fls SML

    instance iteSML :: Ite SML

    instance lamSML :: Lam SML

    instance showSML :: Show SML

    instance truSML :: Tru SML

    instance varSML :: Var SML


## Module Language.Iso.Target.Scala

### Types

    newtype Scala where
      Scala :: String -> Scala


### Type Class Instances

    instance appScala :: App Scala

    instance flsScala :: Fls Scala

    instance iteScala :: Ite Scala

    instance lamScala :: Lam Scala

    instance showScala :: Show Scala

    instance truScala :: Tru Scala

    instance varScala :: Var Scala


## Module Language.Iso.Target.Scheme

### Types

    newtype Scheme where
      Scheme :: String -> Scheme


### Type Class Instances

    instance appScheme :: App Scheme

    instance flsScheme :: Fls Scheme

    instance iteScheme :: Ite Scheme

    instance lamScheme :: Lam Scheme

    instance showScheme :: Show Scheme

    instance truScheme :: Tru Scheme

    instance varScheme :: Var Scheme



