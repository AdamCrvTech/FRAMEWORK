import 'package:flutter/material.dart';
import 'humor_model.dart';

class TelaHumor extends StatefulWidget {
  const TelaHumor({super.key});

  @override
  State<TelaHumor> createState() => _TelaHumorState();
}

class _TelaHumorState extends State<TelaHumor> {
  Humor? _humorAtual;
  bool _mostrarMensagem = false;

  void _escolherHumor(Humor humor) {
    setState(() {
      _mostrarMensagem = false;
      _humorAtual = humor;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _mostrarMensagem = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color corFundo = _humorAtual?.cor ?? const Color(0xFFF3E5F5);
    final Color corTexto = _humorAtual?.corTexto ?? const Color(0xFF4A148C);
    final double tamanhoContainer = _humorAtual != null ? 200 : 150;
    final double raioContainer = _humorAtual != null ? 40 : 16;

    return Scaffold(
      backgroundColor: corFundo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Mood App',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: corTexto,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Como você está se sentindo hoje?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: corTexto.withOpacity(0.75),
                ),
              ),
              const SizedBox(height: 24),

              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutCubic,
                width: tamanhoContainer,
                height: tamanhoContainer,
                decoration: BoxDecoration(
                  color: _humorAtual != null
                      ? corTexto.withOpacity(0.15)
                      : Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(raioContainer),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: Icon(
                        _humorAtual?.icone ?? Icons.sentiment_neutral,
                        key: ValueKey(_humorAtual?.nome ?? 'neutro'),
                        size: _humorAtual != null ? 72 : 56,
                        color: _humorAtual != null
                            ? corTexto
                            : const Color(0xFF9C4DCC),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          _humorAtual?.texto ?? 'Escolha seu humor',
                          key: ValueKey(_humorAtual?.texto ?? 'inicial'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _humorAtual != null
                                ? corTexto
                                : const Color(0xFF4A148C),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: _mostrarMensagem ? 1.0 : 0.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    _humorAtual?.mensagemExtra ?? ' ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _humorAtual?.corTexto ?? Colors.transparent,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: humores.map((h) {
                  final bool selecionado = _humorAtual?.nome == h.nome;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: selecionado
                          ? [
                              BoxShadow(
                                color: h.cor.withOpacity(0.5),
                                blurRadius: 12,
                                spreadRadius: 2,
                              )
                            ]
                          : [],
                    ),
                    child: ElevatedButton(
                      onPressed: () => _escolherHumor(h),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selecionado ? h.cor : Colors.white,
                        foregroundColor:
                            selecionado ? h.corTexto : const Color(0xFF4A148C),
                        elevation: selecionado ? 6 : 2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: selecionado ? h.cor : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        h.labelBotao,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
