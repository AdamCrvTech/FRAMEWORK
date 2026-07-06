import 'package:exercicios_22501959/exercicios_22501959.dart' as exercicios_22501959;
import 'dart:io'; 

void main() {
  var calcularDesconto = (double valor) => valor * 0.9;

  var mensagemBoasVindas = (String nome) => "Olá, $nome!";

  print("Preço com desconto: ${calcularDesconto(100)}");
  
  print(mensagemBoasVindas("Queijaria do Jorjao"));
}