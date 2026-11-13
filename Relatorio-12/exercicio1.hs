data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) =
  nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido pediuLeite (Cafe _ preco _) =
  if pediuLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let cafe1 = Cafe "Cafe Expresso" 8.50 9
  let cafe2 = Cafe "Cafe Latte" 10.00 6
  let cafe3 = Cafe "Cafe Suave" 7.00 3

  putStrLn "--- Cafes do Leblanc ---"
  putStrLn (descrever cafe1 ++ " - " ++ forca cafe1)
  putStrLn (descrever cafe2 ++ " - " ++ forca cafe2)
  putStrLn (descrever cafe3 ++ " - " ++ forca cafe3)

  putStrLn "--- Preco dos pedidos ---"
  print (precoDoPedido True cafe1)
  print (precoDoPedido False cafe1)
