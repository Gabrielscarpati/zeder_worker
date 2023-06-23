import 'package:flutter/cupertino.dart';
import 'package:zeder/ui/features/show_list_services_standard/show_list_services_standard_view.dart';
import '../../../data/servico/servico_controller.dart';
import '../../../domain/entities/servico_entity.dart';

class ShowCurrentServicesScreen extends StatefulWidget {
  const ShowCurrentServicesScreen({Key? key}) : super(key: key);

  @override
  State<ShowCurrentServicesScreen> createState() => _ShowCurrentServicesScreenState();
}


class _ShowCurrentServicesScreenState extends State<ShowCurrentServicesScreen> {
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
          return Text('Algo deu errado');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Carregando");
        }
        Map<String, List<ServicoEntity>>? servicosMap = snapshot.data;

        // Access the list from the map using the desired key
        List<ServicoEntity>? servicosList = servicosMap?['currentServices'];

        return ShowListServicesStandardView(
          servicos: servicosList,
          title: 'Servicos Atuais',
          noServicesFoundTitle: "Você não está fazendo nenhum serviço agora,\n pegue um serviço",
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
