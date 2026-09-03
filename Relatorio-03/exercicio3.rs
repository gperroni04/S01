use std::io;

// Funcao que imprime os numeros que terminam com o digito informado
fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    for numero in limite_inferior..=limite_superior {
        if numero % 10 == digito {
            println!("{}", numero);
        }
    }
}

fn main() {
    let mut entrada = String::new();

    println!("Digite o digito final desejado (0 a 9):");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler");
    let digito: i32 = entrada.trim().parse().unwrap_or(0);

    entrada.clear();

    println!("Digite o limite inferior:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler");
    let limite_inferior: i32 = entrada.trim().parse().unwrap_or(0);

    entrada.clear();

    println!("Digite o limite superior:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler");
    let limite_superior: i32 = entrada.trim().parse().unwrap_or(0);

    println!("--- Numeros no intervalo terminados em {} ---", digito);

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
