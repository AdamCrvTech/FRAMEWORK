import 'package:flutter/material.dart';
class CartaoObjeto extends StatelessWidget {
  final String nome, local, situacao; final Color cor; final VoidCallback onPressed;
  const CartaoObjeto({super.key, required this.nome, required this.local, required this.situacao, required this.cor, required this.onPressed});
  @override Widget build(BuildContext context) => Card(color: cor, child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Icon(Icons.search, size: 40), const SizedBox(height: 8), Text(nome, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text('Local: $local'), Text('Situação: $situacao'), const SizedBox(height: 8), FilledButton(onPressed: onPressed, child: Text(situacao == 'Aguardando retirada' ? 'Marcar como devolvido' : 'Desfazer')),
  ])));
}
