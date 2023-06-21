import 'package:flutter/material.dart';
import 'package:tela_login/pages/main_page.dart';

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
        backgroundColor: Colors.black, //Color.fromARGB(255, 236, 241, 243),
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
                      child: Image.network(
                        "https://lp.dio.me/wp-content/uploads/2023/03/LOGO-DIO-COLOR-768x311.png",
                        height: 100,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(height: 30),
                const Text("Já tem cadastro?",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 30,
                      color: Colors.white,
                    )),
                const SizedBox(height: 10),
                const Text("Faça seu login e make the change._",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      color: Colors.white,
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
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "Digite seu email",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.purple,
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
                    style: const TextStyle(color: Colors.white),
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Digite sua senha",
                        hintStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.purple,
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
                            color: Colors.purple,
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
                                MaterialStateProperty.all(Colors.purple),
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
                      color: Colors.red,
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
                      color: Colors.yellow,
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
