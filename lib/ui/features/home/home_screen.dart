import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/ui/features/home/views/header.dart';
import 'package:zeder/ui/features/home/views/list_all_servicos.dart';
import 'package:zeder/ui/features/home/views/list_all_servicos_empty.dart';
import 'package:zeder/ui/features/home/views/list_leads_accepted.dart';
import 'package:zeder/ui/features/home/views/list_servicos_do_prestador.dart';
import '../../../application/provider/worker_provider.dart';
import '../../../core/utils/bool_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../data/firebase/firebase_controller.dart';
import '../../../data/servico/servico_controller.dart';
import '../../device_type.dart';
import '../../widgets/client/client_viewmodel.dart';
import '../../widgets/servico/servico_viewmodel.dart';
import 'Widgets/pop_up_explain_names_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WorkerViewModel> clientFuture;
  late Stream<Map<String ,List<ServicoViewModel>>> servicosStream;

  @override
  void initState() {
    super.initState();
    final WorkerProvider _ClientProvider = context.read<WorkerProvider>();
    clientFuture = _ClientProvider.getWorker();
    servicosStream = ServicoController().fetchServicosStream();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop? padding = (screenWidth-900)/2 : padding = 8;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: padding, left: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24,),
              FutureBuilder<WorkerViewModel>(
                future: clientFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: SizedBox(height: 50, width: 50,
                        child: CircularProgressIndicator())
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Header(client: snapshot.data!);
                  }
                },
              ),
               /*SizedBox(
                 height: 200,
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
               ),*/
              Container(
                height: 514,
                child: StreamBuilder<Map<String, List<ServicoViewModel>>>(
                  stream: servicosStream,
                  builder: (BuildContext context, AsyncSnapshot<Map<String, List<ServicoViewModel>>> snapshot) {

                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: SizedBox(height: 50, width: 50,
                          child: CircularProgressIndicator())
                      );
                    }
                    Map<String, List<ServicoViewModel>>? servicosMap = snapshot.data;
                    List<ServicoViewModel>? servicosList = servicosMap?['allAvailableJobs'];
                    List<ServicoViewModel>? currentServices = servicosMap?['currentServices'];
                    return Column(
                      children: [
                        servicosList!.isEmpty? const ListAllServicosEmpty(title: 'There are no new services available,new\n services can show up at any moment',):
                         ListAllServicos(servicos: servicosList),
                        const SizedBox(height: 20,),
                        currentServices!.isEmpty? const ListAllServicosEmpty(title: "You are not doing any service right now,\n get a service form the list above",):
                        CurrentServices(servicos: currentServices),
                      ],
                    );
                  },
                ),
              ),

             /*Container(
                height: 200,
                child: StreamBuilder<Map<String, List<ServicoViewModel>>>(
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

                    return ListLeadsNotAcceptedYet(servicos: servicosList!);
                  },
                ),
              ),*/
              /*SizedBox(
                height: 300,
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
              ),*/
           /* SizedBox(
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
              ),*/
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
