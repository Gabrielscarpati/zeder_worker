import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/worker_services/worker_services_viewmodel.dart';

class WorkerServicesListTile extends StatelessWidget {
  final WorkerServicesViewModel viewModel;
  final void Function()? onTap;
  const WorkerServicesListTile({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  Widget get icone => DSIconFilledSecondary(iconName: viewModel.icone,);
  Widget get titulo => DSTextTitleBoldSecondary(text: viewModel.servico);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      child: DSCardListTileHorizontal(
        leading: icone,
        title: titulo,
        onTap: onTap,
        trailing: Container(),
      ),
    );
  }
}

