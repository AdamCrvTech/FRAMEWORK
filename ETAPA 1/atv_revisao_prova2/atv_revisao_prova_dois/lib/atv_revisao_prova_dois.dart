abstract class Avatar {
 final String nome;
 final String classe;
 int _pontosForca = 1;


 Avatar(this.nome, this.classe);

 int get forca => _pontosForca;

 set pontos(int valor) {
    if (valor < 1 || valor > 20) {
      throw Exception('Atributo fora do limite permitido (1-20)');
    }
    _pontosForca = valor;
    }

   void aplicarFuria() {
    int novoValor = _pontosForca + 5;
    if (novoValor > 20) {
        _pontosForca = 20;
    } 
    else {
        _pontosForca = novoValor;
    }
    print("$nome aplicou fúria! Força atual: $_pontosForca");

  }

  Map<String, dynamic> toJson();
}   

class Heroi extends Avatar {
 String armaFavorita;
 Heroi({required String nome, required String classe, required this.armaFavorita, int forcaInicial = 1}) : super(nome, classe) {
  if(classe.toLowerCase() == "orc") {
    aplicarFuria();
  }
 }

 @override
 Map<String, dynamic> toJson(){
  return {"nome": nome, "classe": classe, "forca": forca, "armaFavorita": armaFavorita};
 }
}



