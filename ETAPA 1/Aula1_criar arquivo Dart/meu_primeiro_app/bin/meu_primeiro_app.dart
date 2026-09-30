import 'package:meu_primeiro_app/meu_primeiro_app.dart' as meu_primeiro_app;
import 'dart:io';  // Importa a biblioteca para entrada (teclado) e saída (monitor).

void main(List<String> arguments) {
  print('Hello world: ${meu_primeiro_app.calculate()}!');
  var num1 = 15;
  var num2 = 15;
  print(num1 + num2);

  
  stdout.write('Digite sua idade para descobrir se é par ou ímpar! '); // stdout.write exibe o texto no terminal sem pular linha, deixando o cursor na frente.

  String? entrada = stdin.readLineSync();// stdin.readLineSync() pausa o programa e espera você digitar algo e dar Enter.
  // O resultado é guardado na variável 'entrada' como um texto (String?).

  int num3 = int.parse(entrada!);   // int.parse converte o texto ("25") em um número inteiro real (25) para podermos fazer contas.
  // O '!' garante ao Dart que o usuário realmente digitou algo (não é nulo).

  // O operador '%' (módulo) calcula o RESTO da divisão por 2.
  // Se o resto for IGUAL (==) a zero, significa que o número é divisível por 2.
  if (num3 % 2 == 0) {
    // Se a condição acima for verdadeira, executa este bloco.
    print('É par!');
  } 
  else {
    // Se a condição do 'if' for falsa (resto diferente de zero), executa este bloco.
    print("É ímpar!");
  }

  stdout.write('Digite seu nome: ');
  String? nome = stdin.readLineSync();

  stdout.write('Digite seu idade: ');
  String? entradaIdade = stdin.readLineSync();

  int idade = int.parse(entradaIdade!);

  if(idade > 18)
  {
    print("Olá, ${nome}! Você já pode dirigir!");
  } 
  else{
    print("Olá, ${nome}! Infelizmente voce ainda não pode dirigir!");
  }
  


}









