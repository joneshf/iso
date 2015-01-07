module Language.Iso.App where

  class App repr where
    app :: repr -> repr -> repr
