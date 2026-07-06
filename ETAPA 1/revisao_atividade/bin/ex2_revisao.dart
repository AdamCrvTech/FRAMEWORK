import 'package:revisao_atividade/revisao_atividade.dart' as revisao_atividade;
import 'dart:io';

    
abstract class Dispositivo{
    final String nome;

    Dispositivo(this.nome);

    void ligar();

}

class Lampada extends Dispositivo{
    final int intensidade;
    Lampada(String nome,this.intensidade) : super(nome);

    @override
    void ligar(){
      print("A lampada ligou na intensidade $intensidade");
    }
}

class Ar_condicionado extends Dispositivo{
    final int temperatura;
    Ar_condicionado(String nome, this.temperatura) : super(nome);

     @override
    void ligar(){
      print("A lampada ligou na temperatura $temperatura");
    }
}

void main() {
  int escolhaUser = 0;


  while(escolhaUser != 1 && escolhaUser != 2){
    stdout.write("Escolha o dispositivo da sua Smart Home que você deseja configurar: \n 1-Lampada / 2- Ar Condicionado");
    escolhaUser = int.parse(stdin.readLineSync()!);

    if(escolhaUser == 1) {
      stdout.write("Digite o valor da intensidade da lampada:");
      int valorLamp = int.parse(stdin.readLineSync()!);

        if (valorLamp < 0 || valorLamp > 100)
          print("Valor inválido!");
        else{
          Lampada ligouLamp = Lampada("lamp1", valorLamp);
          ligouLamp.ligar();
        }   

    }
    else if (escolhaUser == 2){
      stdout.write("Digite o valor da temperatura do ar condicionado:");
      int valorArc = int.parse(stdin.readLineSync()!);

          if (valorArc < 16 || valorArc > 30)
          print("Temperatura fora do limite de segurança");
        else{
          Lampada ligouArc = Lampada("Arc1", valorArc);
          ligouArc.ligar();
        } 
    }
    else {
      print("Escolha inválida, tente novamente com 1 ou 2.");
    }
  }
  


}


