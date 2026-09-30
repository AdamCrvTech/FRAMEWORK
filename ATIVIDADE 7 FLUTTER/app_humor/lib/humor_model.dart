import 'package:flutter/material.dart';

class Humor { 
  final String nome; final Color cor; final Color corTexto; final IconData icone; final String texto; final String mensagemExtra; final String labelBotao; 
  
  const Humor({required this.nome, required this.cor, required this.corTexto, required this.icone, required this.texto, required this.mensagemExtra, required this.labelBotao
  }); 
}

const List<Humor> humores = [
  Humor(
    nome: 'Feliz',
    cor: Color(0xFFFDD835),
    corTexto: Color(0xFF5D4037),
    icone: Icons.sentiment_very_satisfied,
    texto: 'Hoje estou feliz!',
    mensagemExtra: 'Você escolheu o humor Feliz.',
    labelBotao: 'Feliz',
  ),
  Humor(
    nome: 'Triste',
    cor: Color(0xFF546E7A),
    corTexto: Colors.white,
    icone: Icons.sentiment_very_dissatisfied,
    texto: 'Que vontade de chorar no banho...',
    mensagemExtra: 'Você escolheu o humor Triste.',
    labelBotao: 'Triste',
  ),
  Humor(
    nome: 'Animado',
    cor: Color(0xFFFF6F00),
    corTexto: Colors.white,
    icone: Icons.bolt,
    texto: 'Ativei o modo aspirador de pó! ❄️🧂💎',
    mensagemExtra: 'Você escolheu o humor Animado.',
    labelBotao: 'Animado',
  ),
  Humor(
    nome: 'Calmo',
    cor: Color(0xFF64B5F6),
    corTexto: Color(0xFF0D2137),
    icone: Icons.cloud,
    texto: 'Paz total 🚬🍁',
    mensagemExtra: 'Você escolheu o humor Calmo.',
    labelBotao: 'Calmo',
  ),
  Humor(
    nome: 'Bravo',
    cor: Color(0xFFD32F2F),
    corTexto: Colors.white,
    icone: Icons.whatshot,
    texto: 'Fogo no butão total!',
    mensagemExtra: 'Você escolheu o humor Bravo.',
    labelBotao: 'Bravo',
  ),
  Humor(
    nome: 'Surpreso',
    cor: Color(0xFF7B1FA2),
    corTexto: Colors.white,
    icone: Icons.celebration,
    texto: 'UAAAAAAAAAAAAAAAAAAAAAAAAAAU, QUE SUPRESA!!',
    mensagemExtra: 'Você escolheu o humor Surpreso.',
    labelBotao: 'Surpreso',
  ),
];