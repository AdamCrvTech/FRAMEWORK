import 'package:revisao_atividade/revisao_atividade.dart' as revisao_atividade;
import 'dart:io';

abstract class Pagamento {
  double valorOriginal;
  Pagamento(this.valorOriginal);

  void valorFinal();
  double getValorFinal();
  double processar();
}

class PagamentoCartao extends Pagamento {
  PagamentoCartao(super.valorOriginal);
  

  @override
  double getValorFinal() {
    return valorOriginal * 1.02;
  }

  @override
  double processar() {
    return getValorFinal();
  }

  @override
  void valorFinal() {
    double valorFinal = getValorFinal();
    print("O valor final é: $valorFinal");
  }
}

class PagamentoPix extends Pagamento {
  PagamentoPix(super.valorOriginal);

    @override
  double getValorFinal() {
    return valorOriginal * 0.9;
  }

  @override
  double processar() {
    return getValorFinal();
  }

  @override
  void valorFinal() {
    double valorFinal = getValorFinal();
    print(valorFinal);
  }
}

void main() {
  stdout.write("Digite o saldo disponivel em sua conta: ");
  double saldoConta = double.parse(stdin.readLineSync()!);

  int escolhaPag = 0;
  late Pagamento meuPag;

  while(escolhaPag != 1 && escolhaPag != 2) {
    stdout.write("Forma de Pagamento (1-Cartão/ 2-Pix): ");
    escolhaPag = int.parse(stdin.readLineSync()!);  

    if (escolhaPag == 1) {
      stdout.write("Valor: ");
      double valor = double.parse(stdin.readLineSync()!);
      meuPag = PagamentoCartao(valor);
      meuPag.valorFinal();
    } else if (escolhaPag == 2) {
      stdout.write("Valor: ");
      double valor = double.parse(stdin.readLineSync()!);
      meuPag = PagamentoPix(valor);
      meuPag.valorFinal();
    } else {
      print("Escolha inválida, tente novamente com 1 ou 2.");
    }
}

  if (meuPag.processar() <= saldoConta ) {
    print("Pagamento de R\$${meuPag.processar()} Aprovado! Saldo restante: R\$${saldoConta - meuPag.getValorFinal()}");
  }
  else {
    print("Pagamento Negado! Saldo insuficiente. Faltam R\$${meuPag.getValorFinal() - saldoConta} ");
  }
}



