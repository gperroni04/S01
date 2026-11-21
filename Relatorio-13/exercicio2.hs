pesoMaximo :: Double
pesoMaximo = 10.0

-- pesoMaximo = 15.0

data Encomenda = Encomenda
    { destinatario :: String
    , peso :: Double
    , frete :: Double
    }

descrever :: Encomenda -> String
descrever encomenda =
    destinatario encomenda
    ++ " - Peso: " ++ show (peso encomenda)
    ++ " kg - Frete: R$ " ++ show (frete encomenda)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas =
    filter (\encomenda -> peso encomenda <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas =
    sum (map frete encomendas)

main :: IO ()
main = do
    let encomendas =
            [ Encomenda "Ana" 5.0 15.0
            , Encomenda "Pedro" 12.0 25.0
            , Encomenda "Maria" 8.0 20.0
            , Encomenda "Joao" 15.0 30.0
            ]

    let encomendasPossiveis = cabemNaVassoura encomendas

    putStrLn "--- Todas as encomendas ---"
    mapM_ (putStrLn . descrever) encomendas

    putStrLn "--- Encomendas que cabem na vassoura ---"
    mapM_ (putStrLn . descrever) encomendasPossiveis

    putStrLn "--- Total de fretes ---"
    print (totalDeFretes encomendasPossiveis)
