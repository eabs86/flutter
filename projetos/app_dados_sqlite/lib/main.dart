
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tela_login/model/tarefa_hive_model.dart';
import 'model/dados_cadastrais_model.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider; //ao colocar um alias nós conseguimos pushar os métodos pelo "."




void main() async {
  WidgetsFlutterBinding.ensureInitialized();//necessário para trabalhar com hive
  var documentsDirectory = await path_provider.getApplicationDocumentsDirectory(); //definição do path onde serão armazenados os dados
  Hive.init(documentsDirectory.path); //inicialização do hive
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());
  runApp(const MyApp());
  //no flutter tudo é widget (lista, botão, página, etc)
}