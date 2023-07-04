import '../model/tarefa.dart';

class TarefaRepository{
  
  final List<Tarefa> _tarefas = [];

  Future<void> adicionarTarefa(Tarefa tarefa) async {
    await Future.delayed(const Duration(milliseconds:100 ));
    _tarefas.add(tarefa);
  }

  Future <void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas.where((tarefa) => tarefa.getId() == id).first.setConcluido(concluido);
  }
  Future<List<Tarefa>> listarTarefas() async{
    await Future.delayed(const Duration(milliseconds:100));
    return _tarefas;
  }

  Future<List<Tarefa>> listarTarefasNaoConcluidas() async{
    await Future.delayed(const Duration(milliseconds:100));
    return _tarefas.where((tarefa)=>!tarefa.getConcluido()).toList();
  }

  Future<void> removerTarefa(String id) async{
    await Future.delayed(const Duration(milliseconds:100));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.getId() == id).first);
  }


  
}