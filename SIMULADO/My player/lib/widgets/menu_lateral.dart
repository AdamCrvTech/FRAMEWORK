import 'package:flutter/material.dart';
import '../pages/tela_perfil.dart';
import '../pages/tela_inicio.dart';
import '../pages/tela_favoritos.dart'; 

class MenuLateral extends StatelessWidget {
  // O menu agora pede a lista e a função de remover vindas da TelaInicio
  final List<Musica> musicasFavoritas;
  final Function(Musica) onRemoverMusica;

  const MenuLateral({
    super.key,
    required this.musicasFavoritas,
    required this.onRemoverMusica,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: corRosa, // Usa a corRosa que está global na TelaInicio
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.sports_esports,
                    size: 35,
                    color: corVerde,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Caçador de joguinhos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Biblioteca de jogos',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: corVerde),
            title: const Text('Início'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TelaInicio()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: corVerde),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TelaPerfil(
                    nomeJogador: "adam",
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: corVerde),
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaFavoritas(
                    musicasFavoritas: musicasFavoritas,
                    onRemover: (musicaALimpar) {
                      // Avisa a TelaInicio para remover a música e atualizar a tela
                      onRemoverMusica(musicaALimpar); 
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
