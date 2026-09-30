import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'widgets/card_icone.dart';
import './pages/tela_home.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MeuApp(),
  ));
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: const Color(0xffe71a23),
        ),
      ),
      home: const TeladDesign(),
    );
  }
}



