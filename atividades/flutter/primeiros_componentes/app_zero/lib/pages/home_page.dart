
import 'package:app_zero/service/random_number_generate_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // ignore: non_constant_identifier_names
  var numeroGerado =0;
  var quantidadeCliques = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Meu Primeiro App",
        //style: GoogleFonts.pacifico(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        width: double.infinity,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Text("Ações do usuário",
                style: GoogleFonts.pacifico(fontSize: 40),
                ),
                
                Text(
                  "Quantidade de Cliques: $quantidadeCliques",
                  style: GoogleFonts.padauk(fontSize: 20), //alteração da fonte em widget específico
                  ),
          
                Text(
                  "O numero aleatório gerado foi $numeroGerado",
                  style: GoogleFonts.padauk(fontSize: 20), //alteração da fonte em widget específico
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

                Container(
                  color: Colors.amber,
                  child: Text(
                  "Exemplo 1",
                  style: GoogleFonts.padauk(fontSize: 20), //alteração da fonte em widget específico
                  ),
                ),
                Container(
                  color:Colors.cyan,
                  child: Text(
                  "Exemplo 2",
                  style: GoogleFonts.padauk(fontSize: 20), //alteração da fonte em widget específico
                  ),
                ),
                Container(
                  color: Colors.deepPurple,
                  child: Text(
                  "Exemplo 2",
                  style: GoogleFonts.padauk(fontSize: 20), //alteração da fonte em widget específico
                  ),
                ),

              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          setState((){
            quantidadeCliques = quantidadeCliques + 1;
            numeroGerado = RandomNumberGenerateService.gerarRandom(100);
          });
        },
      )
    );
    //pode-se colocar qualquer widget dentro do container
  }
}