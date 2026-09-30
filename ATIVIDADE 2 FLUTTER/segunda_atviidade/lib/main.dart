import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MeuApp(),
  ));
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: const Color(0xff00ff00),
        ),
      ),
      home: const TeladDesign(), 
    );
  }
}

class TeladDesign extends StatefulWidget {
  const TeladDesign({super.key});

  @override
  State<TeladDesign> createState() => _TeladDesignState();
}


class _TeladDesignState extends State<TeladDesign> {

  String mensagemDetalhes = 'Clique no botão abaixo para saber mais!';


  void alterarMensagem() {
    setState(() {
      mensagemDetalhes = 'Esse filme marcou uma geração por sua história, corridas icônicas de rua e o início do conceito de família!';
    });
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
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
        backgroundColor: cores.secondary,
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Column(
          children: [
            const TextosPergunta("Velozes & Furiosos"),
            
            Container( 
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff00ff00), width: 12)
              ),
              child: Image.network(
                "https://static.wikia.nocookie.net/velozes-e-furiosos/images/a/aa/Velozes_e_Furiosos_-_Capa.jpg/revision/latest/thumbnail/width/360/height/360?cb=20180305235641&path-prefix=pt-br",
                height: 250,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            
            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 12)
              ),
              child: const Text(
                "\t\tÉ uma franquia de ação global centrada em carros, família e assaltos, distribuída pela Universal Pictures. A saga principal, que inclui Fast X (2023), continuará com Velozes e Furiosos 11 (titulado Fast Forever), com estreia confirmada para 17 de março de 2028, marcando o encerramento da saga de Dominic Toretto.",
                style: TextStyle(
                  fontSize: 14,                  
                  fontWeight: FontWeight.bold,       
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 10),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                color: cores.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    mensagemDetalhes, 
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: alterarMensagem, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: cores.secondary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Ver mais detalhes'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
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
      margin: const EdgeInsets.all(16.0),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}