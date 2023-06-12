import 'package:flutter/cupertino.dart';
import 'package:zeder/ui/features/show_list_services_standard/show_list_services_standard_view.dart';
import '../../../data/servico/servico_controller.dart';
import '../../widgets/servico/servico_viewmodel.dart';

class ShowCurrentServicesScreen extends StatefulWidget {
  const ShowCurrentServicesScreen({Key? key}) : super(key: key);

  @override
  State<ShowCurrentServicesScreen> createState() => _ShowCurrentServicesScreenState();
}


class _ShowCurrentServicesScreenState extends State<ShowCurrentServicesScreen> {
  late Stream<Map<String ,List<ServicoViewModel>>> servicosStream;

  @override
  void initState() {
    super.initState();
    servicosStream = ServicoController().fetchServicosStream();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, List<ServicoViewModel>>>(
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
        List<ServicoViewModel>? servicosList = servicosMap?['currentServices'];

        return ShowListServicesStandardView(
          servicos: servicosList,
          title: 'Current Services',
          noServicesFoundTitle: "You are not doing any service right now,\n get a service",
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
