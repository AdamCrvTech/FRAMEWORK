import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../services/produto_service.dart';

class ProdutoProvider extends ChangeNotifier {
  ProdutoService service = ProdutoService();
  List<Produto> produtos = [];

  Future<void> carregarProdutos() async {
    produtos = await service.listarProdutos();
    notifyListeners();
  }

  Future<void> cadastrarProduto(
    String nome,
    String categoria,
    int quantidade,
    double preco,
  ) async {
    Produto produto = Produto(
      nome: nome,
      categoria: categoria,
      quantidade: quantidade,
      preco: preco,
    );

    await service.cadastrarProduto(produto);
    await carregarProdutos();
  }

  Future<void> aumentarQuantidade(Produto produto) async {
    int novaQuantidade = produto.quantidade + 1;
    await service.atualizarQuantidade(
      produto.id!,
      novaQuantidade,
    );
    produto.quantidade = novaQuantidade;
    notifyListeners();
  }

  Future<void> diminuirQuantidade(Produto produto) async {
    if (produto.quantidade <= 0) {
      return;
    }
    int novaQuantidade = produto.quantidade - 1;
    await service.atualizarQuantidade(
      produto.id!,
      novaQuantidade,
    );
    produto.quantidade = novaQuantidade;
    notifyListeners();
  }

  Future<void> excluirProduto(Produto produto) async {
    await service.excluirProduto(produto.id!,);
    produtos.remove(produto);
    notifyListeners();
  }
}