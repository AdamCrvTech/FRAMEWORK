class DispositivoSeguranca {
  String _codigoAcesso = "";

    

  set codigoMudado(String novoCodigo) {
    if(novoCodigo.length == 4){
      print("Codigo novo aceito!");
      _codigoAcesso = novoCodigo;
    }
    else{
      throw Exception("Seu código não pode ser modificado. Tente novamente com 4 caracteres.");
    }
  
  }
}

class CofreDigital extends DispositivoSeguranca{
  void abrir(String tentativa){
    print("Tentando abrir o cofre com: $tentativa");


    if (tentativa == _codigoAcesso) {
      print("Sucesso: Seu cofre aberto!");
    } else {
      print("Erro: Acesso negado. Senha incorreta.");
    }
  }
}
