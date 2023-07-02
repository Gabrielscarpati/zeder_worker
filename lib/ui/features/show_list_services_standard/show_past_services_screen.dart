import 'package:flutter/material.dart';
import 'package:zeder/ui/features/show_list_services_standard/show_list_services_standard_view.dart';
import '../../../data/firebase/firebase_controller.dart';
import '../../../data/servico/servico_controller.dart';
import '../../../domain/entities/servico_entity.dart';

class ShowPastServicesScreen extends StatefulWidget {
  const ShowPastServicesScreen({Key? key}) : super(key: key);

  @override
  State<ShowPastServicesScreen> createState() => _ShowPastServicesScreenState();
}


class _ShowPastServicesScreenState extends State<ShowPastServicesScreen> {
  late Stream<List<ServicoEntity>> servicosStream;

  @override
  void initState() {
    super.initState();
    servicosStream = ServicoController().fetchWorkerServicesStreamWithParameter();
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
        List<ServicoEntity>? servicosList = snapshot.data;
        FirebaseController firebaseController = FirebaseController();

        List<ServicoEntity>? newPastServices = [];
        for (var element in servicosList!) {
            if(element.concluded == true && element.idWorker == firebaseController.getCurrentUser()!.uid){
              newPastServices.add(element);
            }
          }
        return ShowListServicesStandardView(
          servicos: newPastServices,
          title: 'Serviços Passados',
          noServicesFoundTitle: "Você ainda não finalizou nenhum serviço ainda",
          allowGetLeads: false,
        );
      },
    );
  /* StreamBuilder<List<ServicoEntity>>(
      stream: servicosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ServicoEntity>> snapshot) {

        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Container(
                height: 50,
                width: 50,
                  child: CircularProgressIndicator()
              ),
            ),
          );
        }
        //Map<String, List<ServicoEntity>>? servicosMap = snapshot.data;

        // Access the list from the map using the desired key
        List<ServicoEntity>? servicosList = snapshot.data;

        return ShowListServicesStandardView(
          servicos: servicosList,
          title: 'Serviços Passados',
          noServicesFoundTitle: "Você ainda não finalizou nenhum serviço ainda",
          allowGetLeads: false,
        );
      },
    );*/
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
