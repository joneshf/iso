module Language.Iso.Lam where

  class Lam repr where
    lam :: String -> repr -> repr
