import 'package:meu_app_exceptions/exception/nome_invalido_exception.dart';
import 'package:meu_app_exceptions/models/aluno.dart';
import 'package:meu_app_exceptions/models/console_utils.dart';

void execute(){
  print("Bem vindo ao sistema de notas!");

  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno:");
  // observação: por que é possivel acessar o métodod lerStringComTexto sem instanciar
  // o ConsoleUtils?
  // Por que o método é estático. Quando ele é estático, nós conseguimos acessá-lo diretamente
  // sem criar a instance do ConsoleUtils.

  if (nome.trim()==""){
    throw NomeInvalidoException();
  }

  var aluno = Aluno(nome);
  double? nota;
  
  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida("Digite a nota do aluno ou S para sair:","S");
    if(nota!=null){
      aluno.adiocionarNota(nota);
    }
  } while ( nota != null);
  print("As notas digitadas foram: ${aluno.getNotas()}");
  if (aluno.aprovado(7)){
      print("O aluno ${aluno.getNome()} foi aprovado com média ${aluno.retornaMedia()}");
  }else{print("O aluno ${aluno.getNome()} está na final!");}

}