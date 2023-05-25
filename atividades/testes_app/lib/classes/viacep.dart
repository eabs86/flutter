import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mockito/mockito.dart';


class ViaCep{

  Future<Map> retornarCEP(String cep) async {  //a chamada é assíncrona!
    var uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var retorno = await http.get(uri);
    var decodedResponse = jsonDecode(utf8.decode(retorno.bodyBytes)) as Map;
    print(decodedResponse);
    return decodedResponse;
  }
}

