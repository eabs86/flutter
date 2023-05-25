

class Pessoa {

  String _nome ="";
  double _peso = 0.0;
  double _altura = 0.0;

  setNome(String nome){
    _nome = nome;
  }

  setPeso(double peso){
    _peso = peso;
  }

  setAltura(double altura){
    _altura = altura;
  }
  
  String getNome(){
    return _nome;
  }

  double getAltura(){
    return _altura;
  }

  double getPeso(){
    return _peso;
  }

  double calculoIMC(double peso, double altura){
    return peso / (altura * altura);
  }


}