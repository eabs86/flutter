import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        drawer: Drawer(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: const Text("Dados Cadastrais")),
                onTap: () {}),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
             InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: const Text("Configurações")),
                onTap: () {}),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
             InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: const Text("Termos de Uso e Privacidade")),
                onTap: () {}),
            const Divider(),
          ]),
        )),
      ),
    );
  }
}
