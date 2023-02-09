import 'package:flutter/cupertino.dart';
import 'package:zeder/design_system/design_system.dart';

class BotaoPadrao extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoPadrao({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DSButtonPrimary(text: texto, onPressed: onPressed);
  }
}
