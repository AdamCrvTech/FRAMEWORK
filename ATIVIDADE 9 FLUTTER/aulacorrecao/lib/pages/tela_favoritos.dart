import 'package:flutter/material.dart';
import '../widgets/menu_lateral.dart';

class TelaFavoritos extends StatelessWidget {
  const TelaFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    const corVerde = Color.fromARGB(255, 80, 145, 7);
    const corRosa = Colors.pinkAccent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const MenuLateral(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.directions_car, size: 40, color: corVerde),
              title: Text('The crew 2'),
              subtitle: Text('Carrinho'),
              trailing: Icon(Icons.favorite),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.directions_car, size: 40, color: corVerde),
              title: Text('Forza Horizon 5'),
              subtitle: Text('Carrinho Vrum Vrum'),
              trailing: Icon(Icons.favorite, color: corRosa),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.directions_car, size: 40, color: corVerde),
              title: Text('Need For Speed underground 2'),
              subtitle: Text('Carrinho Vrum vrum vrum'),
              trailing: Icon(Icons.favorite, color: corRosa),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: corVerde,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
            ),
          )
        ],
      ),
    );
  }
}
