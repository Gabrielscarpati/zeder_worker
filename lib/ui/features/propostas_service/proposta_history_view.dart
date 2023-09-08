import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/proposta/proposta_list.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

import '../../../application/provider/lead_provider.dart';
import '../../../design_system/widgets/DsFutureBuilder.dart';
import '../../../domain/entities/servico_entity.dart';
import '../../widgets/proposta/proposta_viewmodel.dart';
import '../navigation_bar/viewNavigationBarScren.dart';

class Propostas_service extends StatefulWidget {
  final ServicoEntity servico;
  const Propostas_service({Key? key, required this.servico}) : super(key: key);

  @override
  State<Propostas_service> createState() => _Propostas_serviceState();
}

class _Propostas_serviceState extends State<Propostas_service> {
  late Future<PropostaViewModel?> propostaFuture;

  @override
  void initState() {
    super.initState();
    final LeadProvider _ServicosProvider = context.read<LeadProvider>();

    propostaFuture = _ServicosProvider.getPropostaByService(widget.servico.id);
  }

  @override
  Widget build(BuildContext context) {
    GetLocation getLocation = GetLocation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DSColors.scaffoldBackground,
        title: Column(
          children: [
            DSTextTitleSecondary(
              text: getLocation.locationBR
                  ? 'Histórico de Proposta '
                  : ' Proposal History',
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
              child: Divider(
                thickness: 1,
                color: DSColors.tertiary,
              ),
            ),
          ],
        ),
      ),
      body: /*FutureBuilder<PropostaViewModel?>(
        future: propostaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapsot.error}'),
            );
          } else {
            final servicosList = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only( left: 8.0, right: 8.0),
                child: PropostaListTileHorizontal(
                      viewModel: servicosList!,
                      onTap: () {},
                ),
              );
          }
        },
      ),*/
          DSFutureBuilder<PropostaViewModel?>(
              future: propostaFuture,
              builder: (context, AsyncSnapshot<PropostaViewModel?> snapshot) {
                PropostaViewModel? servicosList = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: PropostaListTileHorizontal(
                    viewModel: servicosList!,
                    onTap: () {},
                  ),
                );
              },
              error: getLocation.locationBR
                  ? 'Não há avaliação para\neste serviço ainda'
                  : 'There is no rating yet',
              messageWhenEmpty: getLocation.locationBR
                  ? "Não há avaliação para\neste serviço ainda"
                  : 'There is no rating for\nthis service yet',
              reloadScreen: ViewNavegationBarScreen()),
    );
  }
}

/*FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),*/
