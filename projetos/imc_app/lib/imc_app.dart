import 'exception/nome_invalido_exception.dart';
import 'models/console_utils.dart';
import 'models/pessoa.dart';

void imcApp(){
  print("Bem vindo à calculadora de IMC");
  String nome;
  double? altura;
  double? peso;
  //colocar tratamento do nome
  nome = ConsoleUtils.lerStringComTexto("Digite o nome do paciente:");

  //Fechando o programa para nome inválido
  if (nome.trim()==""){
    throw NomeInvalidoException();
  }
  // Ou poderia colocar em loop até colocar o nome da forma correta

  // while (nome.trim() == ""){
  //     nome = ConsoleUtils.lerStringComTexto("Digite novamente o nome do paciente:");
  //  }

  //colocar tratamento da altura
  altura = ConsoleUtils.lerDoubleComTexto("Digite a altura do paciente em metros:");

  while ((altura?.isNegative?? true) || altura == 0.0 || altura! > 3.0){
      altura = ConsoleUtils.lerDoubleComTexto("Altura inválida! Digite novamente a altura do paciente em metros:");
   }

  //colocar tratamento do peso
  peso = ConsoleUtils.lerDoubleComTexto("Digite o peso do paciente em quilos:");

  while (peso?.isNegative?? true ){
      peso = ConsoleUtils.lerDoubleComTexto("Peso inválido! Digite novamente o peso do paciente em quilos:");
   }


  var pessoa = Pessoa(nome, peso ?? 0.0, altura ?? 0.0);

  double imc = pessoa.calculoIMC();
  print("O IMC do paciente ${pessoa.getNome()} é: $imc");

  String classificacao = pessoa.classificacaoIMC(imc);
  print("A classificação do paciente ${pessoa.getNome()} é: $classificacao");



}