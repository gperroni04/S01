import java.util.ArrayList;

class ItemDoCardapio {
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

class ComboLeblanc extends ItemDoCardapio {

    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

class CafeLeblanc {
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        for (ItemDoCardapio item : cardapio) {
            System.out.println(item.getNome() + " - R$ " +
                String.format("%.2f", item.precoFinal()));
        }
    }
}

public class Main {
    public static void main(String[] args) {
        ItemDoCardapio cafe = new ItemDoCardapio("Cafe", 8.00);
        ItemDoCardapio curry = new ItemDoCardapio("Curry", 25.00);
        ComboLeblanc combo = new ComboLeblanc("Combo Leblanc", 30.00);

        CafeLeblanc restaurante = new CafeLeblanc();

        restaurante.adicionar(cafe);
        restaurante.adicionar(curry);
        restaurante.adicionar(combo);

        restaurante.mostrarCardapio();
    }
}
