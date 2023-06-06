import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 241, 243),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100
                ),
              const Icon(
                Icons.person,
                size: 150,
                ),
              const SizedBox(
                height: 50
                ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.indigo.shade100,
                height: 30,
                alignment: Alignment.center,
                child: const Text("Informe seu email:",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                    ),
                  ),
              ),
              const SizedBox(
                height: 10
                ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.indigo.shade100,
                height: 30,
                alignment: Alignment.center,
                child: const Text("Informe sua senha:"),
              ),
              Expanded(
                child: Container()
                ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.indigo.shade100,
                height: 50,
                alignment: Alignment.center,
                child: const Text("Entrar"),
              ),
              const SizedBox(
                height: 20
                ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.orange.shade50,
                height: 50,
                alignment: Alignment.center,
                child: const Text("Cadastre-se"),
              ),
              const SizedBox(
                height: 20
                ),
            ],
          ),
        ),
      ),
    );
  }
}