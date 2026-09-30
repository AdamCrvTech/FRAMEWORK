import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuario_provider.dart';

import 'login_page.dart';
import 'estoque_page.dart';
import 'cadastro_produto_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    UsuarioProvider provider =
        context.watch<UsuarioProvider>();

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Controle de Estoque',
        ),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(25),

          child: Column(

            children: [

              const SizedBox(height: 30),

              Text(
                'Olá, ${provider.usuario?.nome}!',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'CONTROLE DE ESTOQUE',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const EstoquePage(),
                      ),
                    );

                  },
                  child: const Text(
                    'VER PRODUTOS',
                  ),
                ),

              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CadastroProdutoPage(),
                      ),
                    );

                  },
                  child: const Text(
                    'CADASTRAR PRODUTO',
                  ),
                ),

              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: OutlinedButton(
                  onPressed: () {

                    context
                        .read<UsuarioProvider>()
                        .sair();

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage(),
                      ),
                      (route) => false,
                    );

                  },
                  child: const Text(
                    'SAIR',
                  ),
                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}