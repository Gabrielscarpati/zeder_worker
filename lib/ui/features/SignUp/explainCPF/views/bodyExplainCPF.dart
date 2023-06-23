import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/ui.dart';
import '../../../../../design_system/ds_app_bar.dart';
import '../../getUserCPF/getUserCPFScreen.dart';

class BodyExplainCPF extends StatefulWidget {
  const BodyExplainCPF({Key? key,}) : super(key: key);
  @override
  _BodyExplainCPFState createState() => _BodyExplainCPFState();
}
class _BodyExplainCPFState extends State<BodyExplainCPF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBar(title: 'Foto do RG aberto',),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const DSTextTitleBoldSecondary(
              text: 'A foto precisa ser legivel e com\no RG aberto',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: SizedBox(
                height: 320,
                width: 240,
                child: Image.asset(
                  'assets/identidade.png',
                  fit: BoxFit.cover, // Set the fit property to cover the whole space
                ),
              ),
            ),
            const DSTextTitleBoldSecondary(
              text: 'Certifique-se de que todos os campos\npodem ser lidos e a imagem\nnão esta cortada',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BotaoPadraoGrande(
          texto: "CONTINUAR (4/6)",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  const GetUserCPFScreen(),
              )
            );
          },
        ),
      ),
    );
  }
}