package main

import (
	"fmt"
)

func gerarEscalaPlantao(n int) {
	fmt.Println("--- Escala de Plantão Técnico ---")

	for i := 1; i <= n; i++ {
		dia := 1 + (i-1)*4
		fmt.Printf("Plantão %d: Dia %d do mês\n", i, dia)
	}
}

func main() {
	var quantidade int

	fmt.Print("Digite a quantidade de plantões necessários: ")
	fmt.Scanln(&quantidade)

	gerarEscalaPlantao(quantidade)
}
