// import 'package:meu_app/funcoes/utils.dart' as utils;

void main(){
  var fatorialCalculado = fatorial(10);
  print(fatorialCalculado);

}

int fatorial (int numero){
  if (numero ==1){
    return 1;
  }
  return numero * fatorial(numero - 1);
}