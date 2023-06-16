import 'package:flutter/material.dart';

class CalculoPage extends StatefulWidget {
  const CalculoPage({super.key});

  @override
  State<CalculoPage> createState() => _CalculoPageState();
}

class _CalculoPageState extends State<CalculoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: ListView(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              height: 90,
              color: Colors.green,
              child: const Text("Calcule seu IMC!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
            ),
            const SizedBox(height: 30),
            Row(children: [
              Expanded(child: Container()),
              const Expanded(
                  child: Icon(
                Icons.height,
                size: 50,
              )),
              const Expanded(
                flex: 3,
                child: TextField(
                    style: TextStyle(fontSize: 25),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Altura em cm")),
              ),
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("cm",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              )),
              Expanded(child: Container()),
            ]),
            const SizedBox(height: 30),
            Row(children: [
              Expanded(child: Container()),
              const Expanded(
                  child: Icon(
                Icons.monitor_weight,
                size: 50,
              )),
              const Expanded(
                flex: 3,
                child: TextField(
                    style: TextStyle(fontSize: 25),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Peso em kg")),
              ),
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("kg",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              )),
              Expanded(child: Container()),
            ]),
            const SizedBox(height: 30),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 60),
                height: 40,
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 0, 74, 179)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Calcular",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                )),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(flex: 2, child: Container()),
                const Expanded(
                    flex: 2,
                    child: Text(
                      "Seu IMC:",
                      style: TextStyle(fontSize: 20),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 0, 74, 179),
                          )),
                      child: const Text(
                        "VALOR",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(flex: 2, child: Container()),
              ],
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(flex: 2, child: Container()),
              const Expanded(
                  flex: 3,
                  child: Text(
                    "STATUS:",
                    textAlign: TextAlign.center,
                  )),
              const Expanded(flex: 3, child: Text("RESULTADO DO IMC:")),
              Expanded(
                  flex: 2,
                  child: InkWell(
                      onTap: () {
                        debugPrint("clicou");
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (BuildContext bc) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                child:  Column(
                                  children: [
                                    const Text(
                                      "Escala de IMC",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Expanded(
                                      child: Image.asset(
                                        "lib/images//escala_imc.png",
                                        ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Icon(
                        Icons.info_rounded,
                        size: 25,
                      ))),
            ])
          ],
        ),
      ],
    ));
  }
}
