import 'package:flutter/material.dart';
import 'package:atividade_estoque/providers/produto_provider.dart';
import 'package:provider/provider.dart';
import '../providers/usuario_provider.dart';
import 'cadastro_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Future<void> entrar() async {
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos.'),
        ),
      );

      return;
    }

    bool resultado = await context.read<UsuarioProvider>().fazerLogin(email, senha);

    if (!mounted) {
      return;
    }

    if (resultado) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail ou senha incorretos.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: Column(
            children: [
              const SizedBox(height: 30),

              const Icon(
                Icons.lock,
                size: 80,
              ),

              const SizedBox(height: 20),

              const Text(
                'ÁREA RESTRITA',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

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

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: entrar,

                  child: const Text(
                    'ENTRAR',
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Ainda não possui uma conta?',
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CadastroPage(),
                    ),
                  );
                },

                child: const Text(
                  'CRIAR CONTA',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}