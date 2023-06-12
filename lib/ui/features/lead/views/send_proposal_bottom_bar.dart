import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../application/provider/lead_provider.dart';
import '../../../../application/provider/servico_provider.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../../design_system/widgets/buttons.dart';
import '../../../widgets/servico/servico_viewmodel.dart';

class SendProposalBottomBar extends StatelessWidget {
  final ServicoViewModel servico;
  const SendProposalBottomBar({Key? key, required this.servico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeadProvider provider = context.watch<LeadProvider>();
    final ServicoProvider servicoProvider = context.watch<ServicoProvider>();
    return  Container(
        height: 80,
        color: DSColors.cardColor,
        child: Center(
          child: DSButtonLargePrimary(
            text: 'Send proposal',
            onPressed: () {
              //provider.addleadFirebase(servico: servico);
              servicoProvider.atualizarServico(servico);

            },
          ),
        )
    );
  }
}
