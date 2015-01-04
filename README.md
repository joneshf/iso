# Module Documentation

## Module Language.Iso

### Types

    type AST = I.AST

    type JS = I.JS

    type PS = I.PS

    type Python = I.Python

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


## Module Language.Iso.Target.JS

### Types

    newtype JS where
      JS :: String -> JS


### Type Class Instances

    instance appJS :: App JS

    instance flsJS :: Fls JS

    instance iteJS :: Ite JS

    instance lamJS :: Lam JS

    instance showJS :: Show JS

    instance truJS :: Tru JS

    instance varJS :: Var JS


## Module Language.Iso.Target.PS

### Types

    newtype PS where
      PS :: String -> PS


### Type Class Instances

    instance appPS :: App PS

    instance flsPS :: Fls PS

    instance itePS :: Ite PS

    instance lamPS :: Lam PS

    instance showPS :: Show PS

    instance truPS :: Tru PS

    instance varPS :: Var PS


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



