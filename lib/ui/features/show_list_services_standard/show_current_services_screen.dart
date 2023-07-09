import 'package:flutter/material.dart';
import 'package:zeder/ui/features/show_list_services_standard/show_list_services_standard_view.dart';
import '../../../data/servico/servico_controller.dart';
import '../../../domain/entities/servico_entity.dart';

class ShowCurrentServicesScreen extends StatefulWidget {
  const ShowCurrentServicesScreen({Key? key}) : super(key: key);

  @override
  State<ShowCurrentServicesScreen> createState() => _ShowCurrentServicesScreenState();
}


class _ShowCurrentServicesScreenState extends State<ShowCurrentServicesScreen> {
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

        List<ServicoEntity>? newCurrentServices = [];
        servicosList!.forEach((element) {
          if(element.concluded == false && element.idWorker != '' && element.payed == true){
            newCurrentServices.add(element);
            }
          }
        );
        return ShowListServicesStandardView(
          servicos: newCurrentServices,
          title: 'Servicos Atuais',
          noServicesFoundTitle: "Você não está fazendo nenhum serviço agora,\n pegue um serviço",
          allowGetLeads: false,
        );
      },
    );


      StreamBuilder<List<ServicoEntity>>(
      stream: servicosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ServicoEntity>> snapshot) {

        if (snapshot.hasError) {
          return Text('Algo deu errado');
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
        List<ServicoEntity>? servicosList = snapshot.data;

        return ShowListServicesStandardView(
          servicos: servicosList,
          title: 'Servicos Atuais',
          noServicesFoundTitle: "Você não está fazendo nenhum serviço agora,\n pegue um serviço",
          allowGetLeads: false,
        );
      },
    );
  }
}