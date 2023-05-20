import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../design_system/widgets/icons.dart';
import '../../design_system/widgets/text.dart';


class IconeServicosNessaCidade extends StatelessWidget {
  final String nomeIcone;
  final String NameServico;
  const IconeServicosNessaCidade({Key? key,
    required this.nomeIcone,
    required this.NameServico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DSIconFilledPrimaryLarge(iconName: nomeIcone),
          DSTextTitleBoldSecondary(text: NameServico,),
      ],),
    );
  }
}
