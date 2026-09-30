import 'package:flutter/material.dart';

class TelaRelatorio extends StatelessWidget {
  final String nome, situacao;
  final int agua;
  const TelaRelatorio({super.key, required this.nome, required this.agua, required this.situacao});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Relatório')),
    body: SingleChildScrollView(padding: const EdgeInsets.all(24), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Nome da planta: $nome', style: const TextStyle(fontSize: 20)),
      const SizedBox(height: 12), Text('Nível de água: $agua%', style: const TextStyle(fontSize: 20)),
      const SizedBox(height: 12), Text('Situação: $situacao', style: const TextStyle(fontSize: 20)),
      const SizedBox(height: 30), FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Voltar')),
    ])),
  );
}
