import 'package:meu_app_oo/service/enviar_notificacao.dart';
import '../classes/pessoa_abstract.dart';

abstract class NotificacaoInterface{
  void enviarNotificacao(Pessoa pessoa);
}