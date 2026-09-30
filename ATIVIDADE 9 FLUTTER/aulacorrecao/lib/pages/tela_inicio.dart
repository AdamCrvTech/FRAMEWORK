import 'package:flutter/material.dart';
import '../widgets/card_jogo.dart';
import '../widgets/menu_lateral.dart';
import 'tela_perfil.dart';

// Definição das cores solicitadas
const corVerde = Color.fromARGB(255, 80, 145, 7);
const corRosa = Colors.pinkAccent;

class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

  @override
  State<TelaInicio> createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  final TextEditingController _controleNome = TextEditingController();

  @override
  void dispose() {
    _controleNome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Joguinhos ponto com',
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
              const Icon(
                Icons.sports_esports,
                size: 100,
                color: corRosa,
              ),
              const SizedBox(height: 16),
              const Text(
                'Bem-vindo ao Joguinhos.com!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: corVerde,
                ),
              ),
              const SizedBox(height: 10),
              
              TextField(
                controller: _controleNome,
                decoration: const InputDecoration(
                  labelText: 'Nome do Jogador',
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person, color: corVerde),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: corVerde, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: corRosa,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_controleNome.text.trim().isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaPerfil(nomeJogador: _controleNome.text),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, animal, digita um nome!'),
                          backgroundColor: corVerde,
                        ),
                      );
                    }
                  },
                  child: const Text('Cadastrar Jogador', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 10),
              const CardJogo(
                icone: Icons.explore,
                corIcone: corRosa, 
                titulo: 'Explorar',
                descricao: 'Descubra novos jogos, mundos e personagens.',
              ),
              const SizedBox(height: 12),
              const CardJogo(
                icone: Icons.favorite,
                corIcone: corRosa,
                titulo: 'Favoritos',
                descricao: 'Organize os jogos que você mais gosta.',
              ),
              const SizedBox(height: 12),
              const CardJogo(
                icone: Icons.emoji_events,
                corIcone: corRosa, 
                titulo: 'Conquistas',
                descricao: 'Acompanhe seus desafios e recompensas.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
