import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  // O DevicePreview ajuda a testar o layout em diferentes tamanhos de tela (responsividade)
  runApp(DevicePreview(
    builder: (context) => MeuApp(),
  ));
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Remove a faixa de "debug" do canto da tela
      theme: ThemeData(
        useMaterial3: true, // Ativa o design system mais moderno do Google
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, 
          secondary:
              Color(0xff00ff00), // Definindo uma cor secundária para usar no app
        ),
      ),
      home: TeladDesign(),
    );
  }
}

class TeladDesign extends StatelessWidget {
  var perguntaSelecionada = 0;

  void responder() {
    perguntaSelecionada++;
    print('Pergunta Respondida. Nova posição: $perguntaSelecionada');
  }

  @override
  Widget build(BuildContext context) {
    // Buscando as cores do tema definido lá no MaterialApp (Boa prática!)
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      // Scaffold fornece a estrutura básica (Barra superior, corpo, etc)
      appBar: AppBar(
        title: const Text(
          'Adam Rafael - 22501959',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 10,
          ),
        ),
        backgroundColor: cores.secondary, // Usando a cor secundária do tema
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Usando componentes customizados para manter o código limpo
          const TextosPergunta("Velozes & Furiosos"),

          // Image.network carrega imagens da internet
          Container( 
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff00ff00), width: 12)
            ),
            //padding: const EdgeInsets.all(20.0),
            child:Image.network(
              "https://static.wikia.nocookie.net/velozes-e-furiosos/images/a/aa/Velozes_e_Furiosos_-_Capa.jpg/revision/latest/thumbnail/width/360/height/360?cb=20180305235641&path-prefix=pt-br",
              height: 250,
              width: 200,
              fit:
                  BoxFit.cover, // Faz a imagem preencher o espaço sem distorcer
            ),
          ),
            const SizedBox(height: 50),

            Container(
              decoration: BoxDecoration(
              border: Border.all( color: Colors.transparent, width: 12)
            ),
              child: Text("\t\tÉ uma franquia de ação global centrada em carros, família e assaltos, distribuída pela Universal Pictures. A saga principal, que inclui Fast X (2023), continuará com  Velozes e Furiosos 11 (titulado Fast Forever), com estreia confirmada para 17 de março de 2028, marcando o encerramento da saga de Dominic Toretto.",
              style: TextStyle(
              fontSize: 14,                  // Tamanho da fonte
              fontWeight: FontWeight.bold, // Negrito      
              height: 1.5,
            )
          
              
                  
  ),
),

            const SizedBox(height: 50),

          // Chamando o widget de botão com textos diferentes
          BotaoResposta('Ver mais detalhes'),
          const SizedBox(height: 50),
           // Espaçamento vazio no final
        ],
      ),
    );
  }
}

// --- COMPONENTES SEPARADOS (CUSTOM WIDGETS) ---

class BotaoResposta extends StatelessWidget {
  final String texto;

  // 'super.key' ajuda o Flutter a rastrear o widget na árvore de elementos
  const BotaoResposta(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Faz o botão ocupar a largura total disponível
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          // Aqui vai a lógica de quando o usuário clica
          print('Resposta escolhida: $texto');
        },
        child: Text(texto),
      ),
    );
  }
}

class TextosPergunta extends StatelessWidget {
  final String texto;

  const TextosPergunta(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
