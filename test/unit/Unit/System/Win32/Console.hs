module Unit.System.Win32.Console (tests) where

import qualified System.Environment as Env
import qualified System.Win32.Console as Console
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (testCase, (@=?))

tests :: TestTree
tests =
  testGroup
    "System.Win32.Console"
    [ getArgsTests
    ]

getArgsTests :: TestTree
getArgsTests =
  testGroup
    "getArgsNoExe"
    [ testGetArgsNoExeNone,
      testGetArgsNoExeEmpty,
      testGetArgsNoExeBasic
    ]

testGetArgsNoExeNone :: TestTree
testGetArgsNoExeNone = testCase "No args" $ do
  r <- Env.withArgs [] Console.getArgsNoExe
  [] @=? r

testGetArgsNoExeEmpty :: TestTree
testGetArgsNoExeEmpty = testCase "Leading empty string" $ do
  r <- Env.withArgs ["", "a1", "a2"] Console.getArgsNoExe
  ["a1", "a2"] @=? r

testGetArgsNoExeBasic :: TestTree
testGetArgsNoExeBasic = testCase "Parses typical args" $ do
  r <- Env.withArgs ["some\\whitespace to\\exe", "a1", "a2"] Console.getArgsNoExe
  ["a1", "a2"] @=? r
