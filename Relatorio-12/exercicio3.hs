data Esboco = Esboco
  { titulo :: String
  , tecnica :: String
  , horas :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio."
esbocoMaisRecente (e:_) =
  titulo e ++ " - Tecnica: " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) =
  horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco "Castelo sombrio" "Nanquim" 4
        , Esboco "Criatura da floresta" "Grafite" 2
        , Esboco "Paisagem noturna" "Carvao" 3
        ]

  putStrLn "--- Caderno original ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Total de horas: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])

  let novoEsboco = Esboco "Ruinas antigas" "Aquarela" 5
  let novoCaderno = novoEsboco : caderno

  putStrLn "--- Comparacao dos cadernos ---"
  putStrLn ("Caderno original: " ++ esbocoMaisRecente caderno)
  putStrLn ("Quantidade original: " ++ show (contarEsbocos caderno))
  putStrLn ("Novo caderno: " ++ esbocoMaisRecente novoCaderno)
  putStrLn ("Quantidade novo: " ++ show (contarEsbocos novoCaderno))
