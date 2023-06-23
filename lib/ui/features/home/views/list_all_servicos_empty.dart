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

class ListAllServicosEmpty extends StatefulWidget {

  const ListAllServicosEmpty({Key? key,}) : super(key: key);

  @override
  State<ListAllServicosEmpty> createState() => _ListAllServicosEmptyState();
}

class _ListAllServicosEmptyState extends State<ListAllServicosEmpty> {


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

                  Text('Novos serviços', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 2,),
                  Transform.scale(
                    scale: 0.7,
                    child: InkWell(
                        child: DSIconFilledSecondarySmall(iconName: 'help'),
                      onTap: (){
                        provider.showExplanationAllServices(context);
                      }
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8,),
              child: SeeAllServicesButton(title: 'Todos serviços disponíveis', servicos: [], allowGetLeads: allowGetLeads,),
            ),
            //const SizedBox(width: 8,),
          ],
        ),
        Container(
          height: 160,
          child: Center(
            child: Text('Não há novos serviços disponíveis,novos\n serviços podem aparecer a qualquer momento', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          ),
        ),
      ],
    );
  }

}


class ListCurrentServicosEmpty extends StatefulWidget {

  const ListCurrentServicosEmpty({Key? key,}) : super(key: key);

  @override
  State<ListCurrentServicosEmpty> createState() => _ListCurrentServicosEmptyState();
}

class _ListCurrentServicosEmptyState extends State<ListCurrentServicosEmpty> {


  @override
  Widget build(BuildContext context) {
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
                  Text('Serviços atuais', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 2,),
                  Transform.scale(
                    scale: 0.7,
                    child: InkWell(
                        child: DSIconFilledSecondarySmall(iconName: 'help'),
                        onTap: (){
                          provider.showExplanationOpenServices(context);
                        }
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8,),
              child: SeeAllServicesButton(title: 'Todos serviços disponíveis', servicos: [], allowGetLeads: allowGetLeads,),
            ),
            //const SizedBox(width: 8,),
          ],
        ),
        Container(
          height: 160,
          child: Center(
            child: Text("Você nâo está fazendo nenhum serviços agora,\n pege serviços um da lista acima", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          ),
        ),
      ],
    );
  }

}