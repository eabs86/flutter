import 'package:flutter/material.dart';
import 'package:tela_login/model/tarefa.dart';

import '../../repositories/tarefa_repository.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  var tarefaRepository = TarefaRepository();
  var descricaoController = TextEditingController();
  var _tarefas = const <Tarefa>[];
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    // TODO: implement initState
    obterTarefas();
    super.initState();
  }

  void obterTarefas() async {
    if (apenasNaoConcluidos){
          _tarefas = await tarefaRepository.listarTarefasNaoConcluidas();
    }else{
          _tarefas = await tarefaRepository.listarTarefas();
    }

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
                          await tarefaRepository.adicionarTarefa(
                              Tarefa(descricaoController.text, false));
                          Navigator.pop(context);
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
                          await tarefaRepository.removerTarefa(tarefa.getId());
                          obterTarefas();
                        },
                        key: Key(tarefa.getId()),
                        child: ListTile(
                          title: Text(tarefa.getDescricao()),
                          trailing: Switch(onChanged: (bool value) async {
                            await tarefaRepository.alterar(tarefa.getId(), value);
                            obterTarefas();
                          }, 
                          value: tarefa.getConcluido()),
                          ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
