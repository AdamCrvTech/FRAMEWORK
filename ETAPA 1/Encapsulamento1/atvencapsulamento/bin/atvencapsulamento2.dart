import 'package:atvencapsulamento/atvencapsulamento2.dart';
import 'dart:io';

void main() {
  var meuCofre = CofreDigital();
  bool senhaConfigurada = false;

  // --- FASE 1: CONFIGURAÇÃO DA SENHA ---
  while (!senhaConfigurada) {
    print('--- Configuração de Segurança ---');
    stdout.write('Defina uma senha de 4 dígitos: ');
    String entrada = stdin.readLineSync()!;

    try {
      meuCofre.codigoMudado = entrada;
      print('✅ Senha configurada com sucesso!');
      senhaConfigurada = true;
    } catch (e) {
      // Captura o erro caso a senha não tenha 4 dígitos
      print(e);
      print('Tente novamente.\n');
    }
  }

  print('\n-------------------------------');

  // --- FASE 2: TENTATIVA DE ABERTURA ---
  print('--- Sistema de Acesso ---');
  stdout.write('Digite a senha para abrir o cofre: ');
  String? tentativa = stdin.readLineSync();

  if (tentativa != null) {
    meuCofre.abrir(tentativa);
  }
}