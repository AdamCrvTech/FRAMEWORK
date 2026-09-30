import 'package:atividade_lanchonete/pages/tela_home.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


void main() { //inicio do programa
  runApp(
    DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget { //Tipo estático
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //Configurar geral
      debugShowCheckedModeBanner: false,

      theme: ThemeData( //Tema Geral
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          secondary: Colors.amber,
        )
      ),

      home: const TelaHome(), //Primeira tela do App
    );
  }
}


