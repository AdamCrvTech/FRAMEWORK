import 'dart:convert';
import 'dart:ffi';

class Carros {
  Int brake;
  int throttle;
  DateTime date;
  Int speed;
  Int drs;


  Carros(this.modelo, this.numPortas, this.anoLancamento, this.categoria, this.transmissao);

  void exibirDetalhes(){
  print("----- Detalhes do carro -----");
  print("Modelo:");
  print("Número de portas:");
  print("Ano de lançamento:");
  print("Categoria:");
  print("Transmissão:");

  
    Map<String, dynamic> toJson() {
    return {
      "Modelo": modelo,
      "Numero de portas": numPortas,
      "Ano de lançamento": anoLancamento,
      "Categoria": categoria,
      "Transmissão": transmissao
    };
}
}
}

