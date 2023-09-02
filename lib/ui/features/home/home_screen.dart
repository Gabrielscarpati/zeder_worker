import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/home/views/header.dart';
import 'package:zeder/ui/features/home/views/list_all_servicos.dart';
import 'package:zeder/ui/features/home/views/list_all_servicos_empty.dart';
import 'package:zeder/ui/features/home/views/list_servicos_do_prestador.dart';

import '../../../application/provider/worker_provider.dart';
import '../../../data/servico/servico_controller.dart';
import '../../../domain/entities/servico_entity.dart';
import '../../../services/firebase_messaging_service.dart';
import '../../../services/notification_service.dart';
import '../../../utils/flutter_get_Location.dart';
import '../../device_type.dart';
import '../../widgets/client/client_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WorkerViewModel> clientFuture;
  late Stream<List<ServicoEntity>> newServicosStream;
  late Stream<List<ServicoEntity>> currentServicosStream;

  @override
  void initState() {
    super.initState();
    final WorkerProvider _ClientProvider = context.read<WorkerProvider>();
    clientFuture = _ClientProvider.getWorkerLoadDataApp();
    newServicosStream =
        ServicoController().fetchNewServicesStreamWithParameter();
    currentServicosStream =
        ServicoController().fetchWorkerServicesStreamWithParameter();

    initilizeFirebaseMessaging();
    checkNotifications();

    //NativeNotify.registerIOSDevice();
  }

  initilizeFirebaseMessaging() async {
    await Provider.of<FirebaseMessagingService>(context, listen: false)
        .initialize();
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(context, listen: false)
        .checkForNotifications();
  }

  @override
  Widget build(BuildContext context) {
    GetLocation getLocation = GetLocation();

    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop
        ? padding = (screenWidth - 900) / 2
        : padding = 8;
    String workerId = context.read<WorkerProvider>().workerId;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: padding, left: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              FutureBuilder<WorkerViewModel>(
                future: clientFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator()));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Header(client: snapshot.data!);
                  }
                },
              ),
              SizedBox(
                height: 200,
                child: StreamBuilder<List<ServicoEntity>>(
                  stream: newServicosStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ServicoEntity>> snapshot) {
                    if (snapshot.hasError) {
                      return Text(getLocation.locationBR
                          ? 'Algo deu errado'
                          : 'Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator()));
                    }
                    WorkerProvider workerProvider = WorkerProvider();
                    List<ServicoEntity>? services = snapshot.data;
                    List<ServicoEntity>? newServices = [];
                    newServices.clear();

                    for (ServicoEntity service in services!) {
                      bool isWorkerCity = false;
                      bool isWorkerService = false;

                      for (var myCity in workerProvider.my_cities) {
                        if (myCity.id == service.idCity) {
                          isWorkerCity = true;
                        }
                      }
                      for (var myService in workerProvider.my_services) {
                        if (myService.servico ==
                            workerProvider.getServicesByID(
                                id: service.idService)) {
                          isWorkerService = true;
                        }
                      }

                      if (isWorkerCity && isWorkerService && service.payed) {
                        newServices.add(service);
                      }
                    }

                    return newServices.isEmpty
                        ? const ListAllServicosEmpty()
                        : ListAllServicos(servicos: newServices);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 440,
                child: StreamBuilder<List<ServicoEntity>>(
                  stream: currentServicosStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ServicoEntity>> snapshot) {
                    if (snapshot.hasError) {
                      return Text(getLocation.locationBR
                          ? 'Algo deu errado'
                          : 'Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator()));
                    }

                    List<ServicoEntity>? currentServices = snapshot.data;
                    List<ServicoEntity>? newCurrentServices = [];
                    currentServices!.forEach((element) {
                      if (element.concluded == false &&
                          element.idWorker == workerId &&
                          element.payed == true) {
                        newCurrentServices.add(element);
                      }
                    });

                    return Column(
                      children: [
                        newCurrentServices.isEmpty
                            ? const ListCurrentServicosEmpty()
                            : CurrentServices(servicos: newCurrentServices)
                      ],
                    );
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
