using System;
using System.Collections.Generic;

public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine($"Feitico favorito: {FeiticoFavorito}");
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public Companheiro(string nome, string funcao)
    {
        Nome = nome;
        Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"{Nome} - {Funcao}");
    }
}

public class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; set; }

    private List<Companheiro> companheiros;

    public Maga(string nome)
    {
        Nome = nome;

        // Composicao: o grimorio é criado junto com a maga.
        Grimorio = new Grimorio();

        companheiros = new List<Companheiro>();
    }

    public void Recrutar(Companheiro c)
    {
        // Agregacao: o companheiro ja existe antes de entrar no grupo.
        companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"Grupo de {Nome}:");

        foreach (Companheiro c in companheiros)
        {
            c.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Companheiro c1 = new Companheiro("Fern", "Maga");
        Companheiro c2 = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(c1);
        frieren.Recrutar(c2);

        frieren.Grimorio.FeiticoFavorito = "Zoltraak";

        frieren.MostrarGrupo();
        frieren.Grimorio.Abrir();
    }
}
