import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import '../../../../application/provider/servico_provider.dart';
import '../../../../domain/entities/servico_entity.dart';
import '../../propostas_service/proposta_history_view.dart';

class GetTheLeadBottomBar extends StatelessWidget {
  final bool allowGetLeads;
  final ServicoEntity servico;
  const GetTheLeadBottomBar({Key? key, required this.servico, required this.allowGetLeads}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServicoProvider servicoProvider = context.watch<ServicoProvider>();

    return Container(
      height: 80,
      color: DSColors.cardColor,
      child: Center(
        child:
            allowGetLeads == true
          ? DSButtonLargePrimary(
            text: 'Get This Lead',
            onPressed: () async {
              await servicoProvider.setServiceAsCurrent(servico);
              Navigator.pop(context);
             /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MakeLeadScreen(servico: servico,)),
              );*/
            },
          )
         : DSButtonLargePrimary(
          text: 'Done',
          onPressed: () {
            /*Navigator.push(
              context,
              // professional's lead in this job
              MaterialPageRoute(builder: (context) => Propostas_service(servico: servico,)),
            );*/
          },
        ),
      )
    );
  }
}
