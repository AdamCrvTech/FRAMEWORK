import 'package:flutter/material.dart';
import 'tela_relatorio.dart';

class TelaHorta extends StatefulWidget {
  const TelaHorta({super.key});
  @override
  State<TelaHorta> createState() => _TelaHortaState();
}

class _TelaHortaState extends State<TelaHorta> {
  final nomeController = TextEditingController();
  int agua = 50;

  String get situacao {
    if (agua <= 30) return 'A planta precisa de água.';
    if (agua <= 70) return 'A planta está bem cuidada.';
    return 'Cuidado com o excesso de água.';
  }

  Color get corPainel {
    if (agua <= 30) return Colors.red.shade100;
    if (agua <= 70) return Colors.green.shade100;
    return Colors.blue.shade100;
  }

  void alterarAgua(int valor) {
    setState(() => agua = (agua + valor).clamp(0, 100));
  }

  void cuidados() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Text('Cuidados da planta', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('• Não deixar a planta sem luz.'),
            Text('• Evitar excesso de água.'),
            Text('• Verificar a terra diariamente.'),
          ]),
        ),
      ),
    );
  }

  void relatorio() {
    if (nomeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Informe o nome da planta.')));
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => TelaRelatorio(nome: nomeController.text.trim(), agua: agua, situacao: situacao)));
  }

  @override
  void dispose() { nomeController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final grande = MediaQuery.sizeOf(context).width >= 600;
    return Scaffold(
      appBar: AppBar(title: const Text('Horta Inteligente')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(controller: nomeController, decoration: const InputDecoration(labelText: 'Nome da planta', border: OutlineInputBorder(), prefixIcon: Icon(Icons.edit))),
          const SizedBox(height: 20),
          LayoutBuilder(builder: (context, constraints) => grande
              ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [_infoIcon(), const SizedBox(width: 30), Expanded(child: _painel())])
              : Column(children: [_infoIcon(), const SizedBox(height: 16), _painel()])),
          const SizedBox(height: 20),
          Wrap(spacing: 12, runSpacing: 12, alignment: WrapAlignment.center, children: [
            FilledButton.icon(onPressed: () => alterarAgua(-10), icon: const Icon(Icons.remove), label: const Text('Diminuir água')),
            FilledButton.icon(onPressed: () => alterarAgua(10), icon: const Icon(Icons.add), label: const Text('Aumentar água')),
            OutlinedButton(onPressed: cuidados, child: const Text('Ver cuidados')),
            OutlinedButton(onPressed: relatorio, child: const Text('Ver relatório')),
          ]),
        ]),
      ),
    );
  }

  Widget _infoIcon() => const Column(children: [Icon(Icons.local_florist, size: 90, color: Colors.green), Text('Planta')]);

  Widget _painel() => AnimatedContainer(duration: const Duration(milliseconds: 350), width: double.infinity, padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: corPainel, borderRadius: BorderRadius.circular(20)), child: Column(children: [Text('$agua%', style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold)), Text(situacao, textAlign: TextAlign.center)]));
}
