import "package:flutter/material.dart";
import '../widgets/card_icone.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key});

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  String mensagemNaTela = "Antes da criação da própria marca, o engenheiro austríaco Ferdinand Porsche já era um visionário no automobilismo. Em 1900, ele apresentou um dos primeiros carros híbridos do mundo. Em 1931, abriu seu escritório de engenharia na cidade de Stuttgart, na Alemanha. O grande marco inicial ocorreu em 1934, quando projetou e desenvolveu o Volkswagen (Fusca), um projeto encomendado pelo governo alemão.Após a Segunda Guerra Mundial e a prisão de Ferdinand, seu filho Ferry Porsche assumiu a liderança da empresa. Com o objetivo de construir um esportivo do seu próprio gosto, ele lançou, em 8 de junho de 1948, o Porsche 356. O modelo utilizava componentes mecânicos do Fusca, mas com uma carroceria leve e aerodinâmica, marcando o início oficial da Porsche como marca de automóveis.";

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