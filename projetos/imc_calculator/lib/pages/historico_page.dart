import 'package:flutter/material.dart';

import '../models/historico_imc.dart';


class HistoricoPage extends StatefulWidget {
  final List<HistoricoItem> historico;
  const HistoricoPage({super.key, required this.historico});


  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {



  @override
  Widget build(BuildContext context) {
return ListView.builder(
  itemCount: widget.historico.length,
  itemBuilder: (context, index) {
    final item = widget.historico[index];
    return ListTile(
      title: Text('Peso: ${item.peso} kg'),
      subtitle: Text('Altura: ${item.altura} cm\nIMC: ${item.imc}\nClassificação: ${item.classificacao}\nData: ${item.data}'),
    );
  },
    );
  }
}