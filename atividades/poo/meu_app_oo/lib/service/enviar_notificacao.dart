// aqui estamos criando uma interface, onde passará as diretivas entre as classes e os metodos

import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';
import 'package:meu_app_oo/service/impl/notificacao_email.dart';
import 'package:meu_app_oo/service/impl/notificacao_push.dart';
import 'package:meu_app_oo/service/impl/notificacao_sms.dart';
import 'package:meu_app_oo/service/notificacao_interface.dart';

class EnviarNotificacao{
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa){
    switch(pessoa.getTipoNotificacao()){
      case TipoNotificacao.SMS:
        notificacao=NotificacaoEmail();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        notificacao=NotificacaoPush();
        break;
      case TipoNotificacao.EMAIL:
        notificacao=NotificacaoSMS();
        break;
      case TipoNotificacao.NENHUM:
        break;
      default:
        break;
    }
    if (notificacao!= null){
      notificacao!.enviarNotificacao(pessoa);
    } else{
      print("Nao foi possivel enviar notificacao");
    }
  }
}