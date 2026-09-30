import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/pedido_viewmodel.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final clienteController = TextEditingController();
  final pratoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final valorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // carrega os pedidos salvos no banco ao abrir a tela
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PedidoViewModel>().carregar();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PedidoViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Pedidos - The Bear')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: clienteController,
              decoration: const InputDecoration(labelText: 'Cliente'),
            ),
            TextField(
              controller: pratoController,
              decoration: const InputDecoration(labelText: 'Prato'),
            ),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantidade'),
            ),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Valor unitário'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                int? quantidade = int.tryParse(quantidadeController.text);
                double? valor =
                    double.tryParse(valorController.text.replaceAll(',', '.'));

                if (clienteController.text.isEmpty ||
                    pratoController.text.isEmpty ||
                    quantidade == null ||
                    valor == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha todos os campos corretamente.')),
                  );
                  return;
                }

                await context.read<PedidoViewModel>().adicionar(
                      clienteController.text,
                      pratoController.text,
                      quantidade,
                      valor,
                    );

                clienteController.clear();
                pratoController.clear();
                quantidadeController.clear();
                valorController.clear();
              },
              child: const Text('Cadastrar pedido'),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: vm.pedidos.length,
                itemBuilder: (context, index) {
                  final pedido = vm.pedidos[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cliente: ${pedido.cliente} | Prato: ${pedido.prato}'),
                          Text('Quantidade: ${pedido.quantidade} | Total: ${pedido.totalFormatado}'),
                          Text('Classificação: ${pedido.classificacao}'),
                          Text('Status: ${pedido.status}'),
                          Row(
                            children: [
                              TextButton(
                                onPressed: pedido.status == 'Pendente'
                                    ? () => context.read<PedidoViewModel>().finalizar(pedido.id!)
                                    : null,
                                child: const Text('FINALIZAR'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    context.read<PedidoViewModel>().excluir(pedido.id!),
                                child: const Text('EXCLUIR'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
