import 'dart:ffi';

import 'package:revisao_atividade/revisao_atividade.dart' as revisao_atividade;
import 'dart:io';

abstract class Encomenda{
  int prazo = 0;
  String codigoPedido;
  double pesoPedido;

  Encomenda(this.codigoPedido,this.pesoPedido);

  void gerarEtiqueta() {
    print("Encomenda $codigoPedido confirmada! Prazo de entrega: $prazo dias");
  }
}

class EnvioNormal extends Encomenda{
  EnvioNormal(String codigoPedido, double pesoPedido) : super(codigoPedido, pesoPedido) {
    this.prazo = 10;
  }

}

class EnvioSedex extends Encomenda{
  EnvioSedex(String codigoPedido, double pesoPedido) : super(codigoPedido, pesoPedido) {
    this.prazo = 2;
}

}



void main(){
  Encomenda e;
    stdout.write("Digite o código do seu pedido:");
    String codigo = (stdin.readLineSync()?? "");


    double peso = 31.0;
    while(peso > 30) {
      stdout.write("Digite o peso do seu pedido:");
      peso = double.parse(stdin.readLineSync()?? "0");
      if(peso> 30) {
        print("Erro: O peso máximo permitido é 30kg");
      }
    }
      
    while(true) {
      stdout.write("Qual o tipo de frete? (1-Normal / 2-Sedex)");
      String escolha = (stdin.readLineSync()?? "");
      if (escolha == "1") {
        e = EnvioNormal(codigo, peso);
        break;
      }
      else if( escolha == "2") {
        e = EnvioSedex(codigo, peso);
        break;
      }
    }




  e.gerarEtiqueta();

}