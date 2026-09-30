import 'dart:core';


abstract class Video {
  final int _classificacao = 0;
  final String titulo;

  Video(this.titulo);
 
  int get classificacao => _classificacao;

}