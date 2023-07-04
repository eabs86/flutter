import 'package:hive/hive.dart';

part 'dados_cadastrais_model.g.dart';

@HiveType(typeId: 0) // id exclusivo da classe, para facilitar na sua localização.
class DadosCadastraisModel extends HiveObject{
  @HiveField(0)
  String? nome;

  @HiveField(1)
  DateTime? dataNascimento;

  @HiveField(2)
  String? nivelExperiencia;

  @HiveField(3)
  List<String> linguagens = [];

  @HiveField(4)
  int? tempoExperiencia;

  @HiveField(5)
  double? salario;

  DadosCadastraisModel(); //construtor 

  DadosCadastraisModel.vazio(){
    nome = "";
    dataNascimento = null;
    nivelExperiencia = "";
    linguagens = [];
    tempoExperiencia = 0;
  }
}