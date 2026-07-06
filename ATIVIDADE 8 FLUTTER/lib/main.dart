import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'pages/tela_clima.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      home: TelaClima(),
    );
  }
}