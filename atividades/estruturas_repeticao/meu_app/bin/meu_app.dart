
import 'dart:convert';
import 'dart:io';
void main(List<String> arguments) {
    //Laço de repetição For
  print("#############################################################");
  print("----------------- Trabalhando com laço For ----------------- ");
  print("#############################################################");

  var count = 99;
  
  for (var i = 0; i < count; i++) {
    print(i);
  }

  var texto = "meu primeiro bloco for";
  for (var i=0; i<texto.length;i++){
    print(texto[i]);
  }

  var listaNomes = ["Fulano","Ciclano","Beltrano"];
  for (var i=0; i<listaNomes.length;i++){
    print(listaNomes[i]);
  }

  var resultado = 0;
  var quantidade =0;
  print("Informe a quantidade de numeros:"); 
  var line = stdin.readLineSync(encoding: utf8);
  quantidade = int.parse(line ?? "0");
  for (var i =0; i<quantidade;i++){
    print("informe o número");
    line = stdin.readLineSync(encoding: utf8);
    var numero = int.parse(line ?? "0");
    resultado = resultado + numero;
    print("$i - $resultado");
  }

  print("#############################################################");
  print("------------- Trabalhando com for each e for in------------- ");
  print("#############################################################");  
  var numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; //funciona com letas, caracteres, etc.

  for (var numero in numeros){
    print(numero);
  }

  var letras = ["A","B","C","D"];
  for (var letra in letras){
    print(letra);
  }
  letras.forEach((element) {print(element); });
  print("#############################################################");
  print("------------- Trabalhando com while e do-while------------- ");
  print("#############################################################");  

  var contador = 0;
  var total = 10;
  //cuidado com o loop infinito!
  while(contador<total){
    contador=contador+1;
    print(contador);
  }
  print("Digite um número ou 'S' para sair:");

  line = stdin.readLineSync(encoding: utf8);
  double acc = 0;

  while(line!="S"){
    var numeroAcc = double.parse(line ?? "");
    acc = acc + numeroAcc;
    print("Digite um número ou 'S' para sair:");
    line = stdin.readLineSync(encoding: utf8);
  }
  print(acc);

  var opcao = "";
  var accDo = 0.0;
  do {
    print("Digite um número ou 'S' para sair:");
    line = stdin.readLineSync(encoding: utf8);
    opcao = line ?? "";
    var numeroDo = double.tryParse(opcao);
    if(numeroDo!=null){
      accDo = accDo + numeroDo;
    }
  } while (opcao !="S");
  print(accDo);

}
