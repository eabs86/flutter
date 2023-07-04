import 'package:flutter/material.dart';
import 'package:tela_login/model/card_detail.dart';
import 'package:tela_login/pages/card_detail_page.dart';
import 'package:tela_login/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

  CardDetail? cardDetail;
  var cardDetailRepositoy = CardDetailRepositoy();

  @override //statless não tem initState
  void initState() { //nunca pode ser assíncrono, ou seja, não dá para usar a função async
    super.initState();
    carregarDados();
    
  }

  void carregarDados() async{
    cardDetail = await cardDetailRepositoy.get();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity,
        child: cardDetail == null ? const LinearProgressIndicator() : InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardDetailPage(
                          cardDetail: cardDetail!,
                        )));
          },
          child: Hero(
            tag: cardDetail!.id,
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
                            cardDetail!.url,
                            height: 50,
                          ),
                          Text(
                            cardDetail!.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        cardDetail!.text,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Ler mais",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ),
          ),
        ),
      ),
    ]);
  }
}
