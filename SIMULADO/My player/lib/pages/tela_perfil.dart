import 'package:aulacorrecao/pages/tela_inicio.dart';
import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  final String nomeJogador;

  const TelaPerfil({super.key, required this.nomeJogador});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController estiloController = TextEditingController();

  String nomeSalvo = '';
  String estiloSalvo = '';
  String mensagemErro = '';

  @override
  void initState() {
    super.initState();

    nomeController.text = widget.nomeJogador;
  }

  void salvarPerfil() {
    final String nome = nomeController.text.trim();
    final String estilo = estiloController.text.trim();

    if (nome.isEmpty || estilo.isEmpty) {
      setState(() {
        mensagemErro = 'Preencha todos os campos.';
      });
      return;
    }

    setState(() {
      nomeSalvo = nome;
      estiloSalvo = estilo;
      mensagemErro = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    estiloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.account_circle,
              size: 100,
              color: corRosa,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(
                  Icons.person,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: corRosa,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: corVerde,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: estiloController,
              decoration: const InputDecoration(
                labelText: 'Estilo musical Favorito',
                prefixIcon: Icon(
                  Icons.library_music,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: corRosa,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: corVerde,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            if (mensagemErro.isNotEmpty)
              Text(
                mensagemErro,
                style: TextStyle( // Removido 'const' pois usa a variável corVerde
                  color: corVerde,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: salvarPerfil,
              style: ElevatedButton.styleFrom(
                backgroundColor: corVerde, // Botão principal com a cor verde
                foregroundColor: Colors.white, // Cor do texto do botão
              ),
              child: const Text(
                'Salvar perfil',
              ),
            ),
            const SizedBox(height: 30),
            if (nomeSalvo.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: corRosa.withAlpha(30), // Deixa o fundo rosa bem clarinho e suave
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: corRosa, width: 1.5), // Borda rosa sutil
                ),
                child: Column(
                  children: [
                    Icon( // Removido 'const' pois usa a variável corRosa
                      Icons.check_circle,
                      size: 45,
                      color: corRosa, // Ícone com a sua cor rosa
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Perfil salvo!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: corRosa, // Texto de destaque em rosa
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Nome: $nomeSalvo',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Estilo favorito: $estiloSalvo',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: corRosa), // Borda do botão voltar em rosa
                foregroundColor: corRosa, // Texto do botão voltar em rosa
              ),
              child: const Text(
                'Voltar para o player',
              ),
            ),
          ],
        ),
      ),
    );
  }
}