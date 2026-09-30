import 'package:flutter/material.dart';
import '../models/missao.dart';
import '../services/missao_service.dart';

class MissaoProvider with ChangeNotifier { // Ao escrever isso está dizendo "A classe MissaoProvider é uma classe normal, mas quero herdar todas as ferramentas do ChangeNotifier"
  final MissaoService _service = MissaoService();
  List<Missao> _missoes = [];
  bool _carregando = false;

  List<Missao> get missoes => _missoes;
  bool get carregando => _carregando;

  int get pontuacaoTotal {
    return _missoes
        .where((m) => m.concluida)
        .fold(0, (soma, m) => soma + m.pontos);  .
  }

  // Define os pontos conforme a dificuldade
  int calcularPontos(String dificuldade) {
    switch (dificuldade) {
      case 'Médio':
        return 20;
      case 'Difícil':
        return 30;
      case 'Fácil':
      default:
        return 10;
    }
  }

  Future<void> carregarMissoes() async {
    _carregando = true;
    notifyListeners(); //O notifyListeners() funciona como um "alarme". Ele avisa a HomePage (e qualquer outra tela conectada ao Provider) de que os dados mudaram.

    _missoes = await _service.buscarTodas();

    _carregando = false;
    notifyListeners();
  }

  Future<void> adicionarMissao(String titulo, String dificuldade) async {
    int pontos = calcularPontos(dificuldade);

    DateTime agora = DateTime.now();     // Formata a data atual (Ex: 23/09/2026)
    String dataFormatada = "${agora.day.toString().padLeft(2, '0')}/${agora.month.toString().padLeft(2, '0')}/${agora.year}";

    Missao novaMissao = Missao(
      titulo: titulo,
      dificuldade: dificuldade,
      pontos: pontos,
      concluida: false,
      data: dataFormatada,
    );

    await _service.adicionar(novaMissao);
    await carregarMissoes();
  }

  Future<void> concluirMissao(Missao missao) async {
    missao.concluida = true;
    await _service.atualizar(missao);
    notifyListeners();
  }

  Future<void> excluirMissao(String id) async {
    await _service.excluir(id);
    _missoes.removeWhere((m) => m.id == id);
    notifyListeners();
  }
}