import 'package:flutter/material.dart';

import 'main_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(
      text:
          ""); //pode colocar parâmetro text no argumento do controller para vir com exemplo no campo.
  TextEditingController senhaController = TextEditingController(text: "");
  // String email = "";
  // String senha = "";
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 159, 179), //Color.fromARGB(255, 236, 241, 243),
        body: SingleChildScrollView(
          //necessidade desses widget para não dar problema com teclado
          child: ConstrainedBox(
            //necessidade desses widget para não dar problema com teclado
            constraints: BoxConstraints(
                //necessidade desses widget para não dar problema com teclado
                maxHeight: MediaQuery.of(context)
                    .size
                    .height //necessidade desses widget para não dar problema com teclado
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 6,
                      child: Image.asset(
                        "lib/images/logo_imc_app.png",
                        height: 130,
                      ),
                    ),
                    Expanded(
                      child: Container()),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("Sua saúde na palma da sua mão!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
                const SizedBox(height: 10),
                const Text("Monitore o seu IMC diariamente!",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      hintText: "Digite seu email",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 0, 74, 179),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  // color: Colors.indigo.shade100,
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    obscureText: isObscureText,
                    controller: senhaController,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        hintText: "Digite sua senha",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 0, 74, 179),
                        ),
                        suffixIcon: InkWell(
                          //pode fazer com o GestureDetector também
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color.fromARGB(255, 0, 74, 179),
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 40,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (emailController.text.trim() ==
                                    "email@email.com" &&
                                senhaController.text.trim() == "12345") {

                              Navigator.pushReplacement( //define que a nova base da pilha será a Home Page
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => const MainPage()),);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "Login efetuado com sucesso!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.green,
                              ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Email ou senha incorretos",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                                    ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            debugPrint(emailController.text);
                            debugPrint(senhaController.text);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color.fromARGB(255, 0, 74, 179)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            "ENTRAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                    )),
                Expanded(child: Container()),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  // color: Colors.orange.shade50,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  // color: Colors.orange.shade50,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 206, 59),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}