import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tela_login/repositories/nivel_repository.dart';
import 'package:tela_login/service/app_storage_service.dart';
import 'package:tela_login/shared/widgets/text_label.dart';

import '../../repositories/linguagens_repository.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  final String texto;

  const DadosCadastraisHivePage({super.key, required this.texto});

  @override
  State<DadosCadastraisHivePage> createState() => _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  String dataFormatada = "";
  var niveis = [];
  var nivelRepository = NivelRepository();
  var nivelSelecionado ="";
  var linguagens =[];
  var linguagensRepository = LinguagensRepository();
  List<String> linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  var tempoExperiencia =0;
  AppStorageService storage = AppStorageService();

  final String CHAVE_DADOS_CADASTRAIS_NOME = "CHAVE_DADOS_CADASTRAIS_NOME";
  final String CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO = "CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO";
  final String CHAVE_DADOS_CADASTRAIS_NIVEL = "CHAVE_DADOS_CADASTRAIS_NIVEL";
  final String CHAVE_DADOS_CADASTRAIS_LINGUAGENS = "CHAVE_DADOS_CADASTRAIS_LINGUAGENS";
  final String CHAVE_DADOS_CADASTRAIS_SALARIO = "CHAVE_DADOS_CADASTRAIS_SALARIO";
  final String CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA = "CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA";


  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima){
    var itens = <DropdownMenuItem<int>>[];
    for (var i=0; i<quantidadeMaxima; i++){
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {

   
    nomeController.text = await storage.getDadosCadastraisNome();
    dataNascimentoController.text = await storage.getDadosCadastraisDataNascimento();
    if (dataNascimentoController.text.isNotEmpty){
      dataNascimento = DateTime.parse(dataNascimentoController.text);
    }
    
    nivelSelecionado = await storage.getDadosCadastraisNivelExperiencia();
    linguagensSelecionadas = await storage.getDadosCadastraisLinguagens();
    tempoExperiencia = await storage.getDadosCadastraisTempoExperiencia();
    salarioEscolhido = await storage.getDadosCadastraisSalario();
    setState(() {
  	  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.texto)),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando 
          ? const Center(child: CircularProgressIndicator()) 
          : ListView( //necessário usar esse widget para não ter problema com invasão de área do teclado.
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
                          debugPrint(value.toString());
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
              const TextLabel(texto: "Tempo de Experiência"),
              DropdownButton(
                value:tempoExperiencia,
                isExpanded: true,
                items:returnItens(50),
                onChanged: (value){
                  setState(() {
                    tempoExperiencia = int.parse(value.toString());
                  });

              }),
              
              TextLabel(texto: "Pretensão Salarial: R\$ ${salarioEscolhido.round().toString()} "),
              Slider(
                min:0.0,
                max: 15000,
                value: salarioEscolhido,
                onChanged: (double value){
                  setState(() {
                    salarioEscolhido = value;
                    // debugPrint(salarioEscolhido.toString());
                  });

              }),
              TextButton(
                  onPressed: () async {
                    setState(() {
                      salvando = false;
                    });

                    if(nomeController.text.trim().length <= 3){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Nome inválido"),
                      ));
                      return;
                    }
                    if(dataNascimento==null){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Data de Nascimento Inválida!"),
                      ));
                      return;
                    }
                    if(nivelSelecionado.trim()==""){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Selecione um nível de experiência!"),
                      ));
                      return;
                    }
                    if(linguagensSelecionadas.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Selecione pelo menos 1 linguagem!"),
                      ));
                      return;
                    }
                    if(salarioEscolhido==0){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Pretensão salarial incorreta!"),
                      ));
                      return;
                    }
                    if(tempoExperiencia==0){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Tempo de experiência precisa ser maior que 0!"),
                      ));
                      return;
                    }
                    await storage.setDadosCadastraisNome(nomeController.text);
                    await storage.setDadosCadastraisDataNascimento(
                      dataNascimento!
                    );
                    await storage.setDadosCadastraisNivelExperiencia(
                      nivelSelecionado
                    );
                    await storage.setDadosCadastraisLinguagens(
                      linguagensSelecionadas
                    );

                    await storage.setDadosCadastraisTempoExperiencia(
                      tempoExperiencia
                    );
                    await storage.setDadosCadastraisSalario(
                     salarioEscolhido
                    );

                    setState(() {
                      
                      salvando = true;
                    });

                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                      salvando = false;
                      });
                      Navigator.pop(context);
                    });


                    debugPrint(nomeController.text);
                    debugPrint(dataNascimento.toString());
                    debugPrint(nivelSelecionado.toString());
                    debugPrint(linguagensSelecionadas.toString());
                    debugPrint(salarioEscolhido.toString());
                    debugPrint(tempoExperiencia.toString());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Dados salvos com sucesso!"),
                        backgroundColor: Colors.green,
                      ));
                  },
                  child: const Text("Salvar")),
            ],
          ),
        ));
  }
}
