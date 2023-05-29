import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/proposta/proposta_viewmodel.dart';

abstract class PropostaListTile extends StatelessWidget {
  final PropostaViewModel viewModel;
  final VoidCallback onTap;

  const PropostaListTile({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  Widget get icone => DSIconFilledSecondary(iconName: 'viewModel.icone');
  Widget get titulo => DSTextTitleBoldSecondary(text: viewModel.idServico);
  Widget get status => viewModel.flgAvisoCliente ? DSTextSubtitleSecondary(text: 'viewModel.status') : DSTextSubtitleTertiary(text: 'viewModel.status');
  Widget get valorData => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: valorTempoCrossAxisAlignment,
        children: [
          DSTextTitleBoldSecondary(text: viewModel.valor.toString()),
          DSTextSubtitleSecondary(text: viewModel.consideracoes),
        ],
      ),
      const SizedBox(width: 8),
      if (incluiIconeNavegarProximo) const DSIconSecondary(iconName: 'menu-right'),
    ],
  );

  bool get incluiIconeNavegarProximo;

  CrossAxisAlignment get valorTempoCrossAxisAlignment;
}

class PropostaListTileHorizontal extends PropostaListTile {
  const PropostaListTileHorizontal({
    super.key,
    required super.viewModel,
    required super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DSCardListTileHorizontal(
      leading: icone,
      title: titulo,
      subtitle: status,
      trailing: valorData,
      color: viewModel.flgAvisoCliente ? DSColors.primary : null,
      onTap: onTap,
    );
  }

  @override
  bool get incluiIconeNavegarProximo => true;

  @override
  CrossAxisAlignment get valorTempoCrossAxisAlignment => CrossAxisAlignment.end;
}

class OrcamentoListTileVertical extends PropostaListTile {
  const OrcamentoListTileVertical({
    super.key,
    required super.viewModel,
    required super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DSCardListTileVertical(
      header: status,
      title: titulo,
      icon: icone,
      footer: valorData,
      color: viewModel.flgAvisoCliente ? DSColors.primary : null,
      onTap: onTap,
    );
  }

  @override
  bool get incluiIconeNavegarProximo => false;

  @override
  CrossAxisAlignment get valorTempoCrossAxisAlignment => CrossAxisAlignment.center;
}
