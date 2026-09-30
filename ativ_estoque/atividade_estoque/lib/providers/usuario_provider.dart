import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../services/usuario_service.dart';

class UsuarioProvider extends ChangeNotifier {
  UsuarioService service = UsuarioService();
  Usuario? usuario;

  Future<String?> cadastrarUsuario(
    String nome,
    String email,
    String senha,
  ) async {

    Usuario novoUsuario = Usuario(
      nome: nome,
      email: email,
      senha: senha,
    );

    int? resultado = await service.cadastrarUsuario(novoUsuario,);

    if (resultado == null) {
      return 'E-mail já cadastrado.';
    }
    return null;
  }

  Future<bool> fazerLogin(
    String email,
    String senha,
  ) async {

    Usuario? resultado =
        await service.fazerLogin(
      email,
      senha,
    );

    if (resultado != null) {
      usuario = resultado;
      notifyListeners();
      return true;
    }
    return false;
  }

  void sair() {
    usuario = null;
    notifyListeners();
  }
}