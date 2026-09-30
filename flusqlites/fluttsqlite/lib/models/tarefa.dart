class Tarefa {
  String titulo;
  int id;
  bool concluida;

  Tarefa({
    this.id,
    required this.titulo,
    this.concluida = false,
  });
}
