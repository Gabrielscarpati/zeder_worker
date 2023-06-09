import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/servico_do_app/servico_do_app_viewmodel.dart';

class ServicosDoPrestadorListTile extends StatelessWidget {
  final ServicoDoAppViewModel viewModel;
  final VoidCallback onTap;
  const ServicosDoPrestadorListTile({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  Widget get icone => DSIconFilledSecondary(iconName: viewModel.icone);
  Widget get titulo => DSTextTitleBoldSecondary(text: viewModel.servico);
  Widget get valor => DSTextSubtitleSecondary(text: viewModel.valor);
  Widget get notaAvaliacoes => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DSIconPrimary(iconName: 'seal'),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DSTextTitleBoldSecondary(text: viewModel.qtdeAvaliacoes),//nota
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
