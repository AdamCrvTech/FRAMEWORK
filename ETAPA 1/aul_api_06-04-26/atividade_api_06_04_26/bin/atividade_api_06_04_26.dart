import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atividade_api_06_04_26/atividade_api_06_04_26.dart';

import 'package:atividade_api_06_04_26/atividade_api_06_04_26.dart' as atividade_api_06_04_26;

Future<List<dynamic>> buscarLivros(String termoBusca) async {

  final url = Uri.parse(
    "https://stephen-king-api.onrender.com/api/books",
  );

  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    var json = jsonDecode(resposta.body);
    return json["data"];
  } else {
    throw Exception('Erro no servidor: Código ${resposta.statusCode}');
  }
}


Future<void> main() async {
  print("===++ MENU DE LIVROS DO STEPHEN KING ++===\n");

  stdout.write("Digite o nome (ou parte do nome) do livro: ");
  String pesquisa = stdin.readLineSync()!;

  print("\nBuscando $pesquisa nos servidores... \n");

  List<Livro> catalogo = [];


  try {
    List<dynamic> listaDaInternet = await buscarLivros(pesquisa);

    for (var item in listaDaInternet) {
     String titulo = item['Title'];
     int paginas = item["Pages"];
     List<String> viloes = item["villains"];  


      Livro novoLivro = Livro(titulo, paginas, viloes);
      catalogo.add(novoLivro);
    }

    if (catalogo.isEmpty) {
      print('❌ Nenhum livro encontrada contendo "$pesquisa".');
    } else {
      print(
        '✅ Foram encontrados ${catalogo.length} resultados:\n',
      );

      for (var lvr in catalogo) {
        lvr.exibirDetalhes();
      }
    }
  } catch (e) {
    print('⚠️ Falha ao carregar os dados: $e');
  }

  print('\nSistema finalizado.');
}
