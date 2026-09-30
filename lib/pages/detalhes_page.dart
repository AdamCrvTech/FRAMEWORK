import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/missao.dart';
import '../providers/missao_provider.dart';

class DetalhesPage extends StatelessWidget {
  final Missao missao;

  const DetalhesPage({super.key, required this.missao});

  String getEstrelas(String dificuldade) {
    switch (dificuldade) {
      case 'Médio':
        return '⭐⭐';
      case 'Difícil':
        return '⭐⭐⭐';
      default:
        return '⭐';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DETALHES DA MISSÃO'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Título:", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text(missao.titulo, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text("Dificuldade:", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text("${getEstrelas(missao.dificuldade)} ${missao.dificuldade}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            const Text("Pontos:", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text("${missao.pontos} pontos", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            const Text("Data de Criação:", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text(missao.data, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            const Text("Status:", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text(
              missao.concluida ? "Concluída" : "Pendente",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: missao.concluida ? Colors.green : Colors.orange,
              ),
            ),
            const Spacer(),
            if (!missao.concluida)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () async {
                    final provider = Provider.of<MissaoProvider>(context, listen: false);
                    await provider.concluirMissao(missao);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Missão concluída! Você conquistou ${missao.pontos} pontos."),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("CONCLUIR MISSÃO", style: TextStyle(fontSize: 16)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}