import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tela_login/service/app_storage_service.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  int numeroGerado = 0;
  int quantidadeCliques = 0;
  AppStorageService storage = AppStorageService(); //garante que quando iniciar a aplicação o storage vai receber o valor
  
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {

    numeroGerado = await storage.getNumeroAleatorio();
    quantidadeCliques = await storage.getQuantidadeCliques();
    
    setState(() {});

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
              quantidadeCliques = (quantidadeCliques) +1;

            });
              await storage.setNumeroAleatorio(numeroGerado);
              await storage.setQuantidadeCliques(quantidadeCliques);

        }),
      ),
    );
  }
}