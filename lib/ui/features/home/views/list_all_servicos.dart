import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/home/views/see_all_services_button.dart';
import 'package:zeder/ui/features/show_job_details/show_job_details_screen.dart';

import '../../../../application/provider/servico_provider.dart';
import '../../../../domain/entities/servico_entity.dart';
import '../../../../utils/flutter_get_Location.dart';
import '../../../widgets/servico/servico_listtile.dart';

class ListAllServicos extends StatefulWidget {
  final List<ServicoEntity> servicos;
  const ListAllServicos({Key? key, required this.servicos}) : super(key: key);

  @override
  State<ListAllServicos> createState() => _ListAllServicosState();
}

class _ListAllServicosState extends State<ListAllServicos> {
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
                        // _ServicosProvider.criarServico();
                      },
                    ),
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
                    ? 'Todos servicos disponíveis'
                    : 'All available services',
                servicos: widget.servicos,
                allowGetLeads: allowGetLeads,
                newServico: true,
                currentServico: false,
              ),
            ),
            //const SizedBox(width: 8,),
          ],
        ),
        Container(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.servicos.length,
            itemBuilder: (context, index) {
              return ServicoListTileVertical(
                viewModel: widget.servicos[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowJobDetailsScreen(
                              servicoViewModel: widget.servicos[index],
                              allowGetLeads: allowGetLeads,
                            )),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
