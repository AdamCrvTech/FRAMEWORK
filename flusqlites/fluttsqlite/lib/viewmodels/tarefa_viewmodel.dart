import 'package:flutter/material.dart';

import '../models/tarefa.dart';

class TarefaViewModel extends ChangeNotifier {
  List<Tarefa> tarefas = [];

  void adicionarTarefa(String titulo) {
    if (titulo.isEmpty) {
      return;
    }

    tarefas.add(
      Tarefa(
        titulo: titulo,
      ),
    );

    notifyListeners();
  }

  // Marca ou desmarca uma tarefa.
  void atualizarStatus(Tarefa tarefa) {
    tarefa.concluida = !tarefa.concluida;

    notifyListeners();
  }
}
