
class Pessoa {

  String _nome ="";
  double? _peso;
  double? _altura;

  Pessoa(String nome, double peso, double altura){
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

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

  double? getAltura(){
    return _altura;
  }

  double? getPeso(){
    return _peso;
  }

}