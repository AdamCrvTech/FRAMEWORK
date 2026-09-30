import 'package:sqflite/sqflite.dart';
import '../models/produto.dart';
import 'usuario_service.dart';

class ProdutoService {
  UsuarioService usuarioService = UsuarioService();
  Future<Database> getDatabase() async {
    return await usuarioService.getDatabase();
  }

  Future<int> cadastrarProduto(Produto produto) async {
    Database db = await getDatabase();
    return await db.insert('produtos', produto.toMap(),);
  }

  Future<List<Produto>> listarProdutos() async {
    Database db = await getDatabase();
    List<Map<String, dynamic>> resultado = await db.query('produtos',orderBy: 'id DESC');
    List<Produto> produtos = [];

    for (Map<String, dynamic> dados in resultado) {
      Produto produto = Produto(
        id: dados['id'],
        nome: dados['nome'],
        categoria: dados['categoria'],
        quantidade: dados['quantidade'],
        preco: dados['preco'],
      );
      produtos.add(produto);
    }
    return produtos;
  }

  Future<void> atualizarQuantidade(
  int id,
  int novaQuantidade,
) async {
  Database db = await getDatabase();

  await db.update(
    'produtos',
    {
      'quantidade': novaQuantidade,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
  print('UPDATE → Produto ID: $id');
  print('Nova quantidade: $novaQuantidade');
}

  Future<void> excluirProduto(int id) async {
  Database db = await getDatabase();

  await db.delete(
    'produtos',
    where: 'id = ?',
    whereArgs: [id],
  );
  print('DELETE → Produto excluído: $id');
}
}