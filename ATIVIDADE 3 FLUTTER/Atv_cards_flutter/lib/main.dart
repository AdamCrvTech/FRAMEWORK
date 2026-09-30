import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'widgets/card_icone.dart';

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
          secondary: const Color(0xffe71a23),
        ),
      ),
      home: const TeladDesign(),
    );
  }
}

// Convertido para StatefulWidget para podermos usar o setState
class TeladDesign extends StatefulWidget {
  const TeladDesign({super.key});

  @override
  State<TeladDesign> createState() => _TeladDesignState();
}

class _TeladDesignState extends State<TeladDesign> {
  // Variável que guardará o texto da mensagem exibida na tela
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
          // Imagem
          Container(
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-An5x6EXRQylbyDeaHkNUb6mEmrg5QdAH0g&s",
              height: 250,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),

          // Texto descritivo do filme
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 12)),
          ),

          // 🆕 TEXTO QUE EXIBE A MENSAGEM DO SETSTATE (Abaixo do texto principal e acima dos cards)
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

          // Cards alinhados lado a lado
          Row(
            children: [
              Expanded(
                child: CardsFirstPage(
                  icone: Icons.auto_stories,
                  titulo: 'História',
                  textoBotao: 'Ver mais',
                  descricao: 'Qual a história da marca?',
                  cor: Color(0xffe71a23),
                  onTap: () {
                    // setState atualiza o valor e força a reconstrução da tela
                    setState(() {
                      mensagemNaTela = "  Ferdinand Porsche fundou a marca em 1931. Após criar o Fusca, seu filho Ferry lançou o 356 em 1948. O lendário 911 estreou em 1963. Desde então, a lenda alemã domina pistas e ruas, unindo performance e luxo em ícones como a linha Modelos Porsche.";
                    });
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
                  onTap: () {
                    setState(() {
                      mensagemNaTela = "  Fundada em 1931 por Ferdinand Porsche, a marca inicialmente fazia projetos para terceiros (como o Fusca). O marco real como fabricante aconteceu em 08/06/1948, com a homologação do 1º esportivo: o lendário 356. Em 1963, a Porsche lançou o inesquecível 911.";
                    });
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
                  onTap: () {
                    // setState atualiza o valor e força a reconstrução da tela
                    setState(() {
                      mensagemNaTela = "  Porsche 911: O supercarro mais importante de todos os tempos. Ele mantém o motor na traseira e um design inconfundível. Para conhecer versões modernas e configurações atuais, acesse o site da Porsche Brasil.";
                    });
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
                  onTap: () {
                    setState(() {
                      mensagemNaTela = "  A Porsche adaptou sua meta exclusiva de eletrificação global. Diante da demanda, a marca passou a focar na convivência de modelos: enquanto mantém a linha 100% elétrica, investe fortemente em híbridos de alta performance.";
                    });
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