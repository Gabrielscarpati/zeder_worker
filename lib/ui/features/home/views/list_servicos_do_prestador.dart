import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/home/views/see_all_services_button.dart';
import 'package:zeder/ui/widgets/servico/servico_listtile.dart';

import '../../../../application/provider/servico_provider.dart';
import '../../../../design_system/widgets/icons.dart';
import '../../../../domain/entities/servico_entity.dart';
import '../../../../utils/flutter_get_Location.dart';
import '../../show_job_details/show_job_details_screen.dart';

class CurrentServices extends StatelessWidget {
  final List<ServicoEntity> servicos;
  const CurrentServices({Key? key, required this.servicos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServicoProvider provider = context.read<ServicoProvider>();
    GetLocation getLocation = GetLocation();

    bool allowGetLeads = false;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  getLocation.locationBR
                      ? "Servicos atuais"
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
                      provider.showExplanationOpenServices(
                        context,
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: SeeAllServicesButton(
                title: getLocation.locationBR
                    ? "Servicos atuais"
                    : "Current services",
                servicos: servicos,
                allowGetLeads: allowGetLeads,
                newServico: false,
                currentServico: true,
              ),
            ),
            //const SizedBox(width: 8,),
          ],
        ),
        Container(
          height: 306,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: servicos.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ServicoListTileHorizontal(
                  viewModel: servicos[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowJobDetailsScreen(
                                servicoViewModel: servicos[index],
                                allowGetLeads: allowGetLeads,
                              )),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
