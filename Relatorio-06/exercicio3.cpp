#include <iostream>
#include <string>
using namespace std;

class MembroInatel {
protected:
    string nome;

public:
    MembroInatel(string n) {
        nome = n;
    }

    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }

    virtual ~MembroInatel() {}
};

class Aluno : public MembroInatel {
private:
    string curso;

public:
    Aluno(string n, string c) : MembroInatel(n) {
        curso = c;
    }

    void seApresentar() override {
        cout << "Meu nome é " << nome
             << " e estudo no curso de " << curso << "." << endl;
    }
};

class Professor : public MembroInatel {
private:
    string disciplina;

public:
    Professor(string n, string d) : MembroInatel(n) {
        disciplina = d;
    }

    void seApresentar() override {
        cout << "Meu nome é " << nome
             << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main() {
    string nomeAluno, curso;
    string nomeProfessor, disciplina;

    cout << "Digite o nome do aluno: ";
    getline(cin, nomeAluno);

    cout << "Digite o curso do aluno: ";
    getline(cin, curso);

    cout << "\nDigite o nome do professor: ";
    getline(cin, nomeProfessor);

    cout << "Digite a disciplina do professor: ";
    getline(cin, disciplina);

    Aluno aluno(nomeAluno, curso);
    Professor professor(nomeProfessor, disciplina);

    cout << "\n--- APRESENTAÇÕES ---\n";

    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}
