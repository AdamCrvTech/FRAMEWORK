import 'package:flutter/material.dart';
import 'TelaPageRoute.dart';
import 'TelaAnimatedContainer.dart';
import 'tela_opacidade.dart';
import 'telaAnimationController.dart';

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animação'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Permite rolar a tela quando houver multiplos botões
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Animação implícita e explícita',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Escolha um tipo de animação.',
                  textAlign: TextAlign.center,
                ),
                 const SizedBox(height: 30),
                ElevatedButton.icon(
                  //Botão com icone
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TelaAnimatedContainer();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.animation),
                  label: const Text('AnimatedContainer'),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  //Botão com icone
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TelaAnimatedOpacity();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.animation),
                  label: const Text('Opacidade'),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  //Botão com icone
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TelaPageRoute();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('PageRoute'),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  //Botão com icone
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TelaAnimationController();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('AnimatedController'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}