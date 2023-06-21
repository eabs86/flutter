import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  
  String? nomeUsuario;
  double? altura;
  bool receberPushNotification = false;
  bool temaEscuro = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:const Text("Configurações")),
        body: ListView(
          children: [
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
              })
          ]
        ),
      )
    );
  }
}