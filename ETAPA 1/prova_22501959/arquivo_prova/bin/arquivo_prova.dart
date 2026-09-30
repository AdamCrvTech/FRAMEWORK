import 'package:arquivo_prova/arquivo_prova.dart';
import 'dart:io';
import 'dart:convert';


List<Holocron> catalogo = [];
String caminhoArquivo = 'H:\FRAMEWORK\prova_22501959\estoque.json';

void main() {
carregarDados();

bool executando = true;
while (executando) {
  print("\n--MENU DO TEMPLO ---");
  print("1 para registrar Holocron");
  print("2 para remover do Templo");
  print("0 para encerrar Meditação (Sair)");
  stdout.write("Escolha uma opção: ");

  String? opcao = stdin.readLineSync();

  try { switch (opcao) {
      case '1':
        registrarHolocron();
        break;

      case '2':
        removerHolocron();
        break;

      case '0':
        print("Que a Força esteja com você.");
        executando = false;
        break;

      default:
        print("Opção inválida, tente novamente!");}
} 
  catch (e) {
  print("Deu erro: ${e.toString()}");}
  }
}

void carregarDados() {
  final arquivo = File(caminhoArquivo);
    if (arquivo.existsSync()) {
      try { String conteudo = arquivo.readAsStringSync();
        List<dynamic> dadosLidos = jsonDecode(conteudo);

      for (var item in dadosLidos) {
          catalogo.add(Holocron.fromJson(item));
}
  print("Sistema carregado: ${catalogo.length} holocrons encontrados.");} 
  
  catch (e) {
    print("Erro ao carregar nosso banco de dados: $e");}
  }
}

void salvarDados() {
  final arquivo = File(caminhoArquivo);
  List<Map<String, dynamic>> jsonList = catalogo.map((h) => h.toJson()).toList();
  arquivo.writeAsStringSync(jsonEncode(jsonList));
}

void registrarHolocron() {
  stdout.write("Digite o Id: ");
  int id = int.parse(stdin.readLineSync()!);
  if (catalogo.any((h) => h.id == id)) {
    throw Exception("Este Holocron já foi registrado no Templo");
  }
  stdout.write("Nome do Mestre: ");
  String mestre = stdin.readLineSync()!;
  stdout.write("Nível de Força (A força deve ir de 1 até 100): ");
  int nivel = int.parse(stdin.readLineSync()!);
  stdout.write("Cor do Cristal: ");
  String cor = stdin.readLineSync()!;


Holocron novo = Holocron(id: id, mestreCriador: mestre, nivel: nivel, corCristal: cor);

  if (cor.toLowerCase() == "vermelho") {
    print("Lado Sombrio detectado! Iniciando protocolo de purificação...");
    novo.purificarEnergia();
  }
  catalogo.add(novo);
  salvarDados();
  print("Novo Holocron registrado com sucesso!!");
}

void removerHolocron() {
  stdout.write("Digite o ID do Holocron a remover: ");
  int id = int.parse(stdin.readLineSync()!);
  int tamanhoInicial = catalogo.length;
  catalogo.removeWhere((h) => h.id == id);
  if (catalogo.length < tamanhoInicial) {
  salvarDados();
  print("Holocron removido e arquivos atualizados.");
} 
  else {
    print("ID não encontrado.");
  }
}
