import 'package:flutter/material.dart';
import 'tela_inicio.dart'; 

class TelaFavoritas extends StatefulWidget {
  final List<Musica> musicasFavoritas;
  final Function(Musica) onRemover;

  const TelaFavoritas({
    super.key, 
    required this.musicasFavoritas, 
    required this.onRemover,
  });

  @override
  State<TelaFavoritas> createState() => _TelaFavoritasState();
}

class _TelaFavoritasState extends State<TelaFavoritas> {
  final Color corRosa = Colors.pinkAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Favoritas'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: widget.musicasFavoritas.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.music_off, size: 80, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text(
                    'Nenhuma música favorita ainda!',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.musicasFavoritas.length,
              itemBuilder: (context, index) {
                final musica = widget.musicasFavoritas[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: corRosa.withAlpha(30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.music_note, color: corRosa),
                    ),
                    title: Text(
                      musica.titulo,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(musica.artista),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          widget.onRemover(musica);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
