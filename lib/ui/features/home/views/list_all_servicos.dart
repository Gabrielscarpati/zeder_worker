import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/home/views/see_all_services_button.dart';
import 'package:zeder/ui/features/show_job_details/show_job_details_screen.dart';
import '../../../../application/provider/servico_provider.dart';
import '../../../../data/firebase/firebase_controller.dart';
import '../../../../data/shared/name_collections.dart';
import '../../../widgets/servico/servico_listtile.dart';
import '../../../widgets/servico/servico_viewmodel.dart';
import '../Widgets/pop_up_explain_names_home_screen.dart';

class ListAllServicos extends StatefulWidget {
  final List<ServicoViewModel> servicos;
  const ListAllServicos({Key? key, required this.servicos}) : super(key: key);

  @override
  State<ListAllServicos> createState() => _ListAllServicosState();
}

class _ListAllServicosState extends State<ListAllServicos> {


  @override
  Widget build(BuildContext context) {
    final ServicoProvider provider = context.read<ServicoProvider>();

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
                  Text("New Services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 2,),
                  Transform.scale(
                    scale: 0.7,
                    child: InkWell(
                        child: DSIconFilledSecondarySmall(iconName: 'help'),
                      onTap: (){
                        provider.showExplanationAllServices(context);
                       // _ServicosProvider.criarServico();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8,),
              child: SeeAllServicesButton(title: 'All Available Services', servicos: widget.servicos, allowGetLeads: allowGetLeads,),
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
                      MaterialPageRoute(builder: (context) => ShowJobDetailsScreen(servicoViewModel: widget.servicos[index], allowGetLeads: allowGetLeads,)),
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