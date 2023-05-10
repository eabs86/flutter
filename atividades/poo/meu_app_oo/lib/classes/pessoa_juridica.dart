
import 'package:meu_app_oo/classes/pessoa_abstract.dart';

import '../enum/tipo_notificacao.dart';

class PessoaJuridica extends Pessoa {
  

  String _cnpj = "";

  void setCnpj(String cnpj){
    _cnpj = cnpj;
  }



  String getCnpj(){
    return _cnpj;
  }

  //construindo um constrututor
  PessoaJuridica(String nome, String endereco, String cnpj, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
  :super(nome, endereco, tipoNotificacao: tipoNotificacao){
    //lembrar de colocaro super no construtor

    _cnpj = cnpj;
  }

  //sobrescrever usando o @override
  @override
  String toString(){
    return{
    "tipo":"PJ",
    "nome":getNome(),
    "endereco":getEndereco(),
    "cnpj":_cnpj,
    "TipoNotificacao":getTipoNotificacao()
    }.toString();
  }
}