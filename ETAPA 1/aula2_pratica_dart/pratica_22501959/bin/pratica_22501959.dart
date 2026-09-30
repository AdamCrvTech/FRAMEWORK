import 'package:pratica_22501959/pratica_22501959.dart' as pratica_22501959;
import 'dart:io';

void main() {
//   1. Sistema de Radar de Velocidade
// Crie um programa que monitore a velocidade de um veículo em uma via.
// Variáveis de entrada: velocidadeMedida e velocidadeMaximaVia.
// Regras:
// Se a velocidade for até 10% acima do limite: Isento de multa.
// Se a velocidade for entre 11% e 20% acima do limite: Multa Leve (R$ 130,00).
// Se a velocidade for acima de 20% do limite: Multa Grave (R$ 880,00 + Apreensão da CNH).
// Saída: Exiba a situação do condutor e o valor da multa, se houver.

    // stdout.write("Digite a velocidade em que voce estava:");
    // int velocidadeMedida = int.parse(stdin.readLineSync()!);
    // int velocidadeMaximaVia = 120;

    // if(velocidadeMedida <= velocidadeMaximaVia * 1.1){
    //   print("Você está isento a multas!");
    // }
    // else if(velocidadeMedida >= velocidadeMaximaVia * 1.11 && velocidadeMedida <= velocidadeMaximaVia * 1.20){
    //   print("Multa leve de R: 130,00");
    // }
    // else {
    //   print("Multa grave de R: 880,00 + apreensão da CNH");
    // }


// 2. O Jogo do "FizzBuzz" (Clássico de Entrevistas)
// Utilizando uma estrutura de repetição de 1 a 50, o programa deve seguir as seguintes regras de impressão:
// Se o número for múltiplo de 3: Imprima "Fizz".
// Se o número for múltiplo de 5: Imprima "Buzz".
// Se for múltiplo de 3 e 5 ao mesmo tempo: Imprima "FizzBuzz".
// Caso contrário: Imprima o próprio número.

  //  for(int i = 1; i <=  50; i++){
  //   if(i % 3 == 0 && i % 5 ==0){
  //     print("FizzBuzz");
  //   }
  //   else if(i % 5 == 0){
  //     print("Buzz");
  //   }
    
  //   else if(i % 3 ==0){
  //     print("Fizz");
  //   }
  //   else{
  //     print(i);
  //   }
  //  }



// 3. Simulador de Combate (RPG)
// Crie um sistema de combate entre um "Herói" e um "Monstro".
// Atributos: Ambos possuem vida (ex: 100) e ataque (ex: 15).
// Lógica: Use um laço while para que eles se ataquem por turnos (o monstro ataca o herói e vice-versa).
// Condição de parada: O laço deve rodar até que a vida de um dos dois chegue a zero ou menos.
// Saída: A cada turno, mostre quanta vida cada um ainda tem. No final, anuncie o vencedor.    
  int vidaHeroi = 100;
  int vidaMonstro = 100;
  int ataqueHeroi = 15;
  int ataqueMonstro = 15;

  



}

