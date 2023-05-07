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

  List<String> lstString = [];
  var lstInt = [1, 10, 20];
  List lstDynamic = []; //aceitas vários tipos, porque é uma lista dinâmica.
  // para lista tipada eu não vou conseguir adicionar outros tipos.

  print("Tamanho da Lista");
  print(lstString.length);
  print(lstInt.length);
  print(lstDynamic.length);
  print("Conteudo das listas");
  print(lstString);
  print(lstInt);
  print(lstDynamic);
  print("Adicionar item");
  lstString.add("M");
  lstString.add("B");
  lstInt.add(30);
  lstDynamic.add(10);
  lstDynamic.add(9.5);
  lstDynamic.add(true);
  print("Listas com novos conteudos adicionados");
  print(lstString);
  print(lstInt);
  print(lstDynamic);
    print("Remover item");
  lstString.remove("M");
  lstInt.remove(10);
  lstDynamic.remove(9.5);
  print("Listas com novos conteudos");
  print(lstString);
  print(lstInt);
  print(lstDynamic);
  print("Verifica se a lista está vazia ou não");
  print(lstString.isEmpty);
  print(lstInt.isNotEmpty);
  print("Verifica se um valor contém na lista");
  print(lstString.contains("B"));
  print(lstDynamic.contains(true));
  print("Funcao where");
  print(lstInt);
  print(lstInt.where((x) => x > 9 && x < 99));
  print("outras funcoes");
  print(lstInt.reversed);

  // trabalhando com dados map
  print("#############################################################");
  print("----------------- Trabalhando com tipos Dados Map ----------------- ");
  print("#############################################################");

  //onde é posivel armazena valores chave:valor.
  Map<String, dynamic> map1 = <String,dynamic>{};
  var map = {'zero':0, 'one':1, 'two':2};

  print(map1);
  print(map);

  print("Obtem valor de chave");
  print(map["one"]);

  map.addAll({'ten':10, 'eleven':11});
  print(map);

  print("verifica se está vazio");
  print(map.isEmpty);
  print(map.isNotEmpty);

  print("Tamanho");
  print(map.length);

  print("Contem chave");
  print(map.containsKey("eleven"));
  print(map.containsKey("twelve"));

  //simulando um cadastro
  map1.addAll({"nome": "Fulano"});
  map1.addAll({"idade": 20});
  map1.addAll({"casado": true});
  map1.addAll({"nascimento": DateTime(1990,01,01)});

  print(map1);
  print(map1["idade"]);

  // trabalhando com dados constantes
  print("#############################################################");
  print("----------------- Trabalhando com tipos Dados constantes ----------------- ");
  print("#############################################################");

  const String constante = "ABC";
  //valor de constante é imutável ao longo do programa.
  print(constante);

 // trabalhando com dados dinâmicos
  print("#############################################################");
  print("----------------- Trabalhando com tipos Dados dinâmicos ----------------- ");
  print("#############################################################");

  dynamic variavel1 = "ABC";

  print(variavel1);
  variavel1 = 10;
  print(variavel1);
  variavel1 = 9.5;
  print(variavel1);
  variavel1 = true;
  print(variavel1);
  variavel1 = DateTime(2023,07,05);
  print(variavel1);
  variavel1 = [10, true, "A"];
  print(variavel1);
  //problema do dynamic é que ele não traz as propriedades em autocomplete do elemento que ele está setado.
  //É preciso saber se o tipo tem determnada propriedade e método
  //Se for utilizar o dynamic, saiba o que está fazendo!! Usar com moderação.

 // trabalhando com dados Datetime
  print("#############################################################");
  print("----------------- Trabalhando com tipos Dados Datetime ----------------- ");
  print("#############################################################");

  DateTime data = DateTime.now();
  data = DateTime.parse("2022-02-01 11:28:57");

  //Partes das data
  print(data);
  print(data.day);
  print(data.month);
  print(data.year);
  print(data.weekday); //foi uma terça feira = 2

  //Soma de datas
  print(data);
  print(data.add(Duration(days:1)));
  print(data);
  print(data.subtract(Duration(hours: 1)));
  print(data);

  var data2 = DateTime.parse("2022-02-01 00:00:00");
  print(data.isAfter(data2));
  print(data.isBefore(data2));
  print(data.compareTo(data2));
}
