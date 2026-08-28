print("--- TABELA DE POTENCIAS ---")

print("Digite o expoente inicial (M):")
local M = tonumber(io.read())

print("Digite o expoente final (N):")
local N = tonumber(io.read())

print("Digite a base:")
local base = tonumber(io.read())

function gerarTabelaPotencias(inicio, fim, base)
    for i = inicio, fim do
        print(base .. " ^ " .. i .. " = " .. base ^ i)
    end
end

gerarTabelaPotencias(M, N, base)
