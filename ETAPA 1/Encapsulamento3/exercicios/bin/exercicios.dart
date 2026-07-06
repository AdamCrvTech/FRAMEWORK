import 'package:exercicios/exercicios.dart' as exercicios;
import 'package:exercicios/conteudo.dart';
import 'dart:io';
import 'dart:convert';

final arquivo = File('./dados.json').readAsStringSync();
Map<String,dynamic> json = jsonDecode(arquivo);

void main() {
  final caminho = './dados.json';
  final arquivo = File(caminho);

  // 1. Lista para armazenar os objetos de Filme
  List<Filme> catalogo = [];

  if (arquivo.existsSync()) {
    // 2. Decodifica o JSON para uma lista dinâmica
    List<dynamic> dados = jsonDecode(arquivo.readAsStringSync());

    // 3. Laço for-in para instanciar e configurar os objetos
    for (var item in dados) {
      try {
        // Instancia passando o ID no construtor conforme solicitado
        // (Certifique-se que sua classe Filme aceite 'int id' no construtor)
        Filme novoFilme = Filme(item['id'], item['titulo']);

        // Define o título (provavelmente um atributo comum)
        novoFilme.titulo = item['titulo'];

        // Usa o Setter para a classificação (com a lógica de validação)
        novoFilme.validarClassificacao = item['classificacao'];

        // Adiciona à lista catálogo
        catalogo.add(novoFilme);

        print("Sucesso: Filme ID ${item['id']} carregado.");
      } catch (e) {
        print("Erro ao processar item: $e");
      }
    }
  } else {
    print("Arquivo não encontrado!");
  }

  while()

 // --- CREATE E VALIDAÇÃO DE ID ---
print("--- Cadastro de Novo Filme ---");
stdout.write("Digite o ID: ");
int novoId = int.parse(stdin.readLineSync()!);

// Validação de ID duplicado
for (var item in catalogo) {
  if (item.id == novoId) {
    throw Exception("Erro: ID já cadastrado no sistema!");
  }
}

stdout.write("Digite o Título: ");
String novoTitulo = stdin.readLineSync()!;
stdout.write("Digite a Classificação (0-18): ");
int novaClassificacao = int.parse(stdin.readLineSync()!);

// INSTANCIAÇÃO CORRETA:
// Passamos id e titulo na ordem, e depois usamos o setter para a classificação
var novoFilme = Filme(novoId, novoTitulo); 
novoFilme.validarClassificacao = novaClassificacao; // Usa o seu setter da classe pai

catalogo.add(novoFilme);
print("Filme cadastrado com sucesso!");
  // --- 2. DELETE ---
print("\n--- Exclusão ---");
stdout.write("Digite o ID para excluir: ");
int idParaRemover = int.parse(stdin.readLineSync()!);

catalogo.removeWhere((item) => item.id == idParaRemover);
print("Item removido do catálogo.");

  // --- 3. UPDATE DO ARQUIVO ---
  salvarCatalogo(catalogo);
}

// Função para gravar os dados de volta no arquivo
void salvarCatalogo(List<Filme> catalogo) {
  // Transforma a lista de objetos em uma lista de Maps
  List<Map<String, dynamic>> jsonList = catalogo.map((Filme c) => c.toJson()).toList();

  // Codifica para String JSON
  String jsonString = jsonEncode(jsonList);

  // Grava o resultado no arquivo dados.json
  File('dados.json').writeAsStringSync(jsonString);
  print("\nCatálogo salvo com sucesso no banco de dados.");
}


  

