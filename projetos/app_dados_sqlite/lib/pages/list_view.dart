import 'package:flutter/material.dart';
import 'package:tela_login/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuário 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Está podendo falar?"),
              Text("09:00")
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              debugPrint(menu);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[ //onde serão colocados todos os itens do menu
              const PopupMenuItem<String>(
                value: "opcao1",
                child: Text("Opção 1"),
              ),
              const PopupMenuItem<String>(
                value: "opcao2",
                child: Text("Opção 2"),
              ),
              const PopupMenuItem<String>(
                value: "opcao3",
                child: Text("Opção 3"),
              )
            ]
          ),
          isThreeLine: true,

        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.map1),
        Image.asset(AppImages.map2),
        Image.asset(AppImages.map3),
        
      ]
    );
  }
}