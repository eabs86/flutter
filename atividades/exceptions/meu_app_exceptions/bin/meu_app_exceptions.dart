import 'package:meu_app_exceptions/meu_app_exceptions.dart' as meu_app_ex;

// import 'dart:convert';
// import 'dart:io';

void main(List<String> arguments) {
  //------Exemplo básico com try-catch
  // print("Digite um número:");
  
  // var line = stdin.readLineSync(encoding: utf8);
  
  
  // try { //tente fazer alguma coisa
  //   double numero = double.parse(line ?? "") ;
  //   print(numero);
  // } catch (e) { //se não conseguir, faça isso
  //   print("Numero inválido: $line");
  // } finally{// por fim, faça isso; É executado independente se seu erro ou não.
  //   print("executando o finally");
  // }
  
  //----- Exemplo mais completo utilizando classes
  meu_app_ex.execute();
 
}
