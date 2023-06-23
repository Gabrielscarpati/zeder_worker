import 'package:flutter/cupertino.dart';
import 'package:zeder/ui/features/show_list_services_standard/show_list_services_standard_view.dart';
import '../../../data/servico/servico_controller.dart';
import '../../../domain/entities/servico_entity.dart';

class ShowNewServicesScreen extends StatefulWidget {
  const ShowNewServicesScreen({Key? key}) : super(key: key);

  @override
  State<ShowNewServicesScreen> createState() => _ShowNewServicesScreenState();
}


class _ShowNewServicesScreenState extends State<ShowNewServicesScreen> {

  late Stream<Map<String ,List<ServicoEntity>>> servicosStream;

  @override
  void initState() {
    super.initState();
    servicosStream = ServicoController().fetchServicosStream();
  }
  @override
  Widget build(BuildContext context) {


    return StreamBuilder<Map<String, List<ServicoEntity>>>(
      stream: servicosStream,
      builder: (BuildContext context, AsyncSnapshot<Map<String, List<ServicoEntity>>> snapshot) {

        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Carrengando");
        }
        Map<String, List<ServicoEntity>>? servicosMap = snapshot.data;

        // Access the list from the map using the desired key
        List<ServicoEntity>? servicosList = servicosMap?['allAvailableJobs'];

        return ShowListServicesStandardView(
          servicos: servicosList,
          title: 'Novos Serviços',
          noServicesFoundTitle: 'Não há nenhum serviço diponível agora,novos\n serviço podem aparecer a qualquer momento',
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
