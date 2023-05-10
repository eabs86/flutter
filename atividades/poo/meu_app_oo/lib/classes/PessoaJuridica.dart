import 'package:meu_app_oo/classes/Pessoa.dart';

class PessoaJuridica {
  
  // criação de propriedade. Elas não podem ficar expostas. Ou seja, precisam de encapsulamento
  String _nome = "";
  String _endereco = "";
  String _cnpj = "";


  //criação dos metodos get e set
  void setNome(String nome){
    _nome = nome;
  }

  void setEndereco(String endereco){
    _endereco = endereco;
  }

  void setCnpj(String cnpj){
    _cnpj = cnpj;
  }


  String getNome(){
    return _nome;
  }
  String getEndereco(){
    return _endereco;
  }

  String getCnpj(){
    return _cnpj;
  }

  //construindo um constrututor
  PessoaJuridica(String nome, String endereco, String cnpj){
    _nome = nome;
    _endereco=endereco;
    _cnpj = cnpj;
  }

  //sobrescrever usando o @override
  @override
  String toString(){
    return{"tipo":"PJ", "nome":_nome, "endereco":_endereco, "cnpj":_cnpj}.toString();
  }
}