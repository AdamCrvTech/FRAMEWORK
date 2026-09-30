class Pedido {
  int? id;
  String cliente;
  String prato;
  int quantidade;
  double valorUnitario;
  String status;

  Pedido({
    this.id,
    required this.cliente,
    required this.prato,
    required this.quantidade,
    required this.valorUnitario,
    this.status = 'Pendente',
  });

  // total = quantidade x valor unitario
  double get total => quantidade * valorUnitario;

  String get classificacao {
    if (quantidade >= 5) {
      return 'PEDIDO GRANDE';
    }
    return 'PEDIDO NORMAL';
  }

  String get totalFormatado {
    return 'R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cliente': cliente,
      'prato': prato,
      'quantidade': quantidade,
      'valor_unitario': valorUnitario,
      'status': status,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'],
      cliente: map['cliente'],
      prato: map['prato'],
      quantidade: map['quantidade'],
      valorUnitario: map['valor_unitario'],
      status: map['status'],
    );
  }
}
