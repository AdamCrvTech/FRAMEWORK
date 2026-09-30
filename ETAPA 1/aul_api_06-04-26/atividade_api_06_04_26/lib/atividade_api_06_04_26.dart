import 'dart:convert';



class Livro {
  String titulo;
  int paginas;
  List<String> viloes;


  Livro(this.titulo, this.paginas, this.viloes);

  void exibirDetalhes(){
  print("----- Detalhes do Livro -----");
  print("Titulo:");
  print("Número de páginas:");
  print("Vilões:");
  print("Url:");
}
}

