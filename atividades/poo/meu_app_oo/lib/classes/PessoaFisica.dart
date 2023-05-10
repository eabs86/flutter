import 'package:meu_app_oo/classes/Pessoa.dart';

class PessoaFisica {
  
  // criação de propriedade. Elas não podem ficar expostas. Ou seja, precisam de encapsulamento
  String _nome = "";
  String _endereco = "";
  String _cpf = "";


  //criação dos metodos get e set
  void setNome(String nome){
    _nome = nome;
  }

  void setEndereco(String endereco){
    _endereco = endereco;
  }

  void setCpf(String cpf){
    _cpf = cpf;
  }


  String getNome(){
    return _nome;
  }
  String getEndereco(){
    return _endereco;
  }

  String getCpf(){
    return _cpf;
  }

  //construindo um constrututor
  PessoaFisica(String nome, String endereco, String cpf){
    _nome = nome;
    _endereco=endereco;
    _cpf = cpf;
  }

  //sobrescrever usando o @override
  @override
  String toString(){
    return{"tipo":"PF", "nome":_nome, "endereco":_endereco, "cpf":_cpf}.toString();
  }
}