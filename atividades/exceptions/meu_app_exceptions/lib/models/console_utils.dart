import 'dart:convert';
import 'dart:io';

class ConsoleUtils{
  
  static String lerStringComTexto(String texto){
    print(texto);
    return stdin.readLineSync(encoding: utf8) ?? ""; //garantir que a string não esteja vazia
  }
 
  static String lerString(){
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble(){
    var value = lerString();
    try{
      return double.parse(value);
    } catch(e){
      return null;
    }
  }
    
  static double? lerDoubleComTexto(String texto){
    print(texto);
    return lerDouble();
  }

  static double? lerDoubleComTextoComSaida(String texto, String valorSaida){

    do {
      try {
        var value = lerStringComTexto(texto);
        if(value==valorSaida){
          return null;
        }
        return double.parse(value);
      } catch (e) {
        print(texto);
      }
    } while (true);
  }

}