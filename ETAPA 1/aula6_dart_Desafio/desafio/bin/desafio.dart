import 'package:desafio/desafio.dart' as desafio;

abstract class Lutador{
    String nome;
    int vida;

    Lutador(this.nome , this.vida);

    void executarHabilidade(int escolha, Lutador alvo);
}

class Guerreiro extends Lutador{
  Guerreiro(String nome) : super(nome, 100);

  @override
  void executarHabilidade(int escolha, Lutador alvo){
    if(escolha == 1){
      print("$nome deu um soco!");
      alvo.vida -= 10;
    }
    else if(escolha == 2){
      print("$nome deu uma espadadada");
      alvo.vida -= 25;
    }
    else{
      print("Ele ainda não tem essa habilidade!");
    }
  }
}
class ManaInsuficienteException{
  print("$nome tentou lançar Bola de Fogo, mas está sem mana!");

}

class Mago extends Lutador{
  int mana;
  Mago(String nome, int vida, {required this.mana}) : super(nome, 100);

  @override
  void executarHabilidade(int escolha, Lutador alvo){
    if(escolha == 1){
      print("$nome deu uma cajadada!");
      alvo.vida -= 5;
    }
    else if(escolha == 2){
      if(mana >= 20){
        print("$nome tacou uma bola de fogo!");
        alvo.vida -= 40;
        mana -= 20;
      }
      else{
        
      } 
    }
    else{
      print("Ele ainda não tem essa habilidade!");
    }
  }
}




void main() {
   Map<int, Lutador> arena = {}; 

  Guerreiro kratos = Guerreiro("Kratos", 100, 20);
  Mago harryPotter = Mago("Harry Potter", 80, 50);
}


