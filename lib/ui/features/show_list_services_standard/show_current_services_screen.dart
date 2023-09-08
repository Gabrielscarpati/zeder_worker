import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/show_list_services_standard/show_list_services_standard_view.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

import '../../../application/provider/worker_provider.dart';
import '../../../data/servico/servico_controller.dart';
import '../../../domain/entities/servico_entity.dart';

class ShowCurrentServicesScreen extends StatefulWidget {
  const ShowCurrentServicesScreen({Key? key}) : super(key: key);

  @override
  State<ShowCurrentServicesScreen> createState() =>
      _ShowCurrentServicesScreenState();
}

class _ShowCurrentServicesScreenState extends State<ShowCurrentServicesScreen> {
  late Stream<List<ServicoEntity>> servicosStream;

  @override
  void initState() {
    super.initState();
    servicosStream =
        ServicoController().fetchWorkerServicesStreamWithParameter();
  }

  @override
  Widget build(BuildContext context) {
    String workerId = context.read<WorkerProvider>().workerId;
    GetLocation getLocation = GetLocation();
    return StreamBuilder<List<ServicoEntity>>(
      stream: servicosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ServicoEntity>> snapshot) {
        if (snapshot.hasError) {
          return Text(getLocation.locationBR
              ? 'Algo deu errado'
              : 'Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()));
        }
        List<ServicoEntity>? servicosList = snapshot.data;

        List<ServicoEntity>? newCurrentServices = [];
        servicosList!.forEach((element) {
          if (element.concluded == false &&
              element.idWorker == workerId &&
              element.payed == true) {
            newCurrentServices.add(element);
          }
        });
        return ShowListServicesStandardView(
          servicos: newCurrentServices,
          title:
              getLocation.locationBR ? 'Servicos Atuais' : 'Current Services',
          noServicesFoundTitle: getLocation.locationBR
              ? "Você não está fazendo nenhum serviço agora,\n pegue um serviço"
              : "You are not doing any service now,\n get a service",
          allowGetLeads: false,
        );
      },
    );
  }
}
