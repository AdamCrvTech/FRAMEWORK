import 'package:exercicios_22501959/exercicios_22501959.dart' as exercicios_22501959;
import 'dart:io'; 

class Mensagem {
    String textoMensagem;
    Mensagem(this.textoMensagem);   

    void enviar(){
        print("Sua mensagem está sendo enviada...");
    }
}

class Sms extends Mensagem {
  Sms(String texto) : super(texto);

  @override 
    void enviar() {
    print("Sua mensagem está sendo enviada via SMS pelo celular...");
  }
}

class Email extends Mensagem {
  Email(String texto) : super(texto);

  @override 
  void enviar() {
    print("Enviando via servidor de e-mail...");
  }
}

void main() {
  Sms meuSms = Sms("Oi, bom dia!!");
  Email meuEmail = Email("Relatório de sono de hoje...");

  meuSms.enviar();   
  meuEmail.enviar();
}