import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/cities/cities_viewmodel.dart.dart';

class CitiesListTile extends StatelessWidget {
  final CitiesViewModel viewModel;
  final VoidCallback onTap;
  const CitiesListTile({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  Widget get icone => DSIconFilledSecondary(iconName: viewModel.icon,);
  Widget get titulo => DSTextTitleBoldSecondary(text: viewModel.city_name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      child: DSCardListTileHorizontal(
        includeTrailing: false,
        leading: icone,
        title: titulo,
        onTap: onTap,
        trailing: SizedBox(),
      ),
    );
  }
}
