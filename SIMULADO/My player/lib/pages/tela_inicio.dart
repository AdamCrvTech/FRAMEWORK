import 'package:flutter/material.dart';
import '../widgets/card_jogo.dart';
import '../widgets/menu_lateral.dart';
import 'tela_perfil.dart';
import 'tela_favoritos.dart';

const corVerde = Color.fromARGB(255, 80, 145, 7);
const corRosa = Colors.pinkAccent;

class Musica {
  final String titulo;
  final String artista;
  final Color corFundo;

  const Musica({
    required this.titulo,
    required this.artista,
    required this.corFundo,
  });
}

class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

  @override
  State<TelaInicio> createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  final TextEditingController _controleNome = TextEditingController();
  double Volume = 0;
  bool rodandoMusica = false;

  final List<Musica> _musicasFavoritadas = [];

  final List<Musica> _playlist = [
    const Musica(
      titulo: 'Ainda ontem chorei de saudade',
      artista: 'João Mineiro & Marciano',
      corFundo: Colors.white,
    ),
    const Musica(
      titulo: 'Boate Azul',
      artista: 'Joaquim & Manuel',
      corFundo: Color.fromARGB(255, 245, 245, 220),
    ),
    const Musica(
      titulo: 'Telefone Mudo',
      artista: 'Trio Parada Dura',
      corFundo: Color.fromARGB(255, 240, 248, 255),
    ),
  ];

  int _indiceMusicaAtual = 0;

  void mudarRodandoMusica() {
    setState(() {
      rodandoMusica = !rodandoMusica;
    });
  }

  void proximaMusica() {
    setState(() {
      _indiceMusicaAtual = (_indiceMusicaAtual + 1) % _playlist.length;
    });
  }

  void musicaAnterior() {
    setState(() {
      _indiceMusicaAtual =
          (_indiceMusicaAtual - 1 + _playlist.length) % _playlist.length;
    });
  }

  void alternarFavorito(Musica musica) {
    setState(() {
      if (_musicasFavoritadas.contains(musica)) {
        _musicasFavoritadas.remove(musica);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Removida dos favoritos!')),
        );
      } else {
        _musicasFavoritadas.add(musica);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Adicionada aos favoritos! ❤️')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final musicaAtual = _playlist[_indiceMusicaAtual];
    final bool jaerafavorito = _musicasFavoritadas.contains(musicaAtual);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SÓ MODÃO RAIZ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: corVerde,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // CORRIGIDO: Agora passa a lista e a função de remover para o MenuLateral funcionar!
      drawer: MenuLateral(
        musicasFavoritas: _musicasFavoritadas,
        onRemoverMusica: (musicaALimpar) {
          setState(() {
            _musicasFavoritadas.remove(musicaALimpar);
          });
        },
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'VOLUME',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: corVerde,
                ),
              ),
              Slider(
                value: Volume,
                min: 0,
                max: 10,
                thumbColor: corRosa,
                activeColor: corVerde,
                divisions: 10,
                label: Volume.toInt().toString(),
                onChanged: (novoValor) {
                  setState(() {
                    Volume = novoValor;
                  });
                },
              ),
              Icon(
                Icons.music_note_outlined,
                size: 100,
                color: jaerafavorito ? Colors.red : corRosa,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      color: corRosa,
                      iconSize: 36,
                      onPressed: musicaAnterior,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: corRosa,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                            rodandoMusica ? Icons.pause : Icons.play_arrow),
                        iconSize: 36,
                        onPressed: mudarRodandoMusica,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      color: corRosa,
                      iconSize: 36,
                      onPressed: proximaMusica,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                musicaAtual.titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: corVerde,
                ),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: () => alternarFavorito(musicaAtual),
                borderRadius: BorderRadius.circular(15),
                child: CardJogo(
                  icone: jaerafavorito ? Icons.favorite : Icons.favorite_border,
                  corIcone: jaerafavorito ? Colors.red : corRosa,
                  titulo: 'Favoritar Modão',
                  descricao: jaerafavorito
                      ? 'Remover esta música'
                      : 'Clique para salvar esta música.',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaFavoritas(
                        musicasFavoritas: _musicasFavoritadas,
                        onRemover: (musicaALimpar) {
                          setState(() {
                            _musicasFavoritadas.remove(musicaALimpar);
                          });
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: corVerde),
                icon: const Icon(Icons.list, color: Colors.white),
                label: const Text('Ver Minha Lista',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
