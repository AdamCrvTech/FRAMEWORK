import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/usuario.dart';

class UsuarioService {
  static Database? banco;
  Future<Database> getDatabase() async {
    if (banco != null) {
      return banco!;
    }

    String caminho = 'estoque.db';

    banco = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            senha TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE produtos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            categoria TEXT NOT NULL,
            quantidade INTEGER NOT NULL,
            preco REAL NOT NULL
          )
        ''');
      },
    );
    return banco!;
  }

  Future<bool> verificarEmail(
    String email,
  ) async {

    Database db = await getDatabase();
    print('SELECT → Verificando e-mail: $email',);

    List<Map<String, dynamic>> resultado = await db.query(
      'usuarios',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (resultado.isNotEmpty) {
      print('SELECT → E-mail já cadastrado',);
      return true;
    }

    print('SELECT → E-mail disponível',);
    return false;
  }

  Future<int?> cadastrarUsuario(
    Usuario usuario,
  ) async {

    Database db = await getDatabase();

    bool emailExiste = await verificarEmail(usuario.email,);

    if (emailExiste) {
      return null;
    }
    int id = await db.insert('usuarios', usuario.toMap(),);
    print('INSERT → Usuário cadastrado: ${usuario.nome}',);
    return id;
  }

  Future<Usuario?> fazerLogin(
    String email,
    String senha,
  ) async {

    Database db = await getDatabase();

    print('SELECT → Procurando usuário: $email',);

    List<Map<String, dynamic>> resultado = await db.query(
      'usuarios',
      where: 'email = ? AND senha = ?',
      whereArgs: [
        email,
        senha,
      ],
    );

    if (resultado.isNotEmpty) {
      Map<String, dynamic> dados = resultado[0];

      Usuario usuario = Usuario(
        id: dados['id'],
        nome: dados['nome'],
        email: dados['email'],
        senha: dados['senha'],
      );

      print('SELECT → Usuário encontrado: ${usuario.nome}',);
      return usuario;
    }

    print('SELECT → Usuário não encontrado',);
    return null;
  }
}