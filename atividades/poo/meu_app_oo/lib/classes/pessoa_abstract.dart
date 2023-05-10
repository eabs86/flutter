

import '../enum/tipo_notificacao.dart';

abstract class Pessoa {
  
  // criação de propriedade. Elas não podem ficar expostas. Ou seja, precisam de encapsulamento
  String _nome = "";
  String _endereco = "";
  String _email = "";
  String _celular = "";
  String _token = "";

  TipoNotificacao _tipoNotificacao = TipoNotificacao.NENHUM;

  //criação dos metodos get e set

  //Metodos set

  void setNome(String nome){
    _nome = nome;
  }

  void setEndereco(String endereco){
    _endereco = endereco;
  }

    void setTipoNotificacao(TipoNotificacao tipoNotificacao){
    _tipoNotificacao = tipoNotificacao;
  }

  void setEmail(String email){
    _email = email;
  }

  void setCelular(String celular){
    _celular = celular;
  }

  void setToken(String token){
    _token = token;
  }

  // Metodos get

  String getNome(){
    return _nome;
  }
  String getEndereco(){
    return _endereco;
  }

  TipoNotificacao getTipoNotificacao(){
    return _tipoNotificacao;
  }

  String getEmail(){
    return _email;
  }

  String getCelular(){
    return _celular;
  }

  String getToken(){
    return _token;
  }

  //construindo um constrututor
  Pessoa(String nome, String endereco, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM}){
    _nome = nome;
    _endereco=endereco;
    _tipoNotificacao = tipoNotificacao;
  }

  //sobrescrever usando o @override
  @override
  String toString(){
    return{"nome":_nome, "endereco":_endereco,"TipoNotificacao":_tipoNotificacao}.toString();
  }
}