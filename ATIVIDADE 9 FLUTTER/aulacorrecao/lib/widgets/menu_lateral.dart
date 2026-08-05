import 'package:flutter/material.dart';
import 'package:aulacorrecao/pages/tela_favoritos.dart';
import 'package:aulacorrecao/pages/tela_perfil.dart';
import 'package:aulacorrecao/pages/tela_inicio.dart';


class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
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
                    color: Color.fromARGB(255, 80, 145, 7),
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
            leading: const Icon(Icons.home, color: Color.fromARGB(255, 80, 145, 7)),
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
            leading: const Icon(Icons.person, color: Color.fromARGB(255, 80, 145, 7)),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                 MaterialPageRoute(
                          builder: (context) => TelaPerfil(nomeJogador: "adam",),
                        ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Color.fromARGB(255, 80, 145, 7)),
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaFavoritos()),
              );
            },
          ),
        ],
      ),
    );
  }
}
