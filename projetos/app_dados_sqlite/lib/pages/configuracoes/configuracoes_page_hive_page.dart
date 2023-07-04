import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tela_login/model/configuracoes_model.dart';
import 'package:tela_login/repositories/configuracoes_repository.dart';
import 'package:tela_login/service/app_storage_service.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  
  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();
  
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();


  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA_USUARIO = "CHAVE_ALTURA_USUARIO";
  final CHAVE_PUSH_NOTIFICATION = "CHAVE_PUSH_NOTIFICATION";
  final CHAVE_TEMA_ESCURO = "CHAVE_MODO_ESCURO";

  @override
  void initState() {

    super.initState();
    carregarDados();
  }

  carregarDados() async{
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();

    setState(() {
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:const Text("Configurações Hive")),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Nome do usuário",
                ),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Altura (em cm)",
                ),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
              value: configuracoesModel.receberPushNotification, 
              title: const Text("Receber Push Notification"),
              onChanged: (bool value){
                setState(() {
                  configuracoesModel.receberPushNotification = !configuracoesModel.receberPushNotification;
                });
              }),
              SwitchListTile(
              value: configuracoesModel.temaEscuro, 
              title: const Text("Tema Escuro"),
              onChanged: (bool value){
                setState(() {
                  configuracoesModel.temaEscuro = !configuracoesModel.temaEscuro;
                });
              }),
              TextButton(
                onPressed: () async{
                  FocusManager.instance.primaryFocus?.unfocus();//evita de dar erro com o teclado no momento do fechamento da tela.
                  try {
                    configuracoesModel.alturaUsuario = (double.parse(alturaController.text));
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (_){
                        return AlertDialog(
                          title: const Text("Erro no valor da altura!"),
                          content: const Text("Favor informar o valor corretamente."),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            )
                          ]
                        );
                      });
                    return;
                    
                  }
                  configuracoesModel.nomeUsuario = (nomeUsuarioController.text);
                  configuracoesRepository.salvar(configuracoesModel);
                  if (!mounted){
                    return;
                  }
                  Navigator.pop(context);
                },
                child: 
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 15, 86, 219),
                  ),
                  alignment:Alignment.center,
                  width: double.infinity,
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)
                    
                    ),
                ))
        )]
        ),
      )
    );
  }
}