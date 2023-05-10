import 'package:meu_app_oo/service/notificacao_interface.dart';
import 'package:meu_app_oo/classes/pessoa_abstract.dart';

class NotificacaoEmail implements NotificacaoInterface{
  
  @override
  void enviarNotificacao(Pessoa pessoa){
    print("Enviando Email para ${pessoa.getNome()}");
  }

}