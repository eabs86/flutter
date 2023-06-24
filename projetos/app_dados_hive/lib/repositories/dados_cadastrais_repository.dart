import 'package:hive/hive.dart';
import 'package:tela_login/model/dados_cadastrais_model.dart';

class  DadosCadastraisRepository{
  static late Box _box;
  
  DadosCadastraisRepository._criar();//construtores não podem trabalhar com async e await
  // então há necessidade de se criar um construtor vazio e criar um método estático
  static const CHAVE_DADOS_CADASTRAIS_MODEL = "dadosCadastraisModel";

  //criando um construtor interno para lidar com async e await, ou seja carregar as informações.
  static  Future <DadosCadastraisRepository> carregar() async{
    if(Hive.isBoxOpen(CHAVE_DADOS_CADASTRAIS_MODEL)){
        _box = Hive.box(CHAVE_DADOS_CADASTRAIS_MODEL);
    }else{
        _box = await Hive.openBox(CHAVE_DADOS_CADASTRAIS_MODEL);
    }
    return DadosCadastraisRepository._criar();
  }

  salvar(DadosCadastraisModel dadosCadastraisModel){
    _box.put(CHAVE_DADOS_CADASTRAIS_MODEL, dadosCadastraisModel);
  }


  DadosCadastraisModel obterDados(){
    var dadosCadastraisModel = _box.get(CHAVE_DADOS_CADASTRAIS_MODEL);
    if (dadosCadastraisModel == null){
      return DadosCadastraisModel.vazio();
    }else{
      return dadosCadastraisModel;
    }
  }

}