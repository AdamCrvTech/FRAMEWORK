import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/usuario.dart';
import '../models/pedido.dart';

class BancoService {
  static Database? _banco;

  Future<Database> get banco async {
    if (_banco != null) return _banco!;
    String caminho = join(await getDatabasesPath(), 'the_bear.db');
    _banco = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, versao) async {
        await db.execute('''
          CREATE TABLE usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            email TEXT,
            senha TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE pedidos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            cliente TEXT,
            prato TEXT,
            quantidade INTEGER,
            valor_unitario REAL,
            status TEXT
          )
        ''');
      },
    );
    return _banco!;
  }

  // ---------- USUARIOS ----------
  Future<void> inserirUsuario(Usuario usuario) async {
    final db = await banco;
    await db.insert('usuarios', usuario.toMap());
  }

  Future<bool> emailExiste(String email) async {
    final db = await banco;
    final lista = await db.query('usuarios', where: 'email = ?', whereArgs: [email]);
    return lista.isNotEmpty;
  }

  Future<Usuario?> buscarUsuario(String email, String senha) async {
    final db = await banco;
    final lista = await db.query(
      'usuarios',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );
    if (lista.isEmpty) return null;
    return Usuario.fromMap(lista.first);
  }

  // ---------- PEDIDOS ----------
  Future<void> inserirPedido(Pedido pedido) async {
    final db = await banco;
    await db.insert('pedidos', pedido.toMap());
  }

  Future<List<Pedido>> listarPedidos() async {
    final db = await banco;
    final lista = await db.query('pedidos', orderBy: 'id DESC');
    return lista.map((mapa) => Pedido.fromMap(mapa)).toList();
  }

  Future<void> finalizarPedido(int id) async {
    final db = await banco;
    await db.update('pedidos', {'status': 'Finalizado'}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> excluirPedido(int id) async {
    final db = await banco;
    await db.delete('pedidos', where: 'id = ?', whereArgs: [id]);
  }
}
