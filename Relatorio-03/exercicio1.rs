use std::io;

// Funcao que recebe uma placa e retorna um booleano
fn validar_placa(placa: &str) -> bool {
    let quantidade_caracteres = placa.len();

    let quantidade_maiusculas = placa
        .chars()
        .filter(|c| c.is_ascii_uppercase())
        .count();

    let quantidade_numeros = placa
        .chars()
        .filter(|c| c.is_numeric())
        .count();

    quantidade_caracteres >= 7
        && quantidade_maiusculas >= 4
        && quantidade_numeros >= 2
}

fn main() {
    loop {
        let mut placa = String::new();

        println!("Digite a placa do veiculo:");
        io::stdin().read_line(&mut placa).expect("Erro ao ler");

        let placa = placa.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
