module Library where
import PdePreludat

-- Punto 1

type Horas = Number
type Objetivo = String
type Presion = Number

presionGolpe :: Horas -> Objetivo -> Presion
presionGolpe horas objetivo = poder horas / fortaleza objetivo

poder :: Horas -> Number
poder = (* 15)

fortaleza :: Objetivo -> Number
fortaleza = (2*) . length

-- Punto 2

type Golpe = Objetivo -> Number

gomuGomu :: Golpe
gomuGomu = presionGolpe 180

normalesConsecutivos :: Golpe 
normalesConsecutivos = presionGolpe 240

-- Punto 3 

objetivoDificil :: Objetivo -> Bool 
objetivoDificil = (< 100) . gomuGomu

objetivoAccesible :: Objetivo -> Bool
objetivoAccesible = estaEntre.golpeFocalizado

focalizar :: Objetivo -> Objetivo
focalizar objetivo = primerasSiete objetivo

golpeFocalizado :: Objetivo -> Presion
golpeFocalizado = normalesConsecutivos.focalizar

--Auxiliares
---------------------------------------------------------
between :: Ord a => a -> a -> a -> Bool
between bajo alto medio = bajo <= medio && medio <= alto
---------------------------------------------------------
estaEntre :: Presion -> Bool
estaEntre = between 200 400
---------------------------------------------------------
primerasSiete :: Objetivo -> Objetivo
primerasSiete = take 7
---------------------------------------------------------
