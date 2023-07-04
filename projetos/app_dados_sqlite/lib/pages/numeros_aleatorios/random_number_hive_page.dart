import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tela_login/service/app_storage_service.dart';

class RandomNumbersHivePage extends StatefulWidget {
  const RandomNumbersHivePage({super.key});

  @override
  State<RandomNumbersHivePage> createState() => _RandomNumbersHivePageState();
}

class _RandomNumbersHivePageState extends State<RandomNumbersHivePage> {
  int numeroGerado = 0;
  int quantidadeCliques = 0;
  late Box boxNumerosAleatorios; 
  
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    
    // storage = await Hive.openBox("box_numeros_aleatorios"); //criando uma caixa no hive
    // pode ser utilizado o Hive.box também, sem o await, porém deve-se garantir que a caixa esteja aberta ao ser chamada
    // caso contrário dará erro. Para não ter problema, pode-se usar uma estrutura com if

    if(Hive.isBoxOpen("box_numeros_aleatorios")){
      boxNumerosAleatorios = Hive.box("boxNumerosAleatorios");
    }else{
      boxNumerosAleatorios = await Hive.openBox("boxNumerosAleatorios");
    }

    numeroGerado = boxNumerosAleatorios.get("numeroGerado") ?? 0;
    quantidadeCliques = boxNumerosAleatorios.get("quantidadeCliques") ?? 0;
    
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Hive: Random Numbers")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Text( numeroGerado == null ? "Nenhum número gerado": numeroGerado.toString(), //se o numero gerado for nulo, printa vazio
                style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
              Text( quantidadeCliques == null ? "Nenhum clique": quantidadeCliques.toString(), //se o numero gerado for nulo, printa vazio
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
              boxNumerosAleatorios.put("numeroGerado",numeroGerado);
              boxNumerosAleatorios.put("quantidadeCliques",quantidadeCliques);

        }),
      ),
    );
  }
}