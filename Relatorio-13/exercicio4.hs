data Etapa = NaFila | NoBanho | Concluido
    deriving (Show, Eq)

data Atendimento = Atendimento
    { cliente :: String
    , servico :: String
    , valor :: Double
    , etapa :: Etapa
    }

descrever :: Atendimento -> String
descrever atendimento =
    cliente atendimento
    ++ " - " ++ servico atendimento
    ++ " - " ++ show (etapa atendimento)

concluir :: Atendimento -> Atendimento
concluir atendimento =
    atendimento { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
    sum (map valor
        (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
    let atendimento1 = Atendimento "Haku" "Banho termal" 50.0 NaFila
    let atendimento2 = Atendimento "Sem Rosto" "Massagem" 80.0 NoBanho
    let atendimento3 = Atendimento "Kamaji" "Banho especial" 100.0 NaFila

    let atendimentos =
            [atendimento1, atendimento2, atendimento3]

    let atendimentosNovos =
            [ concluir atendimento1
            , atendimento2
            , concluir atendimento3
            ]

    putStrLn "--- Atendimentos originais ---"
    mapM_ (putStrLn . descrever) atendimentos

    putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

    putStrLn "--- Novos atendimentos ---"
    mapM_ (putStrLn . descrever) atendimentosNovos

    putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentosNovos))
