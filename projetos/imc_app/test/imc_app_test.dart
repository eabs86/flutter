
import 'package:imc_app/models/pessoa.dart';
import 'package:test/test.dart';

void main() {
  var pessoa = Pessoa("", 100.0, 2.0); 
  test('calculo do imc', () {
    expect(pessoa.calculoIMC(), 25.0);
  });
}
