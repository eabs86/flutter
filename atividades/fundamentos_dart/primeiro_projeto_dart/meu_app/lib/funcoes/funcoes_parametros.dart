import 'package:meu_app/funcoes/utils.dart' as utils;


void main() {
  printName("Fulano");
  printName("Ciclano", sobrenome: "Beltrano");
  
}

void printName(String name, {String? sobrenome}){  //parametro opcional entra entre chaves { } no argumento da função. Isso facilita na hora da refatoração.
  print("My name is: $name");
  if (sobrenome != null) {
    print("My lastname is: $sobrenome");
  }
}