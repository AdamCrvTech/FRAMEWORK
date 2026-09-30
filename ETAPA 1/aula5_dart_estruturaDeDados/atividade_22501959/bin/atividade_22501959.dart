import 'package:atividade_22501959/atividade_22501959.dart' as atividade_22501959;
import 'dart:io';


void main() {
// Questão 1: Organizando o Menu (Listas)
// Crie uma Lista chamada menu que contenha 3 itens: "Salgado", "Suco" e "Doce". Em seguida, adicione o item "Fruta" e imprima o tamanho total da lista no console.
  List<String> itens = ["Salgado", "Suco" , "Doce"];
  itens.add("Frutas");
  print(itens.length);


// Questão 2: Evitando Pedidos Duplicados (Sets)
// Um aluno tentou fazer o pedido de vários lanches, mas o sistema não pode aceitar itens repetidos para o mesmo combo. Converta ou crie um Set com os itens: {'Pastel', 'Refrigerante', 'Pastel'}.
// Pergunta: O que será impresso no console ao exibir esse Set?
  Set<String> itens2 = {"Pastel", "Refrigerante", "Pastel"};
  print(itens2);
  // Pergunta: O que será impresso no console ao exibir esse Set? SERÁ EXIBIDO SOMENTE PASTEL E REFRIGERANTE, POIS O PASTEL ESTÁ DUPLICADO!


// Questão 3: Tabela de Preços (Maps)
// Crie um Map chamado precos onde a chave é o nome do produto e o valor é o preço.
// Produto A: "Coxinha" -> R$ 5.00
// Produto B: "Guaraná" -> R$ 4.00
// Imprima no console apenas o preço da "Coxinha" usando a chave.
  Map<String, double> precosItens = {
    "Saguadin": 3.0,
    "Queijin": 2.5,
    "Refrizin": 6.0
  };
  print(precosItens["Saguadin"]);


// Questão 4: Promoção do Dia (Operador Ternário)
// A lanchonete quer dar um aviso se o valor da compra for alto. Use um Operador Ternário para verificar uma variável valorCompra.
// Se valorCompra for maior que 20, a variável mensagem deve receber "Ganhou um adesivo!".
// Caso contrário, deve receber "Obrigado pela compra!".
  double valorCompra = 20;
  String resposta = valorCompra >= 20 ? "Ganhou um adesivo!" : "Obrigado pela compra!";
  print(resposta);


// Questão 5: Segurança no Caixa (Try-Catch)
// Às vezes, o atendente digita um valor inválido. Crie um bloco Try-Catch que tente converter uma String "dez_reais" em um número.
// Dica: Se o erro FormatException ocorrer, imprima a mensagem: "Erro: Digite apenas números para o valor!".
  try{
    print("----- INICIANDO CHECKOUT -----");
    double valor =  double.parse(stdin.readLineSync()!);
    print(valor);
  }
  catch (erro){
    print("Ocorreu um erro: $erro");
  }
  finally{
    print("Operação concluída com sucesso!");
  }

}
