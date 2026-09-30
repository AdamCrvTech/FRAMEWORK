import 'package:exercicios_22501959/exercicios_22501959.dart' as exercicios_22501959;
import 'dart:io'; 



class Filme {
  final String titulo; // Atributo
  final String genero; // Atributo

  // Construtor com parâmetros nomeados e obrigatórios
  Filme({required this.titulo, required this.genero});

  // Método para exibir informações
  void mostraDados() {
    print('O titulo do seu filme é: $titulo, O genero do seu filme é: $genero');
  }
}

void main() {
  // Instanciando objetos
  Filme f1 = Filme(titulo: "Baby Driver" , genero: "ação");
  f1.mostraDados();

  Filme f2 = Filme(titulo: "Jhon Wick" , genero: "ação");
  f2.mostraDados();
}



