import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../application/provider/tipo_servico_provider.dart';
import '../../../widgets/servico_do_app/servico_do_app_listtile.dart';
import '../../../widgets/servico_do_app/servico_do_app_viewmodel.dart';

class ListServicosDoApp extends StatelessWidget {
  const ListServicosDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TipoServicoProvider _Provider = context.watch<TipoServicoProvider>();
    List<ServicoDoAppViewModel> servicos= _Provider.getListaDeServicosViewModel();
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: servicos.length,
        itemBuilder: (context, index) {
          return ServicoDoAppListTile(
            viewModel: servicos[index],
            onTap: () {
            },
          );
        },
      ),
    );
  }
}