class Aluno{

  String _nome = "";
  final List<double> _notas = [];
  //variável do tipo final é que só pode ser setada uma única vez

  //nome do aluno será obtido via construtor
  Aluno(String nome){
    _nome = nome;

  }

  void setNome(String nome){
    _nome = nome;
  }

  String getNome(){
    return _nome;
  }

  List<double> getNotas(){
    return _notas;
  }

  void adiocionarNota(double nota){
    _notas.add(nota);
  }

  double retornaMedia(){
    var totalNotas = 0.0;
    for (var nota in _notas){
      totalNotas = totalNotas + nota;
    }
    var media = totalNotas/ _notas.length;
    return media.isNaN ? 0.0 : media;
  }

  bool aprovado( double notaCorte){
    var media = retornaMedia();
    return media >= notaCorte;
  
  }
}