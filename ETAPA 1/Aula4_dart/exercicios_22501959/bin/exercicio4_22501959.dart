import 'package:exercicios_22501959/exercicios_22501959.dart' as exercicios_22501959;
import 'dart:io'; 


void fazerConvite({required String nome, String hora = "18:00"}) {
  print("Olá $nome, a festa vai acontecer as $hora!");
}

void main(){
  fazerConvite(nome: "Queijo", hora: "18:00");

  fazerConvite(hora: "18:00", nome: "Queijo");
  
}