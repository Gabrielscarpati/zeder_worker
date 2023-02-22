import 'package:flutter/material.dart';

import '../widgets/botoes.dart';

class BotoesScreen extends StatelessWidget {
  const BotoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botão Padrão"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BotaoPadraoGrande(texto: "FAZER ORÇAMENTO", onPressed: () => print("FAZER ORÇAMENTO")),
            const SizedBox(height: 20),
            BotaoSecundarioGrande(texto: "VOLTAR", onPressed: () => print("VOLTAR")),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BarraBotoesPadraoPequeno(
                textoBotaoPadrao: "ACEITAR",
                onPressedBotaoPadrao: () => print("ACEITAR"),
                textoBotaoSecundario: "RECUSAR",
                onPressedBotaoSecundario: () => print("RECUSAR"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
