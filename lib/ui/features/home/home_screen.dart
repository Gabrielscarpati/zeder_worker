import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/client_provider.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/ui/features/home/views/dropdown_choose_city.dart';
import 'package:zeder/ui/features/home/views/header.dart';
import 'package:zeder/ui/features/home/views/list_servicos.dart';
import 'package:zeder/ui/features/home/views/list_servicos_do_app.dart';
import '../../../design_system/parameters/colors.dart';
import '../../../design_system/widgets/listtile.dart';
import '../../../design_system/widgets/search_bar_button.dart';
import '../../templates/diferenciais_card_screen.dart';
import '../../templates/orcamento_listtile_screen.dart';
import '../../widgets/client/client_viewmodel.dart';
import '../../widgets/orcamento/orcamento_listtile.dart';
import '../../widgets/servico/servico_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ClientsViewModel> clientFuture;
  late Future<List<ServicoViewModel>> servicosFuture;

  @override
  void initState() {
    super.initState();
    final ClientProvider _ClientProvider = context.read<ClientProvider>();
    clientFuture = _ClientProvider.getClient();
    final ServicoProvider _ServicosProvider = context.read<ServicoProvider>();
    servicosFuture = _ServicosProvider.getListServicos();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900, //ver como pegar a altura da tela
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            children: [
              SizedBox(height: 24,),
              FutureBuilder<ClientsViewModel>(
                future: clientFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Header(client: snapshot.data!);
                  }
                },
              ),

              SearchBarButton(),

               SizedBox(
                 height: 160,
                 child: FutureBuilder<List<ServicoViewModel>>(
                  future: servicosFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListServicos(servicos: snapshot.data!);
                        }
                      },
                  ),
               ),
              ListServicosDoApp(),
            ],
          ),
        ),
      ),
    );
  }
}
