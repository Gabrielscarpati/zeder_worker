import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/worker_provider.dart';
import 'package:zeder/ui/ui.dart';
import 'package:zeder/ui/widgets/servico/servico_viewmodel.dart';
import 'package:zeder/ui/widgets/servico_do_app/servico_do_app_viewmodel.dart';
import 'package:zeder/ui/widgets/worker_services/worker_services_listtile.dart';
import '../../../application/provider/pesquisa_cidade_provider.dart';
import '../../../application/provider/tipo_servico_provider.dart';
import '../../widgets/cities/cities.dart';
import '../../widgets/cities/cities_viewmodel.dart.dart';
import '../../widgets/worker_services/worker_services_viewmodel.dart';

class ListService extends StatefulWidget {
  const ListService({Key? key}) : super(key: key);

  @override
  State<ListService> createState() => _ListServiceState();
}

class _ListServiceState extends State<ListService> {
  @override
  Widget build(BuildContext context) {
    final WorkerProvider _Provider = context.watch<WorkerProvider>();
    List<WorkerServicesViewModel> servicos = _Provider.my_services;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8,),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: servicos.length,
          itemBuilder: (context, index) {
            return WorkerServicesListTile(
              viewModel: servicos[index],
              onTap: () {

              },
            );
          },
        ),
      ),
    );
  }
}
