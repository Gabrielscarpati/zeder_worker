import 'package:flutter/material.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../../design_system/widgets/icons.dart';
import '../../../../domain/entities/servico_entity.dart';
import '../../all_services_by_cathegory/List_all_service.dart';
import '../../show_list_services_standard/show_current_services_screen.dart';
import '../../show_list_services_standard/show_list_services_standard_view.dart';
import '../../show_list_services_standard/show_new_services_screen.dart';

class SeeAllServicesButton extends StatelessWidget {
  final bool allowGetLeads;
  final String title;
  final List<ServicoEntity> servicos;
  final bool newServico;
  final bool currentServico;
  const SeeAllServicesButton({Key? key, required this.title, required this.servicos, required this.allowGetLeads, required this.newServico, required this.currentServico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*const ShowNewServicesScreen(),
    const ShowCurrentServicesScreen(),*/
    // noServicesFoundTitle: 'Não há nenhum serviço diponível agora,novos\n serviço podem aparecer a qualquer momento',
    return InkWell(
      // noServicesFoundTitle: "Você não está fazendo nenhum serviço agora,\n pegue um serviço",
      onTap: () {
        newServico? Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShowNewServicesScreen()),
        )
        :Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const ShowCurrentServicesScreen(),
          ),
        );
      },

      splashColor: Colors.transparent,
      child: const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(child: Text("Ver todos", style: TextStyle(color: DSColors.primary, fontSize: 18, fontWeight: FontWeight.bold,decoration: TextDecoration.underline ),)),
            DSIconSmallPrimary(iconName: 'magnify'),
          ]
      ),
    );
  }
}
