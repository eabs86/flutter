import 'package:hive/hive.dart';
import 'package:tela_login/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;
  
  TarefaHiveRepository._criar();//construtores não podem trabalhar com async e await
  // então há necessidade de se criar um construtor vazio e criar um método estático
  static const CHAVE_TAREFA_HIVE_MODEl = "tarefaHiveModel";

  //criando um construtor interno para lidar com async e await, ou seja carregar as informações.
  static  Future <TarefaHiveRepository> carregar() async{
    if(Hive.isBoxOpen(CHAVE_TAREFA_HIVE_MODEl)){
        _box = Hive.box(CHAVE_TAREFA_HIVE_MODEl);
    }else{
        _box = await Hive.openBox(CHAVE_TAREFA_HIVE_MODEl);
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModel tarefaHiveModel)
  {
    _box.add(tarefaHiveModel);
  }

  List <TarefaHiveModel> obterDados( bool naoConcluido){
    if(naoConcluido){
      return _box.values.cast<TarefaHiveModel>().where((tarefaHiveModel) => tarefaHiveModel.concluido == false).toList();
      // Poderia ser também return _box.values.cast<TarefaHiveModel>().where((elemnt) => !element.concluido).toList();
    }
    return _box.values.cast<TarefaHiveModel>().toList();
  }

  excluir(TarefaHiveModel tarefaHiveModel){
    tarefaHiveModel.delete();
  }
  alterar(TarefaHiveModel tarefaHiveModel){
    tarefaHiveModel.save();
  }
}