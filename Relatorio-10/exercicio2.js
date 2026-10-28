class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error('O agente deve implementar sua habilidade.');
    }

    entrarEmCombate() {
        console.log(`${this.codinome} entrou em combate com ${this.#pistola.modelo}. ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Usou uma fumaça para bloquear a visão inimiga.';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Usou uma habilidade para revelar os inimigos.';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Avançou para atacar os inimigos.';
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`Esquadrão ${this.nome} iniciou a partida!`);

        this.#agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}

const omen = new Controlador('Omen', 'Ghost');
const brimstone = new Controlador('Brimstone', 'Classic');
const sova = new Iniciador('Sova', 'Sheriff');
const jett = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Alpha', [omen, brimstone, sova, jett]);

esquadrao.iniciarPartida();

console.log('\nControladores do esquadrão:');
esquadrao.listarControladores().forEach(agente => {
    console.log(agente.codinome);
});

const agenteBase = new AgenteProtocolo('Agente Base', 'Classic');

// agenteBase.entrarEmCombate();
