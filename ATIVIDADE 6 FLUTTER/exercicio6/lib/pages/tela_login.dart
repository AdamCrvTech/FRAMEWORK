import 'package:aularevisao/pages/tela_home.dart';
import 'package:flutter/material.dart';
import 'tela_cadastro.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController =
      TextEditingController(); //Pega o texto digitado para o email
  final TextEditingController senhaController =
      TextEditingController(); //Pega o texto digitado para a senha

  bool emailValido(String email) {
    final regex = RegExp(
        r'^[\w\.-]+@[\w\.-]+\.\w+$'); //Tem que ter texto antes do @, Tem que ter o simbolo @,
    return regex.hasMatch(email);
  }

  String mensagemErro = ""; //String que vamos usar para definir erros

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Icon(
          Icons.lock,
          size: 40,
          color: Colors.black,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Tela de Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Digite seu email e senha para acessar o app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                //Cria um campo para digitar o texto
                controller: emailController, //Liga o campo ao controlador
                keyboardType:
                    TextInputType.emailAddress, //Define tipo de teclado
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Digite seu email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                //Cria um campo para digitar o texto
                controller: senhaController, //Liga o campo ao controlador
                obscureText: true, //Esconde o texto digitado
                keyboardType:
                    TextInputType.emailAddress, //Define tipo de teclado
                decoration: const InputDecoration(
                  labelText: "Senha",
                  hintText: "Digite sua senha",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  String email = emailController
                      .text; //Vai definir se o usuario colocou o email certo
                  String senha = senhaController
                      .text; //Vai definir se o usuario colocou a senha certo

                  if (!email.contains('@')) {
                    setState(() {
                      mensagemErro =
                          'Digite um email válido'; //Se o email nao ter o @ vai dar erro
                    });
                  } else if (senha.isEmpty) {
                    setState(() {
                      mensagemErro =
                          'Digite sua senha'; //Se a senha tiver vazia vai dar erro
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaHome(),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text('Entrar'),
              ),
              const SizedBox(height: 20),
              Text(
                mensagemErro,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaCadastro(),
                    ),
                  );
                },
                icon: const Icon(Icons.person_add),
                label: const Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
