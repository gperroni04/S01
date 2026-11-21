data Esboco = Esboco
    { titulo :: String
    , tecnica :: String
    , horas :: Int
    }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio."
esbocoMaisRecente (e:_) =
    titulo e ++ " - " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) =
    1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) =
    horas e + horasDesenhando resto

main :: IO ()
main = do
    let caderno =
            [ Esboco "Dragao" "Nanquim" 3
            , Esboco "Castelo" "Grafite" 2
            , Esboco "Floresta" "Carvao" 4
            ]

    putStrLn "--- Caderno original ---"
    putStrLn (esbocoMaisRecente caderno)
    putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos caderno))
    putStrLn ("Total de horas: " ++ show (horasDesenhando caderno))

    putStrLn "--- Caderno vazio ---"
    putStrLn (esbocoMaisRecente [])

    let cadernoNovo = Esboco "Fantasma" "Aquarela" 5 : caderno

    putStrLn "--- Caderno novo ---"
    putStrLn (esbocoMaisRecente cadernoNovo)
    putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos cadernoNovo))

    putStrLn "--- Caderno original novamente ---"
    putStrLn (esbocoMaisRecente caderno)
    putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos caderno))

    -- print (head ([] :: [Esboco]))
