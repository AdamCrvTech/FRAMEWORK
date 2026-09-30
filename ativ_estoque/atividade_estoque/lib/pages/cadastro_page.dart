import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuario_provider.dart';

class CadastroPage extends StatefulWidget {

  const CadastroPage({
    super.key,
  });

  @override
  State<CadastroPage> createState() =>
      _CadastroPageState();

}

class _CadastroPageState extends State<CadastroPage> {

  TextEditingController nomeController =
      TextEditingController();

  TextEditingController emailController =
      TextEditingController();

  TextEditingController senhaController =
      TextEditingController();

  Future<void> cadastrar() async {

    String nome =
        nomeController.text.trim();

    String email =
        emailController.text.trim();

    String senha =
        senhaController.text.trim();

    if (
      nome.isEmpty ||
      email.isEmpty ||
      senha.isEmpty
    ) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha todos os campos.',
          ),
        ),
      );

      return;

    }

    bool cadastro =
        await context
            .read<UsuarioProvider>()
            .cadastrarUsuario(
              nome,
              email,
              senha,
            );

    if (!mounted) {
      return;
    }

    if (cadastro) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Cadastro realizado com sucesso!',
          ),
        ),
      );

      Navigator.pop(context);

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Não foi possível cadastrar.',
          ),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Cadastro',
        ),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(25),

          child: Column(

            children: [

              const SizedBox(height: 20),

              const Icon(
                Icons.person_add,
                size: 70,
              ),

              const SizedBox(height: 20),

              const Text(
                'CRIAR CONTA',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: cadastrar,
                  child: const Text(
                    'CADASTRAR',
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