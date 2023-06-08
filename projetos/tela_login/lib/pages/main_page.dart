import 'package:flutter/material.dart';
import 'package:tela_login/pages/dados_cadastrais.dart';
import 'package:tela_login/pages/pagina1.dart';
import 'package:tela_login/pages/pagina2.dart';
import 'package:tela_login/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
          ),
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            child: const Text("Dados Cadastrais")),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DadosCadastraisPage(
                                          texto: "Meus Dados")));
                        }),
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
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) { //na mudança de posição da pagina.
                    setState(() {
                      posicaoPagina = value;
                    });
                  },
                  // scrollDirection: Axis.vertical,
                  children: const [
                    Pagina1Page(),
                    Pagina2Page(),
                    Pagina3Page(),
                  ],
                ),
              ),
              BottomNavigationBar(
                onTap: (value){
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label:"Perfil",icon: Icon(Icons.person)),
                  BottomNavigationBarItem(label:"Config.",icon: Icon(Icons.engineering)),
                ]),
            ],
          )),
    );
  }
}
