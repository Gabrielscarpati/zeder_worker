import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/servico/servico_listtile.dart';
import '../../../application/provider/servico_provider.dart';
import '../../widgets/servico/servico_viewmodel.dart';
import '../propostas_service/proposta_history_view.dart';

class ServiceHistoryView extends StatefulWidget {
  const ServiceHistoryView({Key? key}) : super(key: key);

  @override
  State<ServiceHistoryView> createState() => _ServiceHistoryViewState();
}

class _ServiceHistoryViewState extends State<ServiceHistoryView> {
  late Future<List<ServicoViewModel>> servicosFuture;

  @override
  void initState() {
    super.initState();
    final ServicoProvider _ServicosProvider = context.read<ServicoProvider>();
    servicosFuture = _ServicosProvider.getListServicos();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DSColors.scaffoldBackground,
        title: const Column(
          children: [
            DSTextTitleSecondary(text:'Service History',),
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
              child: Divider(
                thickness: 1,
                color: DSColors.tertiary,
              ),
            ),
          ],
        ),
      ),

      body: FutureBuilder<List<ServicoViewModel>>(
        future: servicosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final servicosList = snapshot.data;
            if (servicosList != null && servicosList.isNotEmpty) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: servicosList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only( left: 8.0, right: 8.0),
                    child: ServicoListTileHorizontal(
                      viewModel: servicosList[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Propostas_service(list_propostas_id: servicosList[index].list_propostas,)),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No service history found.'),
              );
            }
          }
        },
      ),
    );
  }
}
