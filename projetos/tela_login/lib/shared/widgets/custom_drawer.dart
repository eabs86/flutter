import 'package:flutter/material.dart';
import 'package:tela_login/pages/login_page.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(children: [
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: const Text("Câmera"),
                      leading: const Icon(Icons.camera_enhance),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: const Text("Galeria"),
                      leading: const Icon(Icons.photo_album),
                    )
                  ]);
                });
          },
          child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/4792/4792944.png"),
              ),
              accountName: const Text("Fulano da Silva"),
              accountEmail: const Text("email@email.com")),
        ),
        InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.privacy_tip_outlined),
                    SizedBox(width: 10),
                    Text("Termos de Uso e Privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: const Column(
                        children: [
                          Text(
                            "Termo de Uso e Privacidade",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            " Bem-vindo aos nossos Termos de Uso e Política de Privacidade! Esses termos são importantes para definir as regras e responsabilidades ao utilizar nossos serviços e para garantir a proteção da sua privacidade. Por favor, leia atentamente as informações a seguir. \nTermos de Uso: \nAceitação dos termos: Ao utilizar nossos serviços, você concorda em cumprir estes Termos de Uso. Caso não concorde com algum aspecto destes termos, solicitamos que interrompa o uso dos nossos serviços.",
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                  });
            }),
        const Divider(),
        const SizedBox(height: 10),
        InkWell(
            child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 10),
                    Text("Sair"),
                  ]),
            ),
            onTap: () {
              showDialog(context: context, builder: (BuildContext bc){
                return AlertDialog(
                  alignment: Alignment.centerLeft,
                  elevation: 10,
                  shape: const RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(10))),
                  title: const Text("Sair do aplicativo?",style: TextStyle(fontWeight: FontWeight.bold),),
                  actions: [
                    TextButton(onPressed: (){
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>const LoginPage()));
                    }, child: const Text("Sim")),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text("Não"))
                  ],
                );

              });
            },
        )

      ]),
    );
  }
}
