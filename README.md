# Iso

Iso is a toy implementation of the untyped lambda calculus that should support isomorphisms between target languages using final interpreters.
Currently, only one map of the morphism is supported: `Iso -> Target`.

## Motivation

I've always hated being restricted by language choice.
Some things are more elegant in one language than another.
Since most of the languages we use are Turing complete, we can represent one with the other.
A common Turing complete language is the untyped lambda calculus.

Since the untyped lambda calculus is fairly simple, it's fairly easy to implement and reason about.
So, we can use the untyped lambda calculus as the intermediate representation for other programming languages.

#### Current Targets

* Erlang
* FSharp
* Haskell
* JavaScript
* Lua
* PureScript
* Python
* Ruby
* SML
* Scala
* Scheme
