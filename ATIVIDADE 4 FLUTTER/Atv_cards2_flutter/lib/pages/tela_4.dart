import "package:flutter/material.dart";
import '../widgets/card_icone.dart';

class TelaQuatro extends StatefulWidget {
  const TelaQuatro({super.key});

  @override
  State<TelaQuatro> createState() => _TelaQuatroState();
}

class _TelaQuatroState extends State<TelaQuatro> {
  String mensagemNaTela = "O Porsche 911 é um lendário esportivo com motor traseiro produzido desde 1964. No Brasil, a atual geração traz modelos que variam de R2,1 milhões), até os híbridos Turbo S de 711 cavalos, vendidos por 2,15 milhões de reais.";

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