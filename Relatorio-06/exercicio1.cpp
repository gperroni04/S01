#include <iostream>
#include <string>
using namespace std;

class Banda {
private:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

public:
    Banda(string n, int i, float p, int e) {
        nome = n;
        integrantes = i;
        potenciaSom = p;
        energia = e;
    }

    void duelar(Banda &rival) {
        cout << nome << " está duelando contra " << rival.nome << "!" << endl;

        rival.energia -= potenciaSom;

        if (rival.energia < 0) {
            rival.energia = 0;
        }
    }

    void mostrarStatus() {
        cout << "Banda: " << nome << endl;
        cout << "Integrantes: " << integrantes << endl;
        cout << "Potência de som: " << potenciaSom << endl;
        cout << "Energia da plateia: " << energia << endl;
        cout << "------------------------" << endl;
    }
};

int main() {
    string nome1, nome2;
    int integrantes1, integrantes2;
    float potencia1, potencia2;
    int energia1, energia2;

    cout << "Digite o nome da primeira banda: ";
    getline(cin, nome1);

    cout << "Digite a quantidade de integrantes: ";
    cin >> integrantes1;

    cout << "Digite a potência de som: ";
    cin >> potencia1;

    cout << "Digite a energia da plateia: ";
    cin >> energia1;

    cin.ignore();

    cout << "\nDigite o nome da segunda banda: ";
    getline(cin, nome2);

    cout << "Digite a quantidade de integrantes: ";
    cin >> integrantes2;

    cout << "Digite a potência de som: ";
    cin >> potencia2;

    cout << "Digite a energia da plateia: ";
    cin >> energia2;

    Banda banda1(nome1, integrantes1, potencia1, energia1);
    Banda banda2(nome2, integrantes2, potencia2, energia2);

    cout << "\n--- STATUS INICIAL ---\n";
    banda1.mostrarStatus();
    banda2.mostrarStatus();

    cout << "\n--- DUELO ---\n";
    banda1.duelar(banda2);

    cout << "\n--- STATUS FINAL ---\n";
    banda1.mostrarStatus();
    banda2.mostrarStatus();

    return 0;
}
