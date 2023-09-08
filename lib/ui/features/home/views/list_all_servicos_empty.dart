import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/home/views/see_all_services_button.dart';

import '../../../../application/provider/servico_provider.dart';
import '../../../../utils/flutter_get_Location.dart';

class ListAllServicosEmpty extends StatefulWidget {
  const ListAllServicosEmpty({
    Key? key,
  }) : super(key: key);

  @override
  State<ListAllServicosEmpty> createState() => _ListAllServicosEmptyState();
}

class _ListAllServicosEmptyState extends State<ListAllServicosEmpty> {
  @override
  Widget build(BuildContext context) {
    final ServicoProvider provider = context.read<ServicoProvider>();
    GetLocation getLocation = GetLocation();

    bool allowGetLeads = true;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 4, left: 8),
              child: Row(
                children: [
                  Text(
                    getLocation.locationBR ? "Novos serviços" : "New services",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: InkWell(
                        child: DSIconFilledSecondarySmall(iconName: 'help'),
                        onTap: () {
                          provider.showExplanationAllServices(context);
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: SeeAllServicesButton(
                  title: getLocation.locationBR
                      ? 'Todos serviços disponíveis'
                      : 'All available services',
                  servicos: [],
                  allowGetLeads: allowGetLeads,
                  newServico: true,
                  currentServico: false),
            ),
            //const SizedBox(width: 8,),
          ],
        ),
        Container(
          height: 160,
          child: Center(
            child: Text(
              getLocation.locationBR
                  ? 'Não há novos serviços disponíveis,novos\n serviços podem aparecer a qualquer momento'
                  : 'There are no new services available, new\n services may appear at any time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class ListCurrentServicosEmpty extends StatefulWidget {
  const ListCurrentServicosEmpty({
    Key? key,
  }) : super(key: key);

  @override
  State<ListCurrentServicosEmpty> createState() =>
      _ListCurrentServicosEmptyState();
}

class _ListCurrentServicosEmptyState extends State<ListCurrentServicosEmpty> {
  @override
  Widget build(BuildContext context) {
    GetLocation getLocation = GetLocation();

    final ServicoProvider provider = context.read<ServicoProvider>();
    bool allowGetLeads = false;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 4, left: 8),
              child: Row(
                children: [
                  Text(
                    getLocation.locationBR
                        ? 'Serviços atuais'
                        : "Current services",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: InkWell(
                        child: DSIconFilledSecondarySmall(iconName: 'help'),
                        onTap: () {
                          provider.showExplanationOpenServices(context);
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: SeeAllServicesButton(
                  title: getLocation.locationBR
                      ? 'Todos serviços disponíveis'
                      : "All available Services",
                  servicos: [],
                  allowGetLeads: allowGetLeads,
                  newServico: false,
                  currentServico: true),
            ),
            //const SizedBox(width: 8,),
          ],
        ),
        Container(
          height: 160,
          child: Center(
            child: Text(
              getLocation.locationBR
                  ? "Você nâo está fazendo nenhum serviços agora,\n pege serviços da lista acima"
                  : "You are not doing any services now,\n get services from the list above",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
