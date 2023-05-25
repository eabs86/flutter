// import 'dart:js_util';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testes_app/classes/viacep.dart';
import 'package:testes_app/testes_app.dart' as app;
import 'package:test/test.dart';

import 'testes_app_test.mocks.dart';


// ATENÇÃO: TODOS OS TESTES EM DART PRECISAM ACABAR COM A PALAVRA "test"
@GenerateMocks([MockViaCep])
void main() {
  test('calcula o desconto do produto SEM porcentagem', () { //cria o método de teste
    expect(app.calcularDesconto(1000,150,false), equals(850)); //é esperado que o resultado dê 850. Está correto
  });

  test('calcula o desconto do produto SEM porcentagem passando o valor do produto zerado', () { //cria o método de teste
    expect(() => app.calcularDesconto(0,150,false),
     throwsA(TypeMatcher<ArgumentError>())); //
  });

  test('calcula o desconto do produto COM porcentagem', () { //cria o método de teste 
    expect(app.calcularDesconto(1000,10,true),equals(900)); // é esperado que o resultado dê 850.
    //Porém o resultado certo é 900. Vai dar erro
  });

    test('calcula o desconto do produto COM porcentagem, porém zerado', () { //cria o método de teste 
    expect(() => app.calcularDesconto(1000,0,true),
    throwsA(TypeMatcher<ArgumentError>())); 
  });

  test('Verifica se há conversão para upper case do texto', () {
    expect(app.convertToUpper('teste'), equals('TESTE'));
  });

  //teste com endpoint "fake" http. Não chamamos endpoints reais durante os testes
  test('Retornar CEP', () async {
    // ViaCep viacep = ViaCep();
    MockMockViaCep mockMockViaCep = MockMockViaCep();
    when(mockMockViaCep.retornarCEP('54220000'))
        .thenAnswer((realInvocation) => Future.value(
          {
            "cep": "54220-000",
            "logradouro": "Rua Leonardo da Vinci",
            "complemento":"",
            "bairro": "Curado", 
            "localidade":"Jaboatão dos Guararapes",
            "uf": "PE",
            "ibge": "2607901",
            "gia":"",
            "ddd": "81",
            "siafi": "2457"
          }
        ));

    var body = await mockMockViaCep.retornarCEP("54220000");
    expect(body["bairro"], equals("Curado"));
  });



}

//necessidade de criar uma classe intermediária que vai herdar e implementar a ViaCep.
// precisa usar o implements porque precisa do retorna cep
// existe a necessidade de colocar uma notation na main (@GenerateMocks)
// @GenerateMocks([MockViaCep])
// Depois é necessário executar ocomando dart run build_runner build --delete-conflicting-outputs

class MockViaCep extends Mock implements ViaCep{}

