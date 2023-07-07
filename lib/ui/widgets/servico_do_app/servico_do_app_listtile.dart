import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/servico_do_app/servico_do_app_viewmodel.dart';

import '../../../domain/entities/tipo_servico_entity.dart';

class ServicosDoPrestadorListTile extends StatelessWidget {
  final TipoServicoEntity viewModel;
  final VoidCallback onTap;
  const ServicosDoPrestadorListTile({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  Widget get icone => DSIconFilledSecondary(iconName: viewModel.icon);
  Widget get titulo => DSTextTitleBoldSecondary(text: viewModel.name);
  Widget get valor => DSTextSubtitleSecondary(text: viewModel.initialPrice.toString());
  Widget get notaAvaliacoes => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DSIconPrimary(iconName: 'seal'),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DSTextTitleBoldSecondary(text: viewModel.numero_de_servicos),//nota
             // DSTextSubtitleSecondary(text: viewModel.qtdeAvaliacoes),
            ],
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: DSCardListTileHorizontal(
        leading: icone,
        title: titulo,
        subtitle: valor,
        trailing: notaAvaliacoes,
        onTap: onTap,
      ),
    );
  }
}
