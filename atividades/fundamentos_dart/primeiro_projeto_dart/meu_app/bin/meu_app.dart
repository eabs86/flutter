import 'package:meu_app/meu_app.dart' as meu_app;

void main(List<String> arguments) {
  print('Olá mundo!: ${meu_app.calculate()}!');
  
  // formas de declarar string
  String texto = "Meu texto";
  var texto2 = "meu texto 2";
  String texto3;

  // formas de declarar inteiros
  int numero1 = 1;
  var numero2 = 2;
  int numero3;

  //declarando listas
  List<String> lista = [];
  lista.add("A"); //só irei conseguir adicionar string a "lista"
  var lista1=[]; //exemplo de lista dinâmica. Consigo adicionar diferentes tipos
  lista1.add(1);
  lista1.add("A");
  lista1.add(1.2);

  // Trabalhando com inteiros

  int numero_1 = 10;
  var numero_2 = 15;
  print("#############################################################");
  print("----------------- Trabalhando com Inteiros ----------------- ");
  print("#############################################################");
  print("Retorna true se o número for par");
  print(numero_1.isEven);
  print(numero_2.isEven);

  print("Retorna true se o número for ímpar");
  print(numero_1.isOdd);
  print(numero_2.isOdd);

  print("Retorna true se o número é finito");
  print(numero_1.isFinite);

  print("Retorna true se o número é infinito");
  print(double.infinity);

  print("Retorna true se o número é válido");
  print(numero_1.isNaN);

  print("Retorna true se o número é negativo");
  print((numero_1 *-1).isNegative);
  print((numero_1 *1).isNegative);

  print("Converte um tipo String para inteiro");
  print(int.parse("10"));
  print("Se ele não conseguir converter, ele imprime null");
  print(int.tryParse("teste")); //se ele não conseguir converter, ele imprime null

  //Dados do tipo double

  double numero_1d = 10.5;
  var numero_2d = 11.5;
  print("#############################################################");
  print("----------------- Trabalhando com Double ----------------- ");
  print("#############################################################");
  print("Remove ponto flutuante");
  print(numero_1d.truncate());
  print("Converte para inteiro");
  print(numero_2d.toInt());
  print("Arredonda para cima");
  print(numero_2d.ceil());
  print("Arredonda para baixo");
  print(numero_1d.floor());
  print("Retorna se o número é infinito");
  print(numero_1d.isInfinite);
  print("Retorna se o número é finito");
  print(numero_1d.isFinite);
  print("Retorna true se o número é válido");
  print(numero_1d.isNaN);
  print("Retorna true se o número é negativo");
  print((numero_1d *-1).isNegative);
  print((numero_1d *1).isNegative);
  print("Converte um tipo String para inteiro");
  print(double.parse("10.5"));

  // Trabalhando com strings
  print("#############################################################");
  print("----------------- Trabalhando com Strings ----------------- ");
  print("#############################################################");

  String texto_1 = "Texto 1";
  var texto_2 = "tipo de String longa";

  //Comparação se vazio
  print(texto_2.isEmpty);
  print("".isEmpty);
  print(" ".isEmpty);

  //Tamanho
  print(texto_2.length);

  // Maiuscula / minúscula
  print(texto_1.toUpperCase());
  print(texto_2.toLowerCase());

  // Se uma string está contida na outra
  print(texto_2.contains(texto_1));

  //quebra de string (ou substring)
  print(texto_2.substring(5)); // começa do 5º caracter e vai até o final
  print(texto_2.substring(1,6)); //começa na 1 e para na 6. Lembrando que o índice começa em 0 (zero)
  
  // Obtem a posição de um texto em uma string
  print(texto_2.indexOf("longa")); //a posição onde começa a palavra "longa"
  print(texto_1.indexOf("x"));
  print(texto_2.indexOf("#")); //retorna -1 quando não encontra

  // substituir string em outra
  print(texto_2.replaceAll("n", "nnnnn"));

  //quebrar string por um caracter específico
  print(texto_2.split("n"));
  print("NOME;ENDERECO;CEP;CIDADE".split(";"));

  //remoção de espaços
  print("   teste   ".trim()); //apaga todos os espaços
  print("   teste   ".trimRight()); //apaga apenas na direita
  print("   teste   ".trimLeft()); //apaga apenas na esquerda

    // Trabalhando com booleans
  print("#############################################################");
  print("----------------- Trabalhando com Boolean ----------------- ");
  print("#############################################################");

  var varTrue = true;
  bool varFalse = false; //por padrão a variável booleana é falsa
  print(varTrue);
  print(varFalse);
  print(!varTrue);
  print(!varFalse);
   // Trabalhando com Listas
  print("#############################################################");
  print("----------------- Trabalhando com Listas ----------------- ");
  print("#############################################################");

}
