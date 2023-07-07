import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/show_job_details/views/show_details_body.dart';
import '../../../domain/entities/servico_entity.dart';
import 'additional_screens/get_the_lead_bottom_bar.dart';

class ShowJobDetailsScreen extends StatelessWidget {
  final bool allowGetLeads;
  final ServicoEntity servicoViewModel;
  const ShowJobDetailsScreen({Key? key, required this.servicoViewModel, required this.allowGetLeads}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(servicoViewModel.service), backgroundColor: DSColors.tertiary,),
        body: ShowJobDetaisBody(servicoViewModel: servicoViewModel),
      bottomNavigationBar: GetTheLeadBottomBar(servico: servicoViewModel, allowGetLeads: allowGetLeads,),
    );
  }
}
