import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 8,
            shadowColor: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/4792/4792944.png",
                        height: 50,
                      ),
                      const Text(
                        "Meu Card",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed:(){} ,
                    child: const Text(
                      "Ler mais",
                      style: TextStyle(
                        decoration: TextDecoration.underline
                      ),
                      ),),
                  )
                ],
              ),
            )),
      ),
    ]);
  }
}
