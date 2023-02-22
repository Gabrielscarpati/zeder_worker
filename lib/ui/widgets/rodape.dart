import 'package:flutter/cupertino.dart';

import '../../design_system/widgets/footer.dart';
import '../../design_system/widgets/text.dart';
import 'botoes.dart';

class Rodape extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final String priceRange;
  final String description;
  const Rodape({Key? key, required this.buttonText, required this.onPressed, required this.priceRange, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Footer(
        button: BotaoPadraoGrande(
          texto: buttonText,
          onPressed: onPressed,
        ),
        priceRange: DSTextTitleBoldSecondary(
          text: priceRange,
        ),
        description: DSTextTitleSecondary(
          text: description,
        ));
  }
}
