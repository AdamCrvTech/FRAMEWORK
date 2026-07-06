import "package:flutter/material.dart";
import '../widgets/card_icone.dart';
import '../pages/tela_2.dart';
import '../pages/tela_3.dart';
import '../pages/tela_4.dart';
import '../pages/tela_5.dart';

class TeladDesign extends StatefulWidget {
  const TeladDesign({super.key});

  @override
  State<TeladDesign> createState() => _TeladDesignState();
}

class _TeladDesignState extends State<TeladDesign> {
  String mensagemNaTela = "Nenhum botão clicado";

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
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-An5x6EXRQylbyDeaHkNUb6mEmrg5QdAH0g&s",
              height: 250,
              width: 200,
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

          Row(
            children: [
              Expanded(
                child: CardsFirstPage(
                  icone: Icons.auto_stories,
                  titulo: 'História',
                  textoBotao: 'Ver mais',
                  descricao: 'Qual a história da marca?',
                  cor: Color(0xffe71a23),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaDois()));
                  },  
                ),
              ),
              Expanded(
                child: CardsFirstPage(
                  icone: Icons.event,
                  titulo: 'Criação',
                  textoBotao: 'Ver mais',
                  descricao: 'Quando a marca foi criada?',
                  cor: Color(0xffe71a23),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaTres()));
                  },    
                ),
              ),
              
            ],
          ),   
          Row(
            children: [
              Expanded(
                child: CardsFirstPage(
                  icone: Icons.attach_money,
                  titulo: 'Modelo',
                  textoBotao: 'Ver mais',
                  descricao: 'Qual é o modelo mais famoso?',
                  cor: Color(0xffe71a23),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaQuatro()));
                  },  
                ),
              ),
              Expanded(
                child: CardsFirstPage(
                  icone: Icons.event,
                  titulo: 'Eletrificação?',
                  textoBotao: 'Ver mais',
                  descricao: 'A marca vai ter carros elétricos?',
                  cor: Color(0xffe71a23),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaCinco()));
                  },
                ),
              ),
            ],
          ),   
        ],
      ),
    );
  }
}