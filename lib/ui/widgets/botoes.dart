import 'package:flutter/cupertino.dart';
import '../../design_system/widgets/buttons.dart';

class BotaoPadrao extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoPadrao({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DSButtonLargePrimary(text: texto, onPressed: onPressed);
  }
}


class BotaoPadraoPequeno extends StatelessWidget {
  final String textoOrangeButton;
  final VoidCallback onPressedOrange;
  final String textoBlueButton;
  final VoidCallback onPressedBlue;

  const BotaoPadraoPequeno({super.key,required this.textoOrangeButton, required this.onPressedOrange, required this.textoBlueButton, required this.onPressedBlue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DSButtonSmallSecondary(text: textoOrangeButton, onPressed: onPressedBlue),
            DSButtonSmallPrimary(text: textoBlueButton, onPressed: onPressedOrange),
          ],
        ),
    );
  }
}

class BotoesEnviarMidia extends StatelessWidget {

  const BotoesEnviarMidia({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DSButtonLargeSendMidiaSecondary(
            onPressed: () {  },
            text: 'MANDAR AUDIO',
            iconName: 'microphone',),
          DSButtonLargeSendMidiaSecondary(
            onPressed: () {  },
            text: 'MANDAR FOTO',
            iconName: 'camera-party-mode',),
          DSButtonLargeSendMidiaSecondary(
            onPressed: () {  },
            text: 'MANDAR VIDEO',
            iconName: 'video',),
        ],
      ),
    );
  }
}

class BotaoEscolherData extends StatelessWidget {

  const BotaoEscolherData({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DSButtonLargeSendMidiaTertiary(
            onPressed: () {  },
            text: '06 November 2023',
            iconName: 'calendar-month-outline',),
          ]
        ),
    );
  }
}










