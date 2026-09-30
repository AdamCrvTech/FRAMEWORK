import 'package:exercicios_22501959/exercicios_22501959.dart' as exercicios_22501959;
import 'dart:io'; 



class Mensagem {
    String textoMensagem;

    Mensagem(this.textoMensagem);   
}

class Sms extends Mensagem {
    Sms(String textoMensagem) : super(textoMensagem);
}

void main() {
    Sms meuSms = Sms("Fala, professor Igor! Como voce está?");

  print(meuSms.textoMensagem);
}



