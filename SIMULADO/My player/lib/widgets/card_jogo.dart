import 'package:flutter/material.dart';

class CardJogo extends StatelessWidget {
  final IconData icone;
  final Color? corIcone; // Adicionado para receber a nova cor
  final String titulo;
  final String descricao;

  const CardJogo({
    super.key,
    required this.icone,
    this.corIcone, // Adicionado no construtor (opcional para não quebrar outros códigos)
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(
              icone,
              size: 50,
              color: corIcone, // Aplicada a cor no ícone aqui
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(descricao),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
