using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        Nome = nome;
        Povo = povo;
        Posto = posto;
    }

    public void Equipar(string arma)
    {
        Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"Nome: {Nome}");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");

        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }

        Console.WriteLine();
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        CombatenteDeGondor c1 = new CombatenteDeGondor("Aragorn", "Homem", "Rei");
        CombatenteDeGondor c2 = new CombatenteDeGondor("Faramir", "Homem", "Capitao");
        CombatenteDeGondor c3 = new CombatenteDeGondor("Legolas", "Elfo", "Arqueiro");

        c1.Equipar("Espada");
        c3.Equipar("Arco");

        // c1.Posto = "Soldado"; // Erro: o set é privado

        c1.ApresentarUnidade();
        c2.ApresentarUnidade();
        c3.ApresentarUnidade();
    }
}
