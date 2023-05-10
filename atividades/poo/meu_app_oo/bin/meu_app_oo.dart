import 'package:meu_app_oo/classes/Pessoa.dart';
import 'package:meu_app_oo/classes/PessoaFisica.dart';
import 'package:meu_app_oo/classes/PessoaJuridica.dart';


void main(List<String> arguments) {

  var p1 = Pessoa("Fulano","Rua 1");
  print(p1);
  //forma não recomendada de setar propriedades
  // p1.nome = "Fulano";
  // p1.endereco = "Rua 1";
  // print(p1.nome);
  // print(p1.endereco);

  //forma melhor de setar propriedades, porém ainda não é a mais apropriada para pegar o valor da classe
  // p1.setNome("Fulano");

  // print(p1.nome);

  // p1.setEndereco("Rua 1");

  // print(p1.endereco);

  //Forma mais apropriada
  p1.setNome("Fulano");

  print(p1.getNome());

  p1.setEndereco("Rua 1");

  print(p1.getEndereco());

  print(p1);


  var p2 = PessoaFisica("Ciclano", "Rua 2","0000000");
  print(p2);

  var p3 = PessoaJuridica("Beltrano", "Rua 3","0000000");
  print(p3);

}
 