import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/missao_provider.dart';
import 'detalhes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController missaoController = TextEditingController();
  String dificuldadeSelecionada = 'Fácil';

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<MissaoProvider>().carregarMissoes(),
    );
  }

  @override
  void dispose() {
    missaoController.dispose();
    super.dispose();
  }

  String _getEstrelas(String dificuldade) {
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
        title: const Text(
          'Central de Missões do seu melhor aluno!',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: missaoController,
              decoration: const InputDecoration(
                labelText: 'Digite o título da missão, genio da bola',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: dificuldadeSelecionada,
              decoration: const InputDecoration(
                labelText: 'Selecione a dificuldade',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Fácil', child: Text('Fácil (10 pts)')),
                DropdownMenuItem(value: 'Médio', child: Text('Médio (20 pts)')),
                DropdownMenuItem(value: 'Difícil', child: Text('Difícil (30 pts)')),
              ],
              onChanged: (valor) {
                if (valor != null) {
                  setState(() {
                    dificuldadeSelecionada = valor;
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (missaoController.text.trim().isEmpty) return;

                  final provider = context.read<MissaoProvider>();

                  await provider.adicionarMissao(
                    missaoController.text.trim(),
                    dificuldadeSelecionada,
                  );

                  missaoController.clear();
                  setState(() {
                    dificuldadeSelecionada = 'Fácil';
                  });
                },
                child: const Text(
                  'Cadastrar missão',
                ),
              ),
            ),
            const SizedBox(height: 15),
            Consumer<MissaoProvider>(
              builder: (context, provider, child) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PONTOS CONQUISTADOS:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${provider.pontuacaoTotal} pts',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Consumer<MissaoProvider>(
                builder: (
                  context,
                  provider,
                  child,
                ) {
                  if (provider.carregando) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (provider.missoes.isEmpty) {
                    return const Center(
                      child: Text(
                        'Nenhuma missão cadastrada.',
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.missoes.length,
                    itemBuilder: (context, index) {
                      final missao = provider.missoes[index];

                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetalhesPage(
                                  missao: missao,
                                ),
                              ),
                            );
                          },
                          leading: Checkbox(
                            value: missao.concluida,
                            onChanged: missao.concluida
                                ? null
                                : (valor) async {
                                    await provider.concluirMissao(missao);

                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Missão concluída! Você conquistou ${missao.pontos} pontos, genio da bola.',
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    }
                                  },
                          ),
                          title: Text(
                            missao.titulo,
                            style: TextStyle(
                              decoration: missao.concluida
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          subtitle: Text(
                            '${_getEstrelas(missao.dificuldade)} | ${missao.pontos} pontos | ${missao.data}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                            ),
                            onPressed: () {
                              if (missao.id != null) {
                                provider.excluirMissao(
                                  missao.id!,
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
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