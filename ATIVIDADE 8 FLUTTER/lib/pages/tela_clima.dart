import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';
import '../widgets/area_cidades.dart';
import '../widgets/painel_informacoes.dart';

class TelaClima extends StatelessWidget {
  TelaClima({super.key});

  final List<CidadeClima> cidades = [
    CidadeClima(
      nome: "Belo Horizonte",
      temperatura: "28°C",
      condicao: "Ensolarado",
      icone: "☀️",
      imagem:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDyP1MP5fsFerHyrIqmQ_V8Q8Ar_um_duXLABIwm7wO_DfAzosVZY5YIM&s=10",
    ),
    CidadeClima(
      nome: "Curitiba",
      temperatura: "17°C",
      condicao: "Chuvoso",
      icone: "🌧️",
      imagem:
          "https://www.civitatis.com/blog/wp-content/uploads/2024/11/shutterstock_609505859-scaled.jpg",
    ),
    CidadeClima(
      nome: "São Paulo",
      temperatura: "22°C",
      condicao: "Nublado",
      icone: "☁️",
      imagem:
          "https://t4.ftcdn.net/jpg/02/82/76/59/360_F_282765998_GoksVVY8vae5ITsiBsScRYMDIrwqxYL4.jpg",
    ),
    CidadeClima(
      nome: "Rio de Janeiro",
      temperatura: "30°C",
      condicao: "Quente",
      icone: "🔥",
      imagem:
          "https://images.mnstatic.com/08/7d/087dfd415e06b0651f4528fea6642818.jpg",
    ),
    CidadeClima(
      nome: "Brasília",
      temperatura: "25°C",
      condicao: "Vento Forte",
      icone: "💨",
      imagem: "https://images.unsplash.com/photo-1516483638261-f4dbaf036963",
    ),
    CidadeClima(
      nome: "Salvador",
      temperatura: "29°C",
      condicao: "Ensolarado",
      icone: "☀️",
      imagem: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
    ),
    CidadeClima(
      nome: "Fortaleza",
      temperatura: "31°C",
      condicao: "Tempestade",
      icone: "⛈️",
      imagem: "https://images.unsplash.com/photo-1494526585095-c41746248156",
    ),
    CidadeClima(
      nome: "Recife",
      temperatura: "27°C",
      condicao: "Nublado",
      icone: "☁️",
      imagem: "https://images.unsplash.com/photo-1500534314209-a25ddb2bd429",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.sizeOf(context).width;

    String dispositivo;
    int colunas;

    if (largura < 600) {
      dispositivo = "Celular";
      colunas = 1;
    } else if (largura < 900) {
      dispositivo = "Tablet";
      colunas = 2;
    } else {
      dispositivo = "Desktop";
      colunas = 4;
    }

    List<CidadeClima> cidadesExibidas =
        largura < 600 ? cidades.take(4).toList() : cidades;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CLIMA -- 22501959"),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            Widget conteudo = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 4 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 143, 17, 216),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pintou o clima, sentiu? 😏🔥",
                              style: TextStyle(fontSize: 36),
                            ),
                            Text(
                              "Confira as condições do tempo em diversas cidades pelo meu aplicativo!!",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Largura atual: ${largura.toStringAsFixed(0)} px",
                ),
                Text(
                  "Dispositivo: $dispositivo",
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    "Ensolarado",
                    "Chuvoso",
                    "Frio",
                    "Quente",
                    "Nublado",
                    "Vento Forte",
                    "Tempestade"
                  ]
                      .map(
                        (e) => Chip(
                          label: Text(e),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 15),
                if (dispositivo == "Celular")
                  Center(
                    child: Card(
                      color: Colors.amber[100],
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Cidade em destaque: Belo Horizonte",
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 15),
                AreaCidades(
                  cidades: cidadesExibidas,
                  colunas: colunas,
                ),
                const SizedBox(height: 15),
                if (dispositivo == "Tablet")
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Ver previsão para 7 dias",
                      ),
                    ),
                  ),
                if (dispositivo == "Desktop")
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Dados climáticos atualizados em tempo real.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            );

            if (largura >= 900) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: conteudo,
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: PainelInformacoes(),
                  ),
                ],
              );
            }

            return Column(
              children: [
                conteudo,
                const SizedBox(height: 15),
                const PainelInformacoes(),
              ],
            );
          },
        ),
      ),
    );
  }
}
