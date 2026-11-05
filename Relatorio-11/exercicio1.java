abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("Sou " + getNome() + ", um mago que usa o feitico " + feitico + ".");
    }
}

class DemonioDoFogo extends Morador {

    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Sou " + getNome() + " e faco o castelo andar!");
    }
}

public class Main {
    public static void main(String[] args) {
        Morador mago = new Mago("Howl", "Magia das Sombras");
        Morador demonio = new DemonioDoFogo("Calcifer");

        mago.apresentar();
        demonio.apresentar();

        // Morador morador = new Morador("Teste");
    }
}
