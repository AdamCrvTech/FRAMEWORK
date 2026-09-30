import 'dart:io';
import 'dart:convert';
import 'package:arquivo_prova/arquivo_prova.dart' as arquivo_prova;

abstract class Produto {
int id;
String mestreCriador;
int _nivelForca;

Produto(this.id, this.mestreCriador, int nivel) : _nivelForca = 0 {
validarNivel = nivel;
}

int get nivel => _nivelForca;

set validarNivel(int valor) {
if (valor < 1 || valor > 100) {
throw Exception("Nível de força instável para um Holocron");
}
_nivelForca = valor;
}

void purificarEnergia() {
  _nivelForca -= 20;
  if (_nivelForca < 0) _nivelForca = 0;
}

Map<String, dynamic> toJson();
}

class Holocron extends Produto {
String corCristal;

Holocron({ required int id, required String mestreCriador, required int nivel, required this.corCristal, }) : super(id, mestreCriador, nivel);

@override
Map<String, dynamic> toJson() {
  return {"id": id,"mestreCriador": mestreCriador,"nivel": nivel,"corCristal": corCristal};
}


factory Holocron.fromJson(Map<String, dynamic> json) {
  return Holocron(id: json["id"], mestreCriador: json["mestreCriador"],nivel: json["nivel"], corCristal: json["corCristal"]);}
}