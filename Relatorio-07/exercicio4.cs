using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        Nome = nome;
    }

    public virtual void Manifestar()
    {
        Console.WriteLine($"Entidade: {Nome}");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        Console.WriteLine($"{Nome} surgiu das profundezas do oceano!");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"{Nome} apareceu com suas asas!");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }

    private List<EntidadeCosmica> entidades;

    public Pesquisador(string nome)
    {
        Nome = nome;
        entidades = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica e)
    {
        entidades.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"Catalogo de {Nome}:");

        foreach (EntidadeCosmica e in entidades)
        {
            e.Manifestar();
            Console.WriteLine();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        EntidadeCosmica e1 = new EntidadeCosmica("Cthulhu");
        Profundo e2 = new Profundo("Dagon");
        MiGo e3 = new MiGo("Mi-Go");

        e1.Origem = "R'lyeh";
        e2.Origem = "Oceano";

        Pesquisador pesquisador = new Pesquisador("Henry");

        pesquisador.Catalogar(e1);
        pesquisador.Catalogar(e2);
        pesquisador.Catalogar(e3);

        pesquisador.LerCatalogo();
    }
}
