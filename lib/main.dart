import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/ui.dart';
import 'package:zeder/ui/widgets/icone_servicos_nessa_cidade.dart';
import 'package:zeder/ui/widgets/rodape.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DSTheme.theme(context),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BotaoPadrao(
              texto: "FAZER ORÇAMENTO",
              onPressed: () => print("TESTE"),
            ),
            BotaoPadraoPequeno(
              textoOrangeButton: 'RECUSAR',
              onPressedOrange: () {  },
              textoBlueButton: 'ACEITAR',
              onPressedBlue: () {  },),
            BotoesEnviarMidia(),
            BotaoEscolherData(),
            IconeServicosNessaCidade(),
            OrcamentoListTile(),
            Rodape(buttonText: 'Peça orçamento gratuito',
                onPressed: () {  },
                priceRange: 'R\$ 100 - 622',
                description: 'Preço médio estimado',),
            const DSDiferencialInfo()
          ],
        ),
      ),
    );
  }
}
