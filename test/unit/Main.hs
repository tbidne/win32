module Main (main) where

import qualified Unit.System.Win32.Console
import Test.Tasty (defaultMain, testGroup)

main :: IO ()
main =
  defaultMain $
    testGroup
      "Unit"
      [ Unit.System.Win32.Console.tests
      ]
