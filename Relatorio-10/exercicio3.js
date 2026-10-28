class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} - Nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`Diário Misterioso número ${this.numero}`);

        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\nCabana do Mistério - Dono: ${this.dono}`);

        this.#funcionarios.forEach(funcionario => {
            console.log(`${funcionario.nome} - ${funcionario.cargo}`);
        });
    }
}

// Composição: as fichas são criadas dentro do diário.
const diario = new DiarioMisterioso(3);

diario.anotar('Gnomo', 'Baixo');
diario.anotar('Monstro do Lago', 'Alto');
diario.anotar('Bill Cipher', 'Extremo');

diario.exibirFichas();

// Agregação: os funcionários existem antes da cabana.
const dipper = new Funcionario('Dipper', 'Investigador');
const mabel = new Funcionario('Mabel', 'Atendente');

const cabana = new CabanaDoMisterio('Stan');

cabana.contratar(dipper);
cabana.contratar(mabel);

cabana.abrirAsPortas();
