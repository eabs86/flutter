import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tela_login/repositories/nivel_repository.dart';
import 'package:tela_login/shared/widgets/text_label.dart';

import '../repositories/linguagens_repository.dart';

class DadosCadastraisPage extends StatefulWidget {
  final String texto;

  const DadosCadastraisPage({super.key, required this.texto});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  String dataFormatada = "";
  var niveis = [];
  var nivelRepository = NivelRepository();
  var nivelSelecionado="";
  var linguagens =[];
  var linguagensRepository = LinguagensRepository();
  var linguagensSelecionadas = [];

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.texto)),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ListView( //necessário usar esse widget para não ter problema com invasão de área do teclado.
            children: [
              const TextLabel(
                  texto:
                      "Nome"), //widget criado para retornar um texto padronizado
              TextField(
                controller: nomeController,
              ),
              const TextLabel(texto: "Data de Nascimento"),
              TextField(
                readOnly: true, //não deixa escrever na região de nascimento.
                controller: dataNascimentoController,
                onTap: () async {
                  //necessidade do async e do await para funcionar corretamente, pois o showDataPicker retorna um future.
                  var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (data != null) {
                    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
                    //para usar essa classe precisa adicionar a lib intl (internationalization and localization)
                    //adicionar no pubspec.yaml a dependência intl: ^0.17.0
                    dataFormatada = dateFormat.format(data);
                    dataNascimentoController.text = dataFormatada;
                    // dataNascimentoController.text = data.toString();
                    dataNascimento = data;
                  }
                },
              ),
              const TextLabel(texto: "Nível de Experiência"),
              Column(children: [
                ...niveis
                    .map((nivel) => RadioListTile(
                        title: Text(nivel.toString()),
                        value: nivel.toString(),
                        selected: nivelSelecionado==nivel,
                        groupValue: nivelSelecionado,
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            nivelSelecionado = value.toString();                           
                          });
                        })).toList(),
              ]),
              const TextLabel(texto: "Linguagens Preferidas"),
              Column(children: [
                ...linguagens.map((linguagem) => CheckboxListTile(
                    title: Text(linguagem.toString()),
                    // selected: linguagensSelecionadas==linguagem,
                    value: linguagensSelecionadas.contains(linguagem),
                    onChanged: (value) {
                      if(value==true){
                        linguagensSelecionadas.add(linguagem);
                      }else{
                        linguagensSelecionadas.remove(linguagem);
                      }
                      setState(() {
                      });
                    }
                )).toList(),
              ],),
              TextButton(
                  onPressed: () {
                    debugPrint(nomeController.text);
                    debugPrint(dataNascimento.toString());
                  },
                  child: const Text("Salvar")),
            ],
          ),
        ));
  }
}
