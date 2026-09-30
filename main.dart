import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/pedido_viewmodel.dart';
import 'pages/login_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => PedidoViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Bear',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const LoginPage(),
    );
  }
}
