import 'package:teste/teste.dart' as teste;

// 1. ABSTRAÇÃO: O molde geral
abstract class veiculo {
  final String modelo;
  veiculo(this.modelo);

  // Método que as classes filhas são obrigadas a criar
  void mover();
}

// 2. HERANÇA: Cartão herda de Pagamento
class carro extends veiculo {
  carro(String modelo) : super(modelo);

  // 3. POLIMORFISMO: Comportamento específico
  @override
  void mover() {
    print('O carro $modelo está acelerando pelas ruas...');
  }
}

class aviao extends veiculo {
  aviao(String modelo) : super(modelo);

  @override
  void mover() {
    print('O avião $modelo está decolando da pista... ');
  }
}

class bike extends veiculo {
  bike(String modelo) : super(modelo);

  @override
  void mover() {
    print('A bike $modelo está andando pelas ruas de BH... ');
  }
}

void main() {
  // Criamos uma lista de veículos diferentes
  List frota = [carro("Porsche Cayenne"), aviao("Boeing 747"), bike("Specialized Speed")];

  // O Polimorfismo em ação: chamamos o mesmo método 'mover'
  // e cada um responde do seu jeito.
  for (var v in frota) {
    v.mover();
  }
}