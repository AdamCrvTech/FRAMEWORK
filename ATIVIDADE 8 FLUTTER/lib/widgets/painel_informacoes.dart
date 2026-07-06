import 'package:flutter/material.dart';

class PainelInformacoes extends StatelessWidget {
  const PainelInformacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Text(
              "Informações Extras",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Text("Umidade: 65%"),
            Text("Vento: 12 km/h"),
            Text("Sensação térmica: 30°C"),
            Text("Nascer do sol: 06:10"),
          ],
        ),
      ),
    );
  }
}