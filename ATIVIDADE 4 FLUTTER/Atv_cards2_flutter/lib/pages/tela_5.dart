import "package:flutter/material.dart";
import '../widgets/card_icone.dart';
import '../pages/tela_home.dart';

class TelaCinco extends StatefulWidget {
  const TelaCinco({super.key});

  @override
  State<TelaCinco> createState() => _TelaCincoState();
}

class _TelaCincoState extends State<TelaCinco> {
  String mensagemNaTela = "A estratégia de eletrificação da Porsche combina alto desempenho e transição energética. Atualmente, a marca oferece uma trindade de motores: a combustão, híbridos plug-in e 100% elétricos. A montadora reduziu a pressa na eletrificação de alguns esportivos menores para focar na viabilidade de veículos de ultra-alta performance.";

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'O melhor - 22501959',
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
      body: Column(
        children: [
          Container(
            child: Image.network(
              "https://stimg.cardekho.com/images/carexteriorimages/630x420/Porsche/911/11757/1762933836560/front-left-side-47.jpg",
              height: 250,
              width: 350,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 12)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              mensagemNaTela,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}