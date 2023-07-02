/*
import 'package:flutter/material.dart';
import 'package:zeder/ui/features/home/views/see_all_services_button.dart';
import 'package:zeder/ui/features/show_job_details/show_job_details_screen.dart';
import '../../../../domain/entities/servico_entity.dart';
import '../../../widgets/servico/servico_listtile.dart';

class ListLeadsAccepted extends StatelessWidget {
  final List<ServicoEntity> servicos;
  const ListLeadsAccepted({Key? key, required this.servicos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool allowGetLeads = false;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 4, left: 8),
              child: Text("Meus serviços", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8,),
              child: SeeAllServicesButton(title: 'Meus serviços', servicos: servicos, allowGetLeads: allowGetLeads, newServico: true, currentServico: false,),
            ),
            //const SizedBox(width: 8,),
          ],
        ),
        Container(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: servicos.length,
            itemBuilder: (context, index) {
              return ServicoListTileVertical(
                viewModel: servicos[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowJobDetailsScreen(servicoViewModel: servicos[index], allowGetLeads: allowGetLeads,)),
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
*/
