import 'package:flutter/material.dart';
import '../widgets/menu_lateral.dart';

const corVerde = Color.fromARGB(255, 80, 145, 7);
const corRosa = Colors.pinkAccent;

class TelaPerfil extends StatefulWidget {
  final String nomeJogador;

  const TelaPerfil({super.key, required this.nomeJogador});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  late TextEditingController _controllerNome;

  @override
  void initState() {
    super.initState();
    _controllerNome = TextEditingController(text: widget.nomeJogador);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil do Jogador',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: corVerde, 
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: corRosa, 
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 16),
              
              TextField(
                controller: _controllerNome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: corVerde, 
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nome do jogador',
                ),
              ),
              
              const Text(
                'Grande gostador de carros.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              
              const Card(
                child: ListTile(
                  leading: Icon(Icons.emoji_events, color: corRosa),
                  title: Text('Pontuação do Jogador:'),
                  trailing: Text(
                    '12.500 pts',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.check_circle, color: corVerde), 
                  title: Text('Jogos zerados:'),
                  trailing: Text(
                    '42',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: corRosa, 
                  foregroundColor: Colors.white, 
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
