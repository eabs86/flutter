import 'package:hive/hive.dart';
import 'package:tela_login/model/configuracoes_model.dart';

class ConfiguracoesRepository{
  static late Box _box;
  
  ConfiguracoesRepository._criar();//construtores não podem trabalhar com async e await
  // então há necessidade de se criar um construtor vazio e criar um método estático

  //criando um construtor interno para lidar com async e await, ou seja carregar as informações.

  static  Future <ConfiguracoesRepository> carregar() async{
    if(Hive.isBoxOpen("configuracoes")){
        _box = Hive.box("configuracoes");
    }else{
        _box = await Hive.openBox("configuracoes");
    }
    return ConfiguracoesRepository._criar();
  }

  void salvar (ConfiguracoesModel configuracoesModel){
    _box.put(
      "configuracoesModel",{
        "nomeUsuario": configuracoesModel.nomeUsuario,
        "altura": configuracoesModel.altura,
        "receberPushNotification": configuracoesModel.receberPushNotification,
        "temaEscuro": configuracoesModel.temaEscuro
      }
    );
  }

  ConfiguracoesModel obterDados(){
    var configuracoes = _box.get("configuracoesModel");
    if (configuracoes == null){
      return ConfiguracoesModel.vazio();
    }else{
    return ConfiguracoesModel(
      configuracoes["nomeUsuario"],
      configuracoes["altura"],
      configuracoes["receberPushNotification"],
      configuracoes["temaEscuro"]);
      }
  }


}
