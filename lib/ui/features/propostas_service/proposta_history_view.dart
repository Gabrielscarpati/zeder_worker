import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/proposta/proposta_list.dart';
import '../../../application/provider/proposta_provider.dart';
import '../../widgets/proposta/proposta_viewmodel.dart';

class Propostas_service extends StatefulWidget {
  final List<dynamic> list_propostas_id;
  const Propostas_service({Key? key, required this.list_propostas_id}) : super(key: key);

  @override
  State<Propostas_service> createState() => _Propostas_serviceState();
}

class _Propostas_serviceState extends State<Propostas_service> {
  late Future<List<PropostaViewModel>> propostasFuture;

  @override
  void initState() {
    super.initState();
    final PropostaProvider _ServicosProvider = context.read<PropostaProvider>();
    print("aqui"+widget.list_propostas_id.toString());

    propostasFuture = _ServicosProvider.getListPropostas(widget.list_propostas_id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DSColors.scaffoldBackground,
        title: const Column(
          children: [
            DSTextTitleSecondary(text:'Proposta History',),
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

      body: FutureBuilder<List<PropostaViewModel>>(
        future: propostasFuture,
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
              return Padding(
                padding: const EdgeInsets.only( left: 8.0, right: 8.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: servicosList!.length,
                  itemBuilder: (context, index) {
                    return PropostaListTileHorizontal(
                      viewModel: servicosList[index],
                      onTap: () {},
                    );
                  },
                ),
              );

          }
        },
      ),
    );
  }
}
