module Language.Iso.Ite where

  class Ite repr where
    ite :: repr -> repr -> repr -> repr
