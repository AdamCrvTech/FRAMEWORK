class Produto {
  int? id;
  String nome;
  String categoria;
  int quantidade;
  double preco;

  Produto({this.id, required this.nome, required this.categoria, required this.quantidade, required this.preco,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'categoria': categoria,
      'quantidade': quantidade,
      'preco': preco,
    };

  }

}