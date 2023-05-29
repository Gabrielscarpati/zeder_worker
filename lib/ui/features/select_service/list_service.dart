import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/ui.dart';
import 'package:zeder/ui/widgets/servico/servico_viewmodel.dart';
import 'package:zeder/ui/widgets/servico_do_app/servico_do_app_viewmodel.dart';
import '../../../application/provider/pesquisa_cidade_provider.dart';
import '../../../application/provider/tipo_servico_provider.dart';
import '../../widgets/cities/cities.dart';
import '../../widgets/cities/cities_viewmodel.dart.dart';

class ListService extends StatefulWidget {
  const ListService({Key? key}) : super(key: key);

  @override
  State<ListService> createState() => _ListServiceState();
}

class _ListServiceState extends State<ListService> {
  @override
  Widget build(BuildContext context) {
    final TipoServicoProvider _Provider = context.watch<TipoServicoProvider>();
    List<ServicoDoAppViewModel> servicos = _Provider.list_servicos_screen;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8,),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: servicos.length,
          itemBuilder: (context, index) {
            return ServicoDoAppListTile(
              viewModel: servicos[index],
              onTap: () {
                _Provider.set_user_chonsen_servico(servicos[index].servico);
              },
            );
          },
        ),
      ),
    );
  }
}
