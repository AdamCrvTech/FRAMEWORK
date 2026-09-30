import 'dart:ffi';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/tarefa.dart';

class TarefaService {
  Future<Database> abrirBanco() async {
    //descobre onde o dispositivo permite salvar banco de dados
    final String caminhoBanco = await getDatabasesPath();
    print("LOCAL DO BANCO: $caminhoBanco");

    //Junta a pasta encontrada com o nome do arquivo
    final caminho = join(caminhoBanco, "tarefas.db");
    print("BANCO COMPLETO: $caminho");

    //Abre o banco de dados
    return openDatabase(caminho, version: 1, onCreate: (db, version) async {
      await db.execute(
        '''
          CREATE TABLE tarefas(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            concluida INTEGER NOT NULL)
        ''',
      );
    });
  }

  Future<void> inserirTarefas(Tarefa tarefa) async {
    final db = await abrirBanco();

    await db.insert(
      "tarefas",
      {
        "titulo": tarefa.titulo,
        "Concluída": tarefa.concluida ? 1 : 0,
      },
    );
  }

  Future<List<Tarefa>> listarTarefas() async {
    //Abre o banco
    final db = await abrirBanco();

    //Equivale a SELECT * FROM tarefas
    final dados = await await db.query("tarefas");

    //O sqlite devolve maps.
    //Aqui vamos transformar cada map criado em um obejeto tarefa
    return dados.map((item) {
      return Tarefa(
        id: item["id"] as int,
        titulo: item["titulo"] as String,
        concluida: item["concluida"] == 1,
      );
    }).toList();
  }

  Future<void> atualizarStatusTarefa(Tarefa tarefa) async {
    // Abre o banco
    final db = await abrirBanco();

    await db.update(
      "tarefas",
      {"concluida": tarefa.concluida ? 1 : 0},
      where: "id = ?",
      whereArgs: [
        tarefa.id,
      ],
    );
  }
}
