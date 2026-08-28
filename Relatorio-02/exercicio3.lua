print("--- FILTRO DE NUMEROS ---")

print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())

local tabela = {}

for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    tabela[i] = tonumber(io.read())
end

print("Digite o valor limite (K):")
local K = tonumber(io.read())

function filtrarMaiores(tabela, limite)
    local novaTabela = {}

    for i = 1, #tabela do
        if tabela[i] > limite then
            table.insert(novaTabela, tabela[i])
        end
    end

    return novaTabela
end

local resultado = filtrarMaiores(tabela, K)

print("--- Elementos maiores que " .. K .. " ---")

for i = 1, #resultado do
    print(resultado[i])
end
