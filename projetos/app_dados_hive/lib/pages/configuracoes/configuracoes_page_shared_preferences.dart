import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tela_login/service/app_storage_service.dart';

class ConfiguracoesSharedPreferencesPage extends StatefulWidget {
  const ConfiguracoesSharedPreferencesPage({super.key});

  @override
  State<ConfiguracoesSharedPreferencesPage> createState() => _ConfiguracoesSharedPreferencesPageState();
}

class _ConfiguracoesSharedPreferencesPageState extends State<ConfiguracoesSharedPreferencesPage> {
  
  AppStorageService storage = AppStorageService();
  
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberPushNotification = false;
  bool temaEscuro = false;

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
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text = (await storage.getConfiguracoesAlturaUsuario()).toString();
    receberPushNotification = await storage.getConfiguracoesPushNotification();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    setState(() {
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:const Text("Configurações")),
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
              value: receberPushNotification, 
              title: const Text("Receber Push Notification"),
              onChanged: (bool value){
                setState(() {
                  receberPushNotification = !receberPushNotification;
                });
              }),
              SwitchListTile(
              value: temaEscuro, 
              title: const Text("Tema Escuro"),
              onChanged: (bool value){
                setState(() {
                  temaEscuro = !temaEscuro;
                });
              }),
              TextButton(
                onPressed: () async{
                  FocusManager.instance.primaryFocus?.unfocus();//evita de dar erro com o teclado no momento do fechamento da tela.
                  try {
                    await storage.setConfiguracoesAlturaUsuario(double.parse(alturaController.text));
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
                  await storage.setConfiguracoesNomeUsuario(nomeUsuarioController.text);
                  await storage.setConfiguracoesPushNotification(receberPushNotification);
                  await storage.setConfiguracoesTemaEscuro(temaEscuro);
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