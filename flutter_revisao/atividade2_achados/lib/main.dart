import 'package:flutter/material.dart';
import 'pages/tela_cadastro_objeto.dart';
void main() => runApp(const AchadosApp());
class AchadosApp extends StatelessWidget {
  const AchadosApp({super.key});
  @override Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner: false, title: 'Achados e Perdidos', theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true), home: const TelaCadastroObjeto());
}
