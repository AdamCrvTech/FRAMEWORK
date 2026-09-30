import 'dart:io';
import 'dart:convert';
import 'package:atv_revisao_prova_dois/atv_revisao_prova_dois.dart';

void main() {
  List<Avatar> bancoDeDados = [];


 final arquivo = File('./personagens.json');


 if (arquivo.existsSync()) {
   List<dynamic> dados = jsonDecode(arquivo.readAsStringSync());
   for (var item in dados) {
     var avatarAtual = Heroi(nome: item["nome"],classe: item["classe"], armaFavorita: item["armaFavorita"]);
     avatarAtual.pontos = item["forca"];
     bancoDeDados.add(avatarAtual);
   }
 }


 while (true) {
   print("\n========= JOGUIN DE RPG ========");

   print(
     "[1] Cadastrar | [2] Sair",
   );
   stdout.write('Escolha: ');


   String? opcao = stdin.readLineSync();
   if (opcao == '2') break;

    if (opcao == "1") {
       stdout.write("Nome do bicho do joguin: ");
       String nomeDoBichao = stdin.readLineSync()!;
       stdout.write("Classe do bicho do joguin: ");
       String classeDoBichao = stdin.readLineSync()!;
       stdout.write("Arma favorita do bicho do joguin: ");
       String armaFavoritaDoBichao = stdin.readLineSync()!;
       bancoDeDados.add(Heroi(nome: nomeDoBichao, classe: classeDoBichao, armaFavorita: armaFavoritaDoBichao ));
       salvar(bancoDeDados);
       print("O $nomeDoBichao criada com sucesso!");
    }
}
}

void salvar(List<Avatar> avatar) {
 final arquivo = File('./personagens.json');
List<Map< String, dynamic>> listaParaSalvar = avatar
     .map((dados) => dados.toJson())
     .toList();
 arquivo.writeAsStringSync(jsonEncode(listaParaSalvar));
}