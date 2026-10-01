#include <iostream>
#include <string>
using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:
    void setNome(string n) {
        nome = n;
    }

    void setArcana(string a) {
        arcana = a;
    }

    void setRank(int r) {
        rank = r;
    }

    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    void subirRank() {
        rank++;
    }
};

int main() {
    string nome, arcana;
    int rank;

    cout << "Digite o nome do personagem: ";
    getline(cin, nome);

    cout << "Digite a arcana: ";
    getline(cin, arcana);

    cout << "Digite o rank inicial: ";
    cin >> rank;

    LinkSocial link;

    link.setNome(nome);
    link.setArcana(arcana);
    link.setRank(rank);

    cout << "\n--- ANTES DE SUBIR O RANK ---\n";
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    link.subirRank();

    cout << "\n--- DEPOIS DE SUBIR O RANK ---\n";
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    return 0;
}
