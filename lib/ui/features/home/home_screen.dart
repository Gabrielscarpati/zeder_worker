import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/ui/features/home/views/header.dart';
import 'package:zeder/ui/features/home/views/list_all_servicos.dart';
import 'package:zeder/ui/features/home/views/list_leads_accepted.dart';
import 'package:zeder/ui/features/home/views/list_servicos_do_prestador.dart';
import '../../../application/provider/worker_provider.dart';
import '../../widgets/client/client_viewmodel.dart';
import '../../widgets/servico/servico_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WorkerViewModel> clientFuture;
  late Future<List<ServicoViewModel>> servicosFuture;
  late Future<List<ServicoViewModel>> listLeadsNotAcceptedYetFuture;
  late Future<List<ServicoViewModel>> listLeadsAccepted;

  @override
  void initState() {
    super.initState();
    final WorkerProvider _ClientProvider = context.read<WorkerProvider>();
    clientFuture = _ClientProvider.getWorker();
    final ServicoProvider _ServicosProvider = context.read<ServicoProvider>();
    servicosFuture = _ServicosProvider.getListServicos();
    listLeadsNotAcceptedYetFuture = _ServicosProvider.getlistLeadsNotAcceptedYet();
    listLeadsAccepted = _ServicosProvider.getlistLeadsAccepted();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
              FutureBuilder<WorkerViewModel>(
                future: clientFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: SizedBox(height: 50, width: 50,
                        child: CircularProgressIndicator())
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Header(client: snapshot.data!);
                  }
                },
              ),

               SizedBox(
                 height: 194,
                 child: FutureBuilder<List<ServicoViewModel>>(
                  future: servicosFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: SizedBox(height: 50, width: 50,
                          child: CircularProgressIndicator())
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListAllServicos(servicos: snapshot.data!);
                        }
                      },
                  ),
               ),
              SizedBox(
                height: 200,
                child: FutureBuilder<List<ServicoViewModel>>(
                  future: listLeadsNotAcceptedYetFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: SizedBox(height: 50, width: 50,
                          child: CircularProgressIndicator())
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListLeadsNotAcceptedYet(servicos: snapshot.data!);
                    }
                  },
                ),
              ),
            SizedBox(
                height: 194,
                child: FutureBuilder<List<ServicoViewModel>>(
                  future: listLeadsAccepted,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: SizedBox(height: 50, width: 50,
                          child: CircularProgressIndicator())
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListLeadsAccepted(servicos: snapshot.data!);
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/ui/features/home/views/header.dart';
import 'package:zeder/ui/features/home/views/list_all_servicos.dart';
import 'package:zeder/ui/features/home/views/list_servicos_do_prestador.dart';
import '../../../application/provider/worker_provider.dart';
import '../../widgets/client/client_viewmodel.dart';
import '../../widgets/servico/servico_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {

    });
  }


  @override
  Widget build(BuildContext context) {
    Future<List<ServicoViewModel>> servicosFuture;
    Future<List<ServicoViewModel>>? servicosDoPrestadorFuture;
    Future<WorkerViewModel> clientFuture;

    final WorkerProvider _ClientProvider = context.watch<WorkerProvider>();
    final ServicoProvider _ServicosProvider = context.watch<ServicoProvider>();
    servicosFuture = _ServicosProvider.getListServicos().then((value){
      servicosDoPrestadorFuture = _ServicosProvider.getListServicosDoPrestador();
      setState(() {

      });
      return value;
    }
    );

    clientFuture = _ClientProvider.getWorker();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
              FutureBuilder<WorkerViewModel>(
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

              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 4, left: 8, right: 8),
                child:  Text("All Available Services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ),

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
                      return ListAllServicos(servicos: snapshot.data!);
                    }
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 4, left: 8, right: 8),
                child: Text("Your services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ),

              SizedBox(
                height: 500,
                child: FutureBuilder<List<ServicoViewModel>>(
                  future: servicosDoPrestadorFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListServicosDoPrestador(servicos: snapshot.data!);
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
*/
