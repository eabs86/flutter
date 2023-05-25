
import 'dart:convert';
import 'dart:io';
import 'classes/pessoa.dart';

void imcApp(){
  print("Bem vindo à calculadora de IMC");
  print("Digite seu nome: ");
  String nome = stdin.readLineSync(encoding: utf8)?? "";
  print("Digite seu peso: ");
  double peso = double.parse(stdin.readLineSync()!);
  print("Digite sua altura: ");
  double altura = double.parse(stdin.readLineSync()!);
  Pessoa pessoa = Pessoa();
  pessoa.setNome(nome);
  pessoa.setPeso(peso);
  pessoa.setAltura(altura);




}