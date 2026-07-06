import 'package:flutter/material.dart';

class TelaPedido extends StatelessWidget {
  final TextEditingController produto = TextEditingController();
  final TextEditingController endereco = TextEditingController();
  final TextEditingController nomeClienteController = TextEditingController();

  TelaPedido({
    super.key,
  }); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lanchonete Rapidona!"),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.amber.withAlpha(30),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.location_on,
                  size: 100,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nomeClienteController,
                decoration: const InputDecoration(
                  hintText: 'Digite seu nome',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: produto,
                decoration: const InputDecoration(
                  hintText: 'Digite o produto desejado...',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: endereco,
                decoration: const InputDecoration(
                  hintText: 'Digite seu endereço...',
                ),
              ),
              const Spacer(), 
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 5),
                      content: Column(
                        children: [ 
                          Text('Pedido feito no nome de: ${nomeClienteController.text}.'), 
                          Text('Produto: ${produto.text}.'),
                          Text('Será entregue em: ${endereco.text}.'),
                        ],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Adicionar pedido',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
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
