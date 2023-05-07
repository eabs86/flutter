 

import 'dart:io';
import 'package:meu_app/funcoes/utils.dart' as utils;

void main() {
 
 print("Bem vindo a nossa calculadora! \n\n");

  var numero1 = utils.lerConsoleDouble("Informe o seu primeiro numero:");

  var numero2 = utils.lerConsoleDouble("Informe o seu segundo numero:");

  var operacao = utils.lerConsole("Informe a operação matemática (+, -, *, /):");

  calcular(operacao, numero1, numero2);
}




void calcular(String operacao, double numero1, double numero2){
    double resultadoCalc = 0;
    switch (operacao){
    case "+":
      resultadoCalc = utils.soma(numero1, numero2);
      break;
    case "-":
      resultadoCalc = utils.subtracao(numero1, numero2);
      break;
    case "*":
      resultadoCalc = utils.multiplicacao(numero1, numero2);
      break;
    case "/":
      resultadoCalc = utils.divisao(numero1, numero2);
      break;
    default:
      print("Operação Inválida");
      exit(0); 
  }
  print("Operação solicitada: $operacao");
  print("O resultado da operação é: $resultadoCalc");
  
}
