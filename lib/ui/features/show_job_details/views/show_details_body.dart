import 'package:flutter/cupertino.dart';
import 'package:zeder/ui/features/show_job_details/views/show_job_details_listviewbuilder.dart';
import '../../../widgets/servico/servico_viewmodel.dart';

class ShowJobDetaisBody extends StatelessWidget {
  final ServicoViewModel servicoViewModel;

  const ShowJobDetaisBody({Key? key, required this.servicoViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowJobDetailsListviewbuilder(servicoDetails: servicoViewModel.service_details),
      ],
    );
  }
}
