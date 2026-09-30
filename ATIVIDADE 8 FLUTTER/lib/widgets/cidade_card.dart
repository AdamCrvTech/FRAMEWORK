import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';

class CidadeCard extends StatelessWidget {
  final CidadeClima cidade;

  const CidadeCard({super.key, required this.cidade});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                cidade.imagem,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              cidade.nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(cidade.temperatura),
            Text(cidade.condicao),
            Text(
              cidade.icone,
              style: const TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}