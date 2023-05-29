import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../design_system/widgets/listtile.dart';
import '../../../widgets/servico/servico_listtile.dart';
import '../../../widgets/servico/servico_viewmodel.dart';
import '../../propostas_service/proposta_history_view.dart';

class ListServicos extends StatelessWidget {
  final List<ServicoViewModel> servicos;
  const ListServicos({Key? key, required this.servicos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: servicos.length,
      itemBuilder: (context, index) {
        return ServicoListTileVertical(
            viewModel: servicos[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Propostas_service(list_propostas_id: servicos[index].list_propostas,)),
              );
            },
        );
      },
    );
  }
}
