import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atividade_aula_08_04/atividade_aula_08_04.dart' as atividade_aula_08_04;


Future<void> sincronizarDados() async {
  final url = Uri.parse(
    'https://api.openf1.org/v1/car_data?driver_number=1&session_key=9158'
  );

  try {
    print("Iniciando sincronização...");

    final resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      final arquivo = File('backup_api.json');
      await arquivo.writeAsString(resposta.body);
      print("Dados baixados e salvos com sucesso!");
    }
    else {
      print("Erro ao buscar os dados: ${resposta.statusCode}");
    }
  } catch (e) {
    print("Ocorreu um erro na conexão: $e. Tente novamente!");
  }
}

