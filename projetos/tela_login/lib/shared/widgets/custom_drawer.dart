import 'package:flutter/material.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.network("https://cdn-icons-png.flaticon.com/512/4792/4792944.png"),
            ),
            accountName: const Text("Fulano da Silva"),
            accountEmail: const Text("email@email.com")
            ),
        InkWell(
            child: Container(
                padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    Text("Dados Cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DadosCadastraisPage(texto: "Meus Dados")));
            }),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 10),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {}),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
            child: Container(
                padding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.privacy_tip_outlined),
                    SizedBox(width: 10),
                    Text("Termos de Uso e Privacidade"),
                  ],
                )),
            onTap: () {}),
        const Divider(),
      ]),
    );
  }
}
