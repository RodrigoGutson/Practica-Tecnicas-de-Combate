module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "objetivoDificil" $ do
    it "Objetivo es dificil" $ do
      objetivoDificil "bolsa de entrenamiento" `shouldBe` True
    it "Objetivo no es dificil" $ do
      objetivoDificil "Puf" `shouldBe` False
  describe "objetivoAccesible" $ do
    it "Objetivo es accesible" $ do
      objetivoAccesible "bolsa de entrenamiento" `shouldBe` True
    it "Objetivo no es accesible" $ do
      objetivoAccesible "Puf" `shouldBe` False

