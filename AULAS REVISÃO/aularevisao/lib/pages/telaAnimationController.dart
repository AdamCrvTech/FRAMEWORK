import 'package:flutter/material.dart';

class TelaAnimationController extends StatefulWidget {
  const TelaAnimationController({super.key});

  @override
  State<TelaAnimationController> createState() =>
      _TelaAnimationControllerState();
}

class _TelaAnimationControllerState extends State<TelaAnimationController>
    with SingleTickerProviderStateMixin {
  //Ajuda o Flutter a controlar a animação de forma mais eficiente
  late AnimationController controller; //Controla a animação
  late Animation<double>
      tamanho; //será usado para mudar a largura e altura do container

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    tamanho = Tween<double>(
      //Define o valor inicial e final da animação
      begin: 100, //Inicia o container no tamanho 100
      end: 250, //termina o container no tamanho 250
    ).animate(controller); //Liga o tween com a variavel controller.
  }

  @override
  void dispose() {
    //Ele é executado quando a tela é fechada
    controller.dispose(); //Liberar o controller da memoria
    super.dispose();
  } //Evita problemas em animação

  void iniciarAnimacao() {
    controller.forward();
  }

  void voltarAnimacao() {
    controller.reverse();
  }

  void reiniciarAnimacao() {
    controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimationController'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                //Reconstruir o widget enquanto a animação acontece
                animation: tamanho, //Informa qual animação será observada
                builder: (context, child) {
                  return Container(
                    //O componente widget que será animado
                    width: tamanho.value, //Pega o valor atual da animação
                    //100 -> 130 -> 160 -> 190 e por aí vai
                    height: tamanho.value, //Pega o valor atual da animação
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Animação',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: iniciarAnimacao,
                child: const Text('Iniciar animação'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: voltarAnimacao,
                child: const Text('Voltar animação'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: reiniciarAnimacao,
                child: const Text('Reiniciar animação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
