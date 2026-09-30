import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../services/banco_service.dart';

class LoginViewModel extends ChangeNotifier {
  final BancoService _service = BancoService();

  String? erro;
  Usuario? usuarioLogado;

  Future<bool> entrar(String email, String senha) async {
    if (email.isEmpty || senha.isEmpty) {
      erro = 'Preencha o e-mail e a senha.';
      notifyListeners();
      return false;
    }

    try {
      Usuario? usuario = await _service.buscarUsuario(email, senha);

      if (usuario == null) {
        erro = 'E-mail ou senha inválidos.';
        notifyListeners();
        return false;
      }

      usuarioLogado = usuario;
      erro = null;
      notifyListeners();
      return true;
    } catch (e) {
      erro = 'Erro no banco: $e';
      notifyListeners();
      return false;
    }
  }

  Future<bool> cadastrar(String nome, String email, String senha) async {
    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      erro = 'Preencha todos os campos.';
      notifyListeners();
      return false;
    }

    try {
      if (await _service.emailExiste(email)) {
        erro = 'Este e-mail já está cadastrado.';
        notifyListeners();
        return false;
      }

      await _service.inserirUsuario(Usuario(nome: nome, email: email, senha: senha));
      erro = null;
      notifyListeners();
      return true;
    } catch (e) {
      erro = 'Erro no banco: $e';
      notifyListeners();
      return false;
    }
  }

  void limparErro() {
    erro = null;
  }
}