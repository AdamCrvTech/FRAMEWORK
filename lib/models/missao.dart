class Missao {
  String? id;
  String titulo;
  String dificuldade;
  int pontos;
  bool concluida;
  String data;

  Missao({
    this.id,
    required this.titulo,
    required this.dificuldade,
    required this.pontos,
    this.concluida = false,
    required this.data,
  });

  Missao.fromMap(Map<String, dynamic> map, String id)
      : id = id,
        titulo = map['titulo'] ?? '',
        dificuldade = map['dificuldade'] ?? 'Fácil',
        pontos = map['pontos'] ?? 0,
        concluida = map['concluida'] ?? false,
        data = map['data'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'dificuldade': dificuldade,
      'pontos': pontos,
      'concluida': concluida,
      'data': data,
    };
  }
}