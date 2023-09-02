import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/ui.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

import '../../../../../design_system/ds_app_bar.dart';
import '../../getUserCPF/getUserCPFScreen.dart';

class BodyExplainCPF extends StatefulWidget {
  const BodyExplainCPF({
    Key? key,
  }) : super(key: key);
  @override
  _BodyExplainCPFState createState() => _BodyExplainCPFState();
}

class _BodyExplainCPFState extends State<BodyExplainCPF> {
  @override
  Widget build(BuildContext context) {
    GetLocation getLocation = GetLocation();
    return Scaffold(
      appBar: DSAppBar(
        title: getLocation.locationBR ? 'Foto do RG aberto' : 'ID photo',
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            DSTextTitleBoldSecondary(
              text: getLocation.locationBR
                  ? 'A foto precisa ser legivel e com\no RG aberto'
                  : 'The photo must be readable and\nshowing the ID information',
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: SizedBox(
                height: 320,
                width: 240,
                child: Image.asset(
                  'assets/identidade.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            DSTextTitleBoldSecondary(
              text: getLocation.locationBR
                  ? 'Certifique-se de que todos os campos\npodem ser lidos e a imagem\nnão esta cortada'
                  : 'Make sure all fields are readable\nand the image is not cropped',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BotaoPadraoGrande(
          texto: getLocation.locationBR ? "CONTINUAR (4/6)" : "CONTINUE (4/6)",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GetUserCPFScreen(),
            ));
          },
        ),
      ),
    );
  }
}
