import 'package:flutter/material.dart';

import 'calculo_page.dart';
import 'historico_page.dart';

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
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value){
                setState(() {
                  posicaoPagina = value;
                });
              },
              children: const [
                CalculoPage(),
                HistoricoPage()
              ],
            )
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value){
              controller.jumpToPage(value);
            },
            currentIndex: posicaoPagina,
            items: const[
              BottomNavigationBarItem(label: "Calcular IMC", icon: Icon(Icons.calculate)),
              BottomNavigationBarItem(label:"Historico",icon: Icon(Icons.history)),
            ])
        ]
      ),
    ));
  }
}
