
import 'dart:convert';
import 'dart:io';

String lerConsole(String texto){
  print(texto);
    var line = stdin.readLineSync(encoding: utf8);
    return line ?? "";
}

double lerConsoleDouble(String texto){
  var numero = double.tryParse(lerConsole(texto));
  if (numero == null){
    print("Entradas em formato incorreto e/ou número incorreto. Alterando para 0");
    return 0.0;
  }else {
    return numero;
  }
  
}


double somaLista(List<double> numeros){
  double acumulador = 0;
  for (var numero in numeros){
    acumulador=soma(acumulador,numero);
  }
  return acumulador;
}


double soma(double numero1, double numero2){
  double resultado = numero1+numero2;

  return resultado;
}

double subtracao(double numero1, double numero2){
  double resultado = numero1-numero2;

  return resultado;
}

double multiplicacao(double numero1, double numero2){
  double resultado = numero1*numero2;

  return resultado;
}

double divisao(double numero1, double numero2){
  double resultado = numero1/numero2;
  if (numero2 == 0){
    print("Proibida a divisão por zero!");
    exit(0);

  } else{
    return resultado;
  }
}