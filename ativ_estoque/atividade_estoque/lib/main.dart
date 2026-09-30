import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/usuario_provider.dart';
import 'providers/produto_provider.dart';

import 'pages/login_page.dart';

void main() {

  runApp(
    const MeuAplicativo(),
  );

}

class MeuAplicativo extends StatelessWidget {

  const MeuAplicativo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (context) =>
              UsuarioProvider(),
        ),

        ChangeNotifierProvider(
          create: (context) =>
              ProdutoProvider(),
        ),

      ],

      child: MaterialApp(

        debugShowCheckedModeBanner: false,

        title: 'Controle de Estoque',

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: const LoginPage(),

      ),

    );

  }

}