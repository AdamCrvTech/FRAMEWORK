import 'package:revisao_atividade/revisao_atividade.dart' as revisao_atividade;
import 'dart:io';

abstract class Usuario{
  String login;

  Usuario(this.login);
  
  void acessar();
}

class Gratuito extends Usuario{

  Gratuito(String login) : super(login);

  @override
  void acessar() {
    print("Acesso limitado.Assine o Premium para ver mais!");
}

}

class Premium extends Usuario{

 DateTime dataVencimento;

  Premium(String login, this.dataVencimento) : super(login);

  @override
  void acessar() {
    if(dataVencimento.isAfter(DateTime.now())){
print("Acesso liberado!Bem-vindo $login, sua assinatura expira em $dataVencimento");
    }

    else if(dataVencimento.isBefore(DateTime.now())){
    print("Erro: sua assinatura expirou em $dataVencimento!Renove seu plano.");
    }
  }

}

void validarAcesso(Usuario u){
 u.acessar();
}


void main(List<String> arguments) {
  stdout.write("Digite o login do usuário: ");
  String login = stdin.readLineSync()!;

  stdout.write("Escolha qual o seu tipo de conta(1-Gratuito, 2-Premium): ");
  String tipoConta = stdin.readLineSync()!;

  switch (tipoConta) {
    case '1':
     Gratuito contaGratis =Gratuito(login);
     validarAcesso(contaGratis);
    case '2':
      stdout.write("Digite a data de vencimento da conta Premium (AAAA-MM-DD): ");
      DateTime dataVencimento = DateTime.parse(stdin.readLineSync()!);
      Premium contaPremium = Premium(login, dataVencimento);
      validarAcesso(contaPremium);
    default:
      print("Opção inválida. Por favor, escolha 1 para Gratuito ou 2 para Premium.");
  }
}
