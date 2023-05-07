

void main() {
  printData("Utilizando a função arrow para printar esta frase.");
  printData(somaArrow(1, 2).toString()); //necessário converter para string, pois a função printData so aceita string.
}

void printData(String texto) => print(texto);

int somaArrow(int numero1, int numero2) => numero1 + numero2; //nem sempre é necessário tipar a função ou os parametros.