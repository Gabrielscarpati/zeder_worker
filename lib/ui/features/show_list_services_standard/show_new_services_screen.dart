import 'package:flutter/material.dart';
import 'package:zeder/ui/features/show_list_services_standard/show_list_services_standard_view.dart';
import '../../../application/provider/worker_provider.dart';
import '../../../data/servico/servico_controller.dart';
import '../../../domain/entities/servico_entity.dart';

class ShowNewServicesScreen extends StatefulWidget {
  const ShowNewServicesScreen({Key? key}) : super(key: key);

  @override
  State<ShowNewServicesScreen> createState() => _ShowNewServicesScreenState();
}


class _ShowNewServicesScreenState extends State<ShowNewServicesScreen> {

  late Stream<List<ServicoEntity>> servicosStream;

  @override
  void initState() {
    super.initState();

    servicosStream =  ServicoController().fetchNewServicesStreamWithParameter();
  }
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<ServicoEntity>>(
      stream: servicosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ServicoEntity>> snapshot) {
        if (snapshot.hasError) {
          return const Text('Algo deu errado');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: SizedBox(height: 50, width: 50,
              child: CircularProgressIndicator())
          );
        }
        WorkerProvider workerProvider = WorkerProvider();
        List<ServicoEntity>? services = snapshot.data;
        List<ServicoEntity>? newServices = [];
        newServices.clear();

        for(ServicoEntity service in services!) {
          bool isWorkerCity = false;
          bool isWorkerService = false;

          for (var myCity in workerProvider.my_cities) {
            if (myCity.id == service.idCity) {
              isWorkerCity = true;
            }
          }
          for (var myService in workerProvider.my_services) {
            if (myService.servico ==  workerProvider.getServicesByID(id:service.idService)) {
              isWorkerService = true;
            }
          }

          if (isWorkerCity && isWorkerService) {
            newServices.add(service);
          }
        }

        return ShowListServicesStandardView(
          servicos: newServices,
          title: 'Novos Serviços',
          noServicesFoundTitle: 'Não há nenhum serviço diponível agora,novos\n serviço podem aparecer a qualquer momento',
          allowGetLeads: false,
        );
      },
    );
  }
}

/*StreamBuilder<Map<String, List<ServicoViewModel>>>(
  stream: servicosStream,
  builder: (BuildContext context, AsyncSnapshot<Map<String, List<ServicoViewModel>>> snapshot) {

    if (snapshot.hasError) {
      return Text('Something went wrong');
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text("Loading");
    }
    Map<String, List<ServicoViewModel>>? servicosMap = snapshot.data;

    // Access the list from the map using the desired key
    List<ServicoViewModel>? servicosList = servicosMap?['allAvailableJobs'];
    List<ServicoViewModel>? workerWaitingResponse = servicosMap?['workerWaitingResponse'];

    return Column(
      children: [
         ListAllServicos(servicos: servicosList!),
        const SizedBox(height: 20,),
        ListLeadsNotAcceptedYet(servicos: workerWaitingResponse!),
      ],
    );
  },
),*/
