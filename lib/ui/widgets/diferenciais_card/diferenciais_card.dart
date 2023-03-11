import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

import 'diferenciais_card_view_model.dart';


abstract class DiferenciaisCard extends StatelessWidget {
  final DiferenciaisCardViewModel viewModel;
  final VoidCallback onTap;

  const DiferenciaisCard({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  Widget get icone => DSIconFilledSecondary(iconName: viewModel.icone);
  Widget get titulo => DSTextTitleBoldSecondary(text: viewModel.title);


  bool get incluiIconeNavegarProximo;

  CrossAxisAlignment get valorTempoCrossAxisAlignment;
}

class DiferenciaisCardHorizontal extends DiferenciaisCard {
  const DiferenciaisCardHorizontal({
    super.key,
    required super.viewModel,
    required super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DSCardListTileHorizontal(
      leading: icone,
      title: titulo,
      onTap: onTap,
    );
  }

  @override
  bool get incluiIconeNavegarProximo => true;

  @override
  CrossAxisAlignment get valorTempoCrossAxisAlignment => CrossAxisAlignment.end;
}

class DiferenciaisCardVertical extends DiferenciaisCard {
  const DiferenciaisCardVertical({
    super.key,
    required super.viewModel,
    required super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DSCardListTileVertical(
      header: Container(),
      title: Container(),
      icon: icone,
      footer: titulo,
      color:  DSColors.cardColor,
      onTap: onTap,
    );
  }

  @override
  bool get incluiIconeNavegarProximo => false;

  @override
  CrossAxisAlignment get valorTempoCrossAxisAlignment => CrossAxisAlignment.center;
}
