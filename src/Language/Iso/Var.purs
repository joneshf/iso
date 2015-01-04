module Language.Iso.Var where

  class Var repr where
    var :: String -> repr
