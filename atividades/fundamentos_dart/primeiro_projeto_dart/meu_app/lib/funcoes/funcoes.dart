
void main(List<String> arguments) {
  printHelloWorld();
  printName("Fulano");
  var numero = returnNumber();
  print(numero);

  var resultadoSoma = soma(1000, 99);
  print(resultadoSoma);

}

void printHelloWorld(){
  print("Hello World!");
}

void printName(String name){
  print("My name is: $name");
}

int returnNumber(){

  return 50;

}

int soma(int parcela1, int parcela2){
  var resultado = parcela1 + parcela2;

  return resultado;
}