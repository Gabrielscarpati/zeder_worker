import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../application/provider/lead_provider.dart';
import '../../../../application/provider/servico_provider.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../../design_system/widgets/buttons.dart';
import '../../../../domain/entities/servico_entity.dart';

class SendProposalBottomBar extends StatelessWidget {
  final ServicoEntity servico;
  const SendProposalBottomBar({Key? key, required this.servico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServicoProvider servicoProvider = context.watch<ServicoProvider>();

    return  Container(
        height: 80,
        color: DSColors.cardColor,
        child: Center(
          child: DSButtonLargePrimary(
            text: 'Enviar proposta',
            onPressed: () {
              servicoProvider.setServiceAsCurrent(servico);

            },
          ),
        )
    );
  }
}
