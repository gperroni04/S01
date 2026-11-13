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
    ++ " - Servico: " ++ servico atendimento
    ++ " - Valor: R$ " ++ show (valor atendimento)
    ++ " - Etapa: " ++ show (etapa atendimento)

concluir :: Atendimento -> Atendimento
concluir atendimento =
  atendimento { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor
    (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let atendimento1 =
        Atendimento "Haku" "Banho termal" 50.0 NaFila

  let atendimento2 =
        Atendimento "Sem Rosto" "Banho especial" 80.0 NoBanho

  let atendimento3 =
        Atendimento "Yubaba" "Tratamento especial" 100.0 NaFila

  let atendimentos =
        [atendimento1, atendimento2, atendimento3]

  let novosAtendimentos =
        [ concluir atendimento1
        , atendimento2
        , concluir atendimento3
        ]

  putStrLn "--- Atendimentos originais ---"
  mapM_ (putStrLn . descrever) atendimentos

  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

  putStrLn "--- Novos atendimentos ---"
  mapM_ (putStrLn . descrever) novosAtendimentos

  putStrLn ("Arrecadado: R$ " ++ show (arrecadado novosAtendimentos))

  putStrLn "--- Conferindo a lista original ---"
  mapM_ (putStrLn . descrever) atendimentos
