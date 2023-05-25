
double calcularDesconto(double valor, double desconto, bool percentual){
  if(valor<=0){
    throw ArgumentError('O Valor do produto não pode ser zero');
  }
  if(desconto<=0){
    throw ArgumentError('O Desconto não pode ser zero');
  }

  if(percentual){
    return valor - (valor * desconto / 100);
  }
  return valor - desconto;
}

String convertToUpper(String text){
  return text.toUpperCase();
}

