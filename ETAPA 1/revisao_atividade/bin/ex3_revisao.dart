import 'package:revisao_atividade/revisao_atividade.dart' as revisao_atividade;
import 'dart:io';

abstract class Veiculo{
  final String placa;
  Veiculo(this.placa);

  void realizarRevisao();

}

class Carro extends Veiculo{
  final int numPortas;
  Carro(String placa, this.numPortas) : super(placa);
  
  @override
  void realizarRevisao(){
    print("Quantidade de portas: $numPortas - Placa: $placa");
  }

}

class Moto extends Veiculo{
  Moto(String placa, this.numCilindradas) : super(placa);
  final int numCilindradas;

  @override
  void realizarRevisao(){
    print("Quantidade de cilindradas do motor: $numCilindradas - Placa: $placa");
  }
}

void main(){
  List<Veiculo> oficina = [];
  int contador = 0;
  while(contador < 3) {
    
    String tipo;
    String valoresPropriedade;
    String placaVeic;
    while(true) {
      print("Categoria do veículo ( 1- Carro; 2- Moto )");
      String entrada = stdin.readLineSync()?? "";
      if (entrada == "1") { //Carro
        tipo = "C";
        valoresPropriedade = "o número de portas";
        placaVeic = "A placa do veiculo";
        break;
      }
      else if (entrada =="2") { //Moto
        tipo = "M";
        valoresPropriedade = "a cilindradas";
        placaVeic = "A placa do veiculo";
        break;
      }
    }

    print("Digite $valoresPropriedade:");
    int valor = int.parse(stdin.readLineSync()?? "1");

    print("Digite $placaVeic:");
    String valorPlaca = (stdin.readLineSync()?? "");
   
    Veiculo carroAdd;
        if(tipo == "C"){
          carroAdd = Carro(valorPlaca, valor);
        }
        else{
          carroAdd = Moto(valorPlaca , valor);
        }
    
    oficina.add(carroAdd);

    contador++;
}

  stdout.write("Digite a placa de um veículo para uma busca:");
  String valorBuscaPlaca = stdin.readLineSync()?? "";

  for(int count = 0; count < oficina.length; count++){
    if(valorBuscaPlaca == oficina[count].placa){
        oficina[count].realizarRevisao();
    }
  }

}


