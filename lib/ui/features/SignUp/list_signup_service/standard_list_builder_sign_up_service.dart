import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import '../../../../application/provider/pesquisa_cidade_provider.dart';
import '../../../../application/provider/tipo_servico_provider.dart';
import '../../../widgets/cities/cities.dart';
import '../../../widgets/cities/cities_viewmodel.dart.dart';
import '../../../widgets/servico_do_app/servico_do_app_viewmodel.dart';
import '../../../widgets/worker_services/worker_services_listtile.dart';

class ListBuilderServices extends StatelessWidget {
  final double paddig;
  final List<ServicoDoAppViewModel> servicos;
  const ListBuilderServices({Key? key, required this.servicos, required this.paddig}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TipoServicoProvider Provider = context.watch<TipoServicoProvider>();
     return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: paddig, left: paddig,),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: servicos.length,
          itemBuilder: (context, index) {
            return ServicosDoAppListTile(
              viewModel: servicos[index],
              onTap: () {
                Provider.addSelectedService(servicos[index]);
              },
            );
          },
        ),
      ),
    );
  }
}


class ListBuilderSelectedCities extends StatelessWidget {

  const ListBuilderSelectedCities({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TipoServicoProvider Provider = context.watch<TipoServicoProvider>();
     List<ServicoDoAppViewModel> selectedServices = Provider.selected_servicos;
     return SizedBox(
       height: 30,
       width: double.infinity,
       child: Padding(
         padding: const EdgeInsets.only(right: 16, left: 16,),
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: selectedServices.length,
           itemBuilder: (context, index) {
             return Padding(
               padding: const EdgeInsets.only(right: 8,),
               child: InkWell(
                 child: Container(
                   width: 162,
                   height: 30,
                   decoration: BoxDecoration(
                     color: DSColors.scaffoldBackground,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       DSTextTitleBoldSecondary(text: selectedServices[index].servico,),
                       const DSIconSmallSecondary(iconName: 'closeCircle',),
                     ],
                   ),
                 ),
                 onTap: () {
                   Provider.removeSelectedService(selectedServices[index]);
                 },
               ),
             );
           },
         ),
       ),
     );
  }
}
