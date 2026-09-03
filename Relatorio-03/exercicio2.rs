use std::io;

// Funcao que verifica se o palpite esta a no maximo 5 unidades do numero secreto
fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    (palpite - numero_secreto).abs() <= 5
}

fn main() {
    let numero_secreto: i32 = 42;

    loop {
        let mut entrada = String::new();

        println!("Digite seu palpite:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        let palpite: i32 = entrada.trim().parse().unwrap_or(0);

        if acertou_o_alvo(palpite, numero_secreto) {
            let distancia = (palpite - numero_secreto).abs();

            println!("Parabens, voce acertou o alvo!");
            println!(
                "Voce ficou a apenas {} unidade(s) do numero secreto ({}).",
                distancia, numero_secreto
            );

            break;
        } else {
            println!("Voce passou longe! Tente novamente.");
        }
    }
}
