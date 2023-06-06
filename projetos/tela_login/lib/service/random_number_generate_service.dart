import 'dart:math';

class RandomNumberGenerateService{

    static int gerarRandom( int numeroMaximo){
      Random numeroAleatorio = Random();
      return numeroAleatorio.nextInt(numeroMaximo);
  }
}