import 'package:flutter/material.dart';
import 'package:zeder/application/provider/worker_provider.dart';
import 'package:zeder/design_system/design_system.dart';
import '../../../domain/entities/servico_entity.dart';

abstract class ServicoListTile extends StatelessWidget {
  final ServicoEntity viewModel;
  final VoidCallback onTap;

   ServicoListTile({
    super.key,
    required this.viewModel,
    required this.onTap,
  });
  WorkerProvider workerProvider = WorkerProvider();
  Widget get icone => DSIconFilledSecondary(iconName: viewModel.icone);
  Widget get titulo => DSTextTitleBoldSecondary(text: viewModel.service);
  Widget get status => DSTextSubtitleSecondary(text: workerProvider.getCitiesByID(id: viewModel.idCity));

  Widget get valorData => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DSTextTitleBoldSecondary(text: '${viewModel.servicePrice}R\$'),
              DSTextSubtitleSecondary(text: viewModel.clientGivenDate),
            ],
          ),
          if (incluiIconeNavegarProximo) const DSIconSecondary(iconName: 'menu-right'),
        ],
      );

  Widget get valorDataVertical => Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DSTextTitleBoldSecondary(text: '${viewModel.servicePrice}R\$'),
              DSTextSubtitleSecondary(text: viewModel.clientGivenDate),
            ],
          ),
          if (incluiIconeNavegarProximo) const DSIconSecondary(iconName: 'menu-right'),
        ],
      );

  bool get incluiIconeNavegarProximo;

  CrossAxisAlignment get valorTempoCrossAxisAlignment;
}

class ServicoListTileHorizontal extends ServicoListTile {
   ServicoListTileHorizontal({
    super.key,
    required super.viewModel,
    required super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DSCardListTileHorizontal(
        leading: icone,
        title: titulo,
        subtitle: status,
        trailing: valorData,
        color: DSColors.cardColor,
        onTap: onTap,
        includeTrailing: true,
      ),
    );
  }

  @override
  bool get incluiIconeNavegarProximo => true;

  @override
  CrossAxisAlignment get valorTempoCrossAxisAlignment => CrossAxisAlignment.end;
}

class ServicoListTileVertical extends ServicoListTile {
   ServicoListTileVertical({
    super.key,
    required super.viewModel,
    required super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DSCardListTileVertical(
        header: status,
        title: titulo,
        icon: icone,
        footer: valorDataVertical,
        color: DSColors.primary.withOpacity(0.3),
        onTap: onTap,
      ),
    );
  }

  @override
  bool get incluiIconeNavegarProximo => false;

  @override
  CrossAxisAlignment get valorTempoCrossAxisAlignment => CrossAxisAlignment.center;
}
