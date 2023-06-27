import 'package:flutter/material.dart';
import 'package:tela_login/model/tarefa.dart';
import 'package:tela_login/model/tarefa_hive_model.dart';
import 'package:tela_login/repositories/tarefa_hive_repository.dart';

import '../../repositories/tarefa_repository.dart';

class TarefasHivePage extends StatefulWidget {
  const TarefasHivePage({super.key});

  @override
  State<TarefasHivePage> createState() => _TarefasHivePageState();
}

class _TarefasHivePageState extends State<TarefasHivePage> {
  late TarefaHiveRepository tarefaRepository;
  var descricaoController = TextEditingController();
  var _tarefas = const <TarefaHiveModel>[];
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    // TODO: implement initState
    obterTarefas();
    super.initState();
  }

  void obterTarefas() async {
    tarefaRepository = await TarefaHiveRepository.carregar();
    _tarefas = tarefaRepository.obterDados(apenasNaoConcluidos);

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            descricaoController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar Tarefa"),
                    content: TextField(
                      controller: descricaoController,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () async {
                          debugPrint(descricaoController.text);
                          await tarefaRepository.salvar(
                              TarefaHiveModel.criar(descricaoController.text, false));
                          Navigator.pop(context);
                          obterTarefas();
                          setState(() {});
                        },
                        child: const Text("Salvar"),
                      ),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Apenas não concluídos", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Switch(value: apenasNaoConcluidos, onChanged: (bool value){
                      apenasNaoConcluidos = value;
                      obterTarefas();
                    }),
                  ],
                ),

              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _tarefas.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var tarefa = _tarefas[index];
                      
                      return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async{
                          tarefaRepository.excluir(tarefa);
                          obterTarefas();
                        },
                        key: Key(tarefa.descricao),
                        child: ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(onChanged: (bool value) async {
                            tarefa.concluido = value;
                            tarefaRepository.alterar(tarefa);
                            obterTarefas();
                          }, 
                          value: tarefa.concluido),
                          ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
