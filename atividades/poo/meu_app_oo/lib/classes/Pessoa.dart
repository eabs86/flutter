class Pessoa {
  
  // criação de propriedade. Elas não podem ficar expostas. Ou seja, precisam de encapsulamento
  String _nome = "";
  String _endereco = "";

  //criação dos metodos get e set
  void setNome(String nome){
    _nome = nome;
  }

  void setEndereco(String endereco){
    _endereco = endereco;
  }

  String getNome(){
    return _nome;
  }
  String getEndereco(){
    return _endereco;
  }

  //construindo um constrututor
  Pessoa(String nome, String endereco){
    _nome = nome;
    _endereco=endereco;
  }

  //sobrescrever usando o @override
  @override
  String toString(){
    return{"nome":_nome, "endereco":_endereco}.toString();
  }
}