class HeroiOverwatch:
    def __init__(self, codinome, funcao):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} usou sua suprema!")


class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} usou sua suprema de tanque!")


class HeroiSuporte(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} usou sua suprema de suporte!")

    def curar_equipe(self):
        print(f"{self.codinome} está curando a equipe!")


if __name__ == "__main__":
    herois: list[HeroiOverwatch] = [
        HeroiOverwatch("Soldado 76", "Dano"),
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Mercy", "Suporte")
    ]

    for heroi in herois:
        heroi.usar_suprema()

        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
