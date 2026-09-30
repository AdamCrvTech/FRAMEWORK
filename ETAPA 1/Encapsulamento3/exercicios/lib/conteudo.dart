abstract class Conteudo {
  int id;
  String titulo;
  int _classificacao = 0;

  Conteudo(this.id, this.titulo);

  int get classificacaoIndicativa => _classificacao;

  set validarClassificacao(int valClassificacao) {
    if (valClassificacao < 0 || valClassificacao > 18) {
      throw Exception("Classificação inválida");
    } else {
      _classificacao = valClassificacao; 
      print("Classificação aceita!");
    }
  }

  void darPlay();
  Map<String, dynamic> toJson();
}


class Filme extends Conteudo {

  Filme(int id, String titulo) : super(id, titulo);


  @override
  void darPlay() {
    print("Reproduzindo o filme: $titulo");
  }

  @override
  Map<String, dynamic> toJson(){
    return {"id": id, "titulo": titulo, "classificacao": classificacaoIndicativa};
 }
}

class Serie extends Conteudo {
  int temporadas;

  Serie(int id, String titulo, this.temporadas) : super(id, titulo);

  @override
  void darPlay() {
    print("Iniciando a série $titulo com $temporadas temporadas");
  }

    @override
  Map<String, dynamic> toJson(){
    return {"titulo": titulo, "classificacao": classificacaoIndicativa, "Temporadas": temporadas};
 }
}