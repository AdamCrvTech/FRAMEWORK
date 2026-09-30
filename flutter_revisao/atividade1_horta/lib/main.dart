import 'package:flutter/material.dart';
import 'pages/tela_horta.dart';

void main() => runApp(const HortaApp());

class HortaApp extends StatelessWidget {
  const HortaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horta Inteligente',
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: const TelaHorta(),
    );
  }
}
