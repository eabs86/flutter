
import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';

class PessoaFisica extends Pessoa { //exemplo de herança. Usa-se o extends
  
  String _cpf = "";



  void setCpf(String cpf){
    _cpf = cpf;
  }



  String getCpf(){
    return _cpf;
  }

  //construindo um constrututor
  PessoaFisica(String nome, String endereco, String cpf,{TipoNotificacao tipoNotificacao=TipoNotificacao.NENHUM})
  :super(nome, endereco, tipoNotificacao: tipoNotificacao){

    _cpf = cpf;
  }

  //sobrescrever usando o @override
  @override
  String toString(){
    return{
      "tipo":"PF",
      "nome":super.getNome(),
     "endereco":super.getEndereco(),
      "cpf":_cpf,
      "TipoNotificacao":getTipoNotificacao()
      }.toString();
  }
}