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

Final interpreters were chosen as not all languages have a direct mapping between the untyped lambda calculus.
`Lua`, for one, does not have conditional expressions, only conditional statements.
`Ruby` does not have lambda expressions, only lambda statements.
They have equivalent mappings, so all is not lost.
Since `Iso` does not yet have statements (as the untyped lambda calculus doesn't have statments),
we'll have to think of another way to represent these constructs.
Final interpreters allow us to implement all that we can without being forced to into an all or nothing situation.
Since `Iso` is written in a language with a good type system, 
we can verify at compile time if our expression can be translated into a target.
That is to say, if an expression does not contain conditionals, 
we can compile to `Lua`, or if an expression does not contain lambdas, 
we can compile to `Ruby`, and so on.

#### Current Targets

| Language   | Fully Implemented | Missing |
|------------|-------------------|---------|
| Erlang     | Yes               |         |
| FSharp     | Yes               |         |
| Haskell    | Yes               |         |
| JavaScript | Yes               |         |
| Lua        |                   | `Ite`   |
| PureScript | Yes               |         |
| Python     | Yes               |         |
| Ruby       |                   | `Lam`   |
| SML        | Yes               |         |
| Scala      | Yes               |         |
| Scheme     | Yes               |         |
