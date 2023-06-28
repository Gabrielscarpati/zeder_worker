import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/ui/widgets/servico/servico_viewmodel.dart';
import 'package:zeder/ui/widgets/worker_services/worker_services_viewmodel.dart';

import '../servico_do_app/servico_do_app_viewmodel.dart';

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

class ServicosDoAppListTile extends StatelessWidget {
  final WorkerServicesViewModel viewModel;
  final void Function()? onTap;
  const ServicosDoAppListTile({
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


class ServicosDoAppListTileEntity extends StatelessWidget {
  final TipoServicoEntity viewModel;
  final void Function()? onTap;
  const ServicosDoAppListTileEntity({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  Widget get icone => DSIconFilledSecondary(iconName: viewModel.icon,);
  Widget get titulo => DSTextTitleBoldSecondary(text: viewModel.name);

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


