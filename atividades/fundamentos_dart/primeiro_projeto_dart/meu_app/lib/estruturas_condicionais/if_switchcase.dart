
import 'dart:convert';
import 'dart:io';


void main(List<String> arguments) {

  var notaProva1 = 9;
  var notaProva2 = 9;
  var media = (notaProva1 + notaProva2 )/2;
  print(media);
  print(media>=7);
  print(media<7);
  print(notaProva1==notaProva2);

  //Condição IF
  print("#############################################################");
  print("----------------- Trabalhando com IF ----------------- ");
  print("#############################################################");

  if (media>=7){
    print("O aluno passou por media $media");
  } else if (media<3){
    print("O aluno reprovou por média! Sua média foi $media");
  } else{
    print("O aluno foi para o exame final. Sua média foi $media");
  }


  //Condição IF
  print("#############################################################");
  print("----------------- Trabalhando com IF ternário ----------------- ");
  print("#############################################################");


  var resultado = (notaProva1>=7) ? "o aluno passou" : "o aluno está na final";
  // if (notaProva1 >=7){
  //   resultado = "o aluno passou";
  // } else {
  //   resultado = "o aluno reprovou";
  // }
  print(resultado);

  //Lendo dados do console
  print("#############################################################");
  print("----------------- Lendo dados do console ----------------- ");
  print("#############################################################");

  print("Informe a Primeira Nota do aluno:");
  var line = stdin.readLineSync(encoding: utf8);
  // print(line);
  var notaInput1 = int.parse(line ?? "0");
  print("Informe a Segunda Nota do aluno:");
  var line2 = stdin.readLineSync(encoding: utf8);
  // print(line2);
  var notaInput2 = int.parse(line2==null ? "0":line2);
  //funciona melhor executando via terminal através do comando dart run

  var mediaInput = (notaInput1 + notaInput2 )/2;

  if (mediaInput>=7){
    print("O aluno passou por média $mediaInput");
  } else if (mediaInput<3){
    print("O aluno reprovou por média! Sua média foi $mediaInput");
  } else{
    print("O aluno foi para o exame final. Sua média foi $mediaInput");
  }
  //Switch case
  print("#############################################################");
  print("----------------- Trabalhando com switch-case ----------------- ");
  print("#############################################################");


  print("Bem vindo a nossa calculadora! \n\n");

  print("Informe o seu primeiro numero:");
  var entrada = stdin.readLineSync(encoding: utf8);
  var numero1 = double.parse(entrada ?? "0");

  print("Informe o seu segundo numero:");
  entrada = stdin.readLineSync(encoding: utf8);
  var numero2 = double.parse(entrada ?? "0");

  print("Informe a operação matemática (+, -, *, /):");
  entrada = stdin.readLineSync(encoding: utf8);
  var operacao = entrada ?? "";

  double resultadoCalc = 0;

  switch (operacao){
    case "+":
      resultadoCalc = numero1+numero2;
      break;
    case "-":
      resultadoCalc = numero1-numero2;
      break;
    case "*":
      resultadoCalc = numero1*numero2;
      break;
    case "/":
      resultadoCalc = numero1/numero2;
      break;
    default:
      print("Operação Inválida");
      exit(0); 
  }
  print("Operação solicitada: $operacao");
  print("O resultado da operação é: $resultadoCalc");

  

}
