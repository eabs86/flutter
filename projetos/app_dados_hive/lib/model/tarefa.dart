import 'package:flutter/material.dart';

class Tarefa{
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao,this._concluido);

  String getId(){
    return _id;
  }

  //A função getId pode ser reescrita de outra forma:
  // String get id => _id;

  String getDescricao(){
    return _descricao;
  }

  //A função getDescricao pode ser reescrita de outra forma:
  // String get descricao => _descricao;

  void setDescricao(String descricao){
    _descricao = descricao;
  }
  //A função setDescricao pode ser reescrita de outra forma:
  // void set descricao(String descricao){
  //   _descricao = descricao;
  // }

  bool getConcluido(){
    return _concluido;
  }
  //A função getConcluido pode ser reescrita de outra forma:
  // bool get concluido => _concluido;

  void setConcluido(bool concluido){
    _concluido = concluido;
  }
  //A função setConcluido pode ser reescrita de outra forma:
  // void set concluido(bool concluido){
  //   _concluido = concluido;
  // }
  
}
