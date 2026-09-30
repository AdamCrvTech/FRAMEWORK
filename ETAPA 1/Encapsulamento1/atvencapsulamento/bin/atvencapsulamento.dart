import 'package:atvencapsulamento/atvencapsulamento.dart';
import 'dart:io';

void main() {
  Termostato meuTermostato = Termostato();
  stdout.write("Digite qual a temperatura que você deseja colocar:");
  double tempInicial = double.parse(stdin.readLineSync()!);


  print('Temperatura inicial: ${meuTermostato.temperatura}°C');

  try {
    print("Tentando ajustar para $tempInicial.0°C...");
    meuTermostato.temperatura = tempInicial;
    print('Sucesso! Nova temperatura: ${meuTermostato.temperatura}°C');
  } catch (error) {
    print('Erro: $error');
  }
}
