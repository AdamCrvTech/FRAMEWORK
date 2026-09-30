import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'tela_humor.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MoodApp(),
    ),
  );
}

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood App',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TelaHumor(),
    );
  }
}