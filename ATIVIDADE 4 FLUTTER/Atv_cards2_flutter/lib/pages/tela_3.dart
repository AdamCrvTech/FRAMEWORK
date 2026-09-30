import "package:flutter/material.dart";
import '../widgets/card_icone.dart';

class TelaTres extends StatefulWidget {
  const TelaTres({super.key});

  @override
  State<TelaTres> createState() => _TelaTresState();
}

class _TelaTresState extends State<TelaTres> {
  String mensagemNaTela = "A Porsche foi fundada oficialmente em 1931 por Ferdinand Porsche em Stuttgart, na Alemanha, atuando inicialmente como um estúdio de design e consultoria de engenharia. No entanto, a marca como fabricante de carros esportivos nasceu em 1948, com a homologação do primeiro veículo próprio: o Porsche 356 No. 1 Roadster, criado por seu filho, Ferry Porsche.Você gostaria de conhecer detalhes sobre a criação de algum modelo específico, como o icônico Porsche 911, ou sobre a trajetória da marca nas pistas de corrida?";

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