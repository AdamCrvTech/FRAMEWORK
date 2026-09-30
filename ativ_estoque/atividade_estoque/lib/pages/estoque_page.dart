import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produto.dart';
import '../providers/produto_provider.dart';

class EstoquePage extends StatefulWidget {

  const EstoquePage({
    super.key,
  });

  @override
  State<EstoquePage> createState() =>
      _EstoquePageState();

}

class _EstoquePageState
    extends State<EstoquePage> {

  @override
  void initState() {

    super.initState();

    context
        .read<ProdutoProvider>()
        .carregarProdutos();

  }

  String formatarPreco(double preco) {

    return 'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}';

  }

  void excluir(Produto produto) {

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text(
            'Excluir produto',
          ),

          content: Text(
            'Deseja excluir ${produto.nome}?',
          ),

          actions: [

            TextButton(
              onPressed: () {

                Navigator.pop(context);

              },
              child: const Text(
                'CANCELAR',
              ),
            ),

            ElevatedButton(
              onPressed: () async {

                await context
                    .read<ProdutoProvider>()
                    .excluirProduto(
                      produto,
                    );

                if (!mounted) {
                  return;
                }

                Navigator.pop(context);

              },
              child: const Text(
                'EXCLUIR',
              ),
            ),

          ],

        );

      },

    );

  }

  @override
  Widget build(BuildContext context) {

    ProdutoProvider provider =
        context.watch<ProdutoProvider>();

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'ESTOQUE',
        ),
      ),

      body: provider.produtos.isEmpty

          ? const Center(
              child: Text(
                'Nenhum produto cadastrado.',
              ),
            )

          : ListView.builder(

              padding: const EdgeInsets.all(15),

              itemCount:
                  provider.produtos.length,

              itemBuilder: (context, index) {

                Produto produto =
                    provider.produtos[index];

                bool estoqueBaixo =
                    produto.quantidade <= 3;

                return Card(

                  margin:
                      const EdgeInsets.only(
                    bottom: 15,
                  ),

                  child: Padding(

                    padding:
                        const EdgeInsets.all(15),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Row(

                          children: [

                            Expanded(

                              child: Text(
                                produto.nome,
                                style:
                                    const TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                            ),

                            IconButton(
                              onPressed: () {
                                excluir(produto);
                              },
                              icon: const Icon(
                                Icons.delete,
                              ),
                            ),

                          ],

                        ),

                        Text(
                          produto.categoria,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          formatarPreco(
                            produto.preco,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(

                          children: [

                            const Text(
                              'Quantidade:',
                            ),

                            IconButton(
                              onPressed: () {

                                provider
                                    .diminuirQuantidade(
                                  produto,
                                );

                              },
                              icon: const Icon(
                                Icons.remove,
                              ),
                            ),

                            Text(
                              '${produto.quantidade}',
                              style:
                                  const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              onPressed: () {

                                provider
                                    .aumentarQuantidade(
                                  produto,
                                );

                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),

                          ],

                        ),

                        if (estoqueBaixo)

                          const Text(
                            'ESTOQUE BAIXO',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                      ],

                    ),

                  ),

                );

              },

            ),

    );

  }

}