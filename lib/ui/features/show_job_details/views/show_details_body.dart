import 'package:flutter/cupertino.dart';
import 'package:zeder/ui/features/show_job_details/views/show_job_details_listviewbuilder.dart';
import '../../../../domain/entities/servico_entity.dart';

class ShowJobDetaisBody extends StatelessWidget {
  final ServicoEntity servicoViewModel;

  const ShowJobDetaisBody({Key? key, required this.servicoViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowJobDetailsListviewbuilder(servicoDetails: servicoViewModel.serviceDetails),
      ],
    );
  }
}
