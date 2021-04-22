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
objetivoAccesible objetivo = (golpeFocalizado objetivo > 200) && (golpeFocalizado objetivo < 400)

focalizar :: Objetivo -> Objetivo
focalizar objetivo = take 7 objetivo

golpeFocalizado :: Objetivo -> Number
golpeFocalizado = normalesConsecutivos.focalizar

