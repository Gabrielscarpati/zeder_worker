import 'package:flutter/material.dart';
import 'package:zeder/ui/features/lead/views/leads_body.dart';
import 'package:zeder/ui/features/lead/views/send_proposal_bottom_bar.dart';
import '../../../design_system/parameters/colors.dart';
import '../../../domain/entities/servico_entity.dart';

class MakeLeadScreen extends StatelessWidget {
  final ServicoEntity servico;
  const MakeLeadScreen({Key? key, required this.servico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('servicoViewModel.servico'), backgroundColor: DSColors.tertiary,),
      body: const MakeLeadBody(),
      bottomNavigationBar: SendProposalBottomBar(servico: servico,),
    );
  }
}
