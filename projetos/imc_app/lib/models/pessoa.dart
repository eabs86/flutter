

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

  double calculoIMC(){
    double imc = _peso! / (_altura! * _altura!);
    return imc;
  }

  String classificacaoIMC(double imc){
    if(imc < 18.5){
      return "Abaixo do peso";
    }
    else if(imc >= 18.5 && imc <= 24.9){
      return "Peso normal";
    }
    else if(imc >= 25 && imc <= 29.9){
      return "Sobrepeso";
    }
    else if(imc >= 30 && imc <= 34.9){
      return "Obesidade grau 1";
    }
    else if(imc >= 35 && imc <= 39.9){
      return "Obesidade grau 2";
    }
    else{
      return "Obesidade grau 3";
    }
  }


}