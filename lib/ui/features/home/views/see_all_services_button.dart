import 'package:flutter/material.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../../design_system/widgets/icons.dart';
import '../../../../domain/entities/servico_entity.dart';
import '../../all_services_by_cathegory/List_all_service.dart';

class SeeAllServicesButton extends StatelessWidget {
  final bool allowGetLeads;
  final String title;
  final List<ServicoEntity> servicos;
  const SeeAllServicesButton({Key? key, required this.title, required this.servicos, required this.allowGetLeads}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListAllServiceView(servicos: servicos, title: title, allowGetLeads: allowGetLeads,)),
        );
      },
      splashColor: Colors.transparent,
      child: const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(child: Text("See All", style: TextStyle(color: DSColors.primary, fontSize: 18, fontWeight: FontWeight.bold,decoration: TextDecoration.underline ),)),
            DSIconSmallPrimary(iconName: 'magnify'),
          ]
      ),
    );
  }
}
