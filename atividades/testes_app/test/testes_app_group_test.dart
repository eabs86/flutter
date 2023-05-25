import 'package:testes_app/testes_app.dart' as app;
import 'package:test/test.dart';

// ATENÇÃO: TODOS OS TESTES EM DART PRECISAM ACABAR COM A PALAVRA "test"

void main() {

  //teste em grupo
  group ("Calcula o valor do produto com desconto:",(){

      var valuesToTest = {
        {'valor':1000,'desconto':150, 'percentual':false}:850,
        {'valor':1000,'desconto':15, 'percentual':true}:850
      };

      valuesToTest.forEach((values, expected) {
        
        test('Entrada: $values Esperado: $expected', () {
          
          expect(
            app.calcularDesconto(double.parse(values['valor'].toString()),
            double.parse(values['desconto'].toString()),
            values['percentual'] == true), 
            equals(expected));
        });
      });
  });

  group ("Calcula o valor do produto informando valores zerados de preço e/ou desconto. Deve gerar erros.",(){

    var valuesToTest = {
      {'valor':0,'desconto':150, 'percentual':false},
      {'valor':1000,'desconto':0, 'percentual':true}
    };

    for (var values in valuesToTest) {
      
      test('Entrada: $values', () {
        
        expect(
          () => app.calcularDesconto(double.parse(values['valor'].toString()),
          double.parse(values['desconto'].toString()),
          values['percentual'] == true), 
          throwsA(TypeMatcher<ArgumentError>()));
      });
    }
});

}
