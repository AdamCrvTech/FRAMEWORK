import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/produto_provider.dart';

class CadastroProdutoPage extends StatefulWidget {

  const CadastroProdutoPage({
    super.key,
  });

  @override
  State<CadastroProdutoPage> createState() =>
      _CadastroProdutoPageState();

}

class _CadastroProdutoPageState
    extends State<CadastroProdutoPage> {

  TextEditingController nomeController =
      TextEditingController();

  TextEditingController categoriaController =
      TextEditingController();

  TextEditingController quantidadeController =
      TextEditingController();

  TextEditingController precoController =
      TextEditingController();

  Future<void> cadastrar() async {

    String nome =
        nomeController.text.trim();

    String categoria =
        categoriaController.text.trim();

    int? quantidade =
        int.tryParse(
      quantidadeController.text,
    );

    double? preco =
        double.tryParse(
      precoController.text.replaceAll(
        ',',
        '.',
      ),
    );

    if (
      nome.isEmpty ||
      categoria.isEmpty ||
      quantidade == null ||
      preco == null
    ) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha os dados corretamente.',
          ),
        ),
      );

      return;

    }

    await context
        .read<ProdutoProvider>()
        .cadastrarProduto(
          nome,
          categoria,
          quantidade,
          preco,
        );

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Produto cadastrado!',
        ),
      ),
    );

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Cadastro de Produto',
        ),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(25),

          child: Column(

            children: [

              const SizedBox(height: 20),

              const Icon(
                Icons.inventory,
                size: 70,
              ),

              const SizedBox(height: 20),

              const Text(
                'CADASTRAR PRODUTO',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: categoriaController,
                decoration: const InputDecoration(
                  labelText: 'Categoria',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: quantidadeController,
                keyboardType:
                    TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantidade',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: precoController,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Preço',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: cadastrar,
                  child: const Text(
                    'CADASTRAR PRODUTO',
                  ),
                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}