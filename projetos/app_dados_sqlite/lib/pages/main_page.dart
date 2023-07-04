import 'package:flutter/material.dart';

import 'package:tela_login/pages/card_page.dart';
import 'package:tela_login/pages/image_assets.dart';
import 'package:tela_login/pages/list_view.dart';
import 'package:tela_login/pages/list_view_horizontal.dart';
import 'package:tela_login/pages/tarefa_page/tarefa_sqlite_page.dart';
// import 'package:tela_login/pages/tarefa_page/tarefa_page.dart';
import 'package:tela_login/shared/widgets/custom_drawer.dart';

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
          drawer: const CustomDrawer(),
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
                    CardPage(),
                    ImageAssetsPage(),
                    ListViewPage(),
                    TarefasSqlitePage(),
                    ListViewHorizontalPage()
                  ],
                ),
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value){
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(label: "Dashboard", icon: Icon(Icons.dashboard)),
                  BottomNavigationBarItem(label:"Rotas",icon: Icon(Icons.route_outlined)),
                  BottomNavigationBarItem(label:"Perfis",icon: Icon(Icons.person_pin_sharp)),
                  BottomNavigationBarItem(label:"Desafios",icon: Icon(Icons.task_alt)),
                  BottomNavigationBarItem(label:"Minha Bike",icon: Icon(Icons.pedal_bike))
                ]),
            ],
          )),
    );
  }
}
