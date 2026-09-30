import 'package:atividade_lanchonete/pages/tela_pedido.dart';
import 'package:flutter/material.dart';
import 'Tela_detalhe.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String mensagem = 'Conheça nosso cardápio:';

  Widget _criarItemCardapio(String nome, String preco, String descricao) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.withAlpha(40),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.restaurant_menu, color: Colors.amber),
          ),
          title: Text(
            nome,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          trailing: Text(
            preco,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          onTap: () {
            setState(() {
              mensagem = 'Você selecionou: $nome';
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaDetalhes(
                  nome: nome,
                  preco: preco,
                  descricao: descricao,
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lanchonete Rapidona!'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 80,
                  color: Colors.amber,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Seja bem vindo à Lanchonete Rapidona!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 320,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber.withAlpha(50),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.amber, width: 1),
                  ),
                  child: Text(
                    mensagem,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Cardápio do Dia',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    _criarItemCardapio('Mega Burger', 'R\$ 28,90',
                        'Blend de carne artesanal 150g, queijo prato derretido, alface crespa, tomate fresco e molho especial da casa no pão brioche selado na manteiga.'),
                    _criarItemCardapio('Batata Suprema', 'R\$ 18,50',
                        'Porção generosa de batatas fritas crocantes cobertas com um cremoso molho de cheddar artesanal e pedaços crocantes de bacon premium.'),
                    _criarItemCardapio('Shake Ovomaltine', 'R\$ 14,00',
                        'Incrível milkshake cremoso feito com sorvete de baunilha de alta qualidade, muito Ovomaltine em flocos e calda de chocolate espessa.'),
                    _criarItemCardapio('Fatia de Red Velvet', 'R\$ 12,50',
                        'Fatia generosa de bolo Red Velvet com massa fofinha e úmida, recheada e coberta com um leve e suave creme de leite Ninho.'),
                    _criarItemCardapio('Mega Burger', 'R\$ 28,90',
                        'Dois blends artesanais de 150g cada, o dobro de queijo prato, cebola caramelizada e molho barbecue no pão australiano.'),
                    _criarItemCardapio('Batata Suprema', 'R\$ 18,50',
                        'Batatas cortadas em gomos com casca, temperadas com alecrim fresco, páprica defumada e sal grosso, acompanhadas de maionese verde.'),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Column(children: [
                              Container(
                                width: 320,
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.amber, width: 1),
                                ),
                                child: Text(
                                  "Na compra de uma Batata Frita Grande, o milk-shake sai pela metade do preço!",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 320,
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.amber, width: 1),
                                ),
                                child: Text(
                                  "Na compra de uma Pizza Grande, o refrigerante de 2 litros sai pela metade do preço!",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 320,
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.amber, width: 1),
                                ),
                                child: Text(
                                  "Na compra de uma Porção de Frango a Passarinho, a caneca de chopp sai pela metade do preço!",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 320,
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.amber, width: 1),
                                ),
                                child: Text(
                                  "Na compra de qualquer Prato Executivo, a sobremesa do dia sai pela metade do preço!",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]),
                          );
                        });
                  },
                  icon:
                      const Icon(Icons.add_shopping_cart, color: Colors.white),
                  label: const Text(
                    'Confira nossas promoções!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF228b22),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaPedido(),
                      ),
                    );
                  },
                  icon:
                      const Icon(Icons.add_shopping_cart, color: Colors.white),
                  label: const Text(
                    'Adicionar Pedido',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
