import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
  //no flutter tudo é widget (lista, botão, página, etc)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );

  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // ignore: non_constant_identifier_names
  var numeroGerado =0;

  int _gerarRandom(){
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(1000);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APP ZERO")
      ),
      body: Center(child: Text(numeroGerado.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          numeroGerado = _gerarRandom();
          setState(() {
            numeroGerado = _gerarRandom();
          });
        },
        child: const Icon(Icons.add_circle_outline),
      )
    );
    //pode-se colocar qualquer widget dentro do container
  }
}