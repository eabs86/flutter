import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  int? numeroGerado = 0;
  int? quantidadeCliques = 0;
  final CHAVE = "numeroGerado";
  final CHAVE_CLIQUES = "quantidadeCliques";
  late SharedPreferences storage; //garante que quando iniciar a aplicação o storage vai receber o valor
  
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(CHAVE);
      quantidadeCliques = storage.getInt(CHAVE_CLIQUES);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Gerador de Numeros Aleatórios")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Text( numeroGerado ==null ? "Nenhum número gerado": numeroGerado.toString(), //se o numero gerado for nulo, printa vazio
                style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
              Text( quantidadeCliques ==null ? "Nenhum clique": quantidadeCliques.toString(), //se o numero gerado for nulo, printa vazio
                style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold) ,)
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {

            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) +1;

            });
              storage.setInt(CHAVE, numeroGerado!);
              storage.setInt(CHAVE_CLIQUES, quantidadeCliques!);

        }),
      ),
    );
  }
}