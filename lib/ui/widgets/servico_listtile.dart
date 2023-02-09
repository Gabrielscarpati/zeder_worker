import 'package:flutter/material.dart';
import 'package:zeder/design_system/widgets/text.dart';

import '../../design_system/design_system.dart';

class ServicoListTile extends StatelessWidget {
  const ServicoListTile({super.key});

  String get nomeIcone => 'ac_unit';
  String get nomeServico => 'Eletricista';
  String get valorServico => 'R\$ 100.00 - R\$ 200.00';

  Widget get leading => Container(child: Icon(Icons.ac_unit, fill: 1, color: Colors.white));
  Widget get title => DSTextTitleSecondary(text: nomeServico);
  Widget get subtitle => DSTextSubtitleSecondary(text: valorServico);
  Widget get trailing => const Icon(Icons.ac_unit);

  @override
  Widget build(BuildContext context) {
    return DSCardListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: () {},
    );
  }
}
