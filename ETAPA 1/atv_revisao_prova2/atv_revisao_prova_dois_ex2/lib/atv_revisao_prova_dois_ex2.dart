abstract class Ticket {
 final int codigo;
 final String evento;
 double _valorBase = 0.0;

 Ticket(this.codigo, this.evento);

 double get valorAtual => _valorBase;


 set valorBase(double valor) {
    if (valor <= 0.0) {
      throw Exception("O ingresso não pode ser gratuito!");
    }
    _valorBase = valor;
    }

   void taxaConvencional() {
        _valorBase += _valorBase * 0.10;
        print("O valor do ingresso do $evento é de: $_valorBase");
  }

  Map<String, dynamic> toJson();
}   