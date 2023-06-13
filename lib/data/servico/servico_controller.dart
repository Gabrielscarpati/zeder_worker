import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../application/provider/logInSignUpProvider.dart';
import '../../application/provider/worker_provider.dart';
import '../../core/utils/bool_utils.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/servico_entity.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';
import '../../ui/widgets/client/client_viewmodel.dart';
import '../../ui/widgets/servico/servico_viewmodel.dart';
import '../../ui/widgets/worker_services/worker_services_viewmodel.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class ServicoController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.servicoCollection;

  Future<bool> cadastrarServico(ServicoEntity servico) async {
    try {
       await _firebase.cadastrarDado(
        data: servico,
        collection: _collection,
      );

      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarServico(ServicoEntity servico) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: servico.id,
        data: servico,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<ServicoEntity> buscarServico(String servicoId) async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: servicoId,
      );
      final servico = ServicoEntity.fromJson(dado);
      return servico;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<ServicoEntity>> buscarServicoComCondicao({required String cond, required String condName })async{
    List<ServicoEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond,  condName: condName  );
      //final response = await _db.collection('servico').where('idTipoServico', isEqualTo: '1').get();
      dado.forEach((element) {
        retorno.add(ServicoEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

/*  Stream<List<ServicoViewModel>> fetchServicosStream() {
    Stream<List<ServicoViewModel>> Servicos = FirebaseFirestore.instance.collection('servico').snapshots()
        .asyncMap<List<ServicoViewModel>>((QuerySnapshot snapshot) async {

      WorkerViewModel worker = await WorkerProvider().getWorker();
      return snapshot.docs.map<ServicoViewModel>((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

        FirebaseController firebaseController = FirebaseController();

         List<dynamic> worker_servicos_ids = worker.my_services;
            print('aaaaaaaa');

            print(worker_servicos_ids);

            for(var id in worker_servicos_ids){
              servicos.removeWhere((service) => service.idService != id);

            }
            return ServicoViewModel(
              id: data['id'],
              dataPropostaFeita: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
              dataPropostaAceita: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
              dataPagamento: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
              clientGivenDate: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
              descricao: data['descricao'] ?? '',
              flgClientSaw: BoolUtil.toBoolDefaultFalse(data['flgClientSaw']),
              flgWorkerSaw: BoolUtil.toBoolDefaultFalse(data['flgWorkerSaw']),
              icone: data['icone'] ?? '',
              idCity: data['idCity'] ?? '',
              idClient: data['idClient'] ?? '',
              idDisputa: data['idDisputa'] ?? '',
              idWorker: data['idWorker'] ?? '',
              idAcceptedLead: data['idAcceptedLead'] ?? '',
              idsWorkersBid: data['idsWorkersBid'] ?? [],
              serviceDetails: data['serviceDetails'] ?? {},
              service: data['service'] ?? '',
              idService: data['idService'] ?? '',
              smallerValue: data['smallerValue'] ?? '',
              greaterValue: data['greaterValue'] ?? '',
              servicePrice: data['servicePrice'] ?? '',
              areThereBids: BoolUtil.toBoolDefaultFalse(data['areThereBids']),
              clientAcceptedABid: BoolUtil.toBoolDefaultFalse(data['clientAcceptedABid']),
              waitingPayment: BoolUtil.toBoolDefaultFalse(data['waitingPayment']),
              payed: BoolUtil.toBoolDefaultFalse(data['payed']),
              doing: BoolUtil.toBoolDefaultFalse(data['doing']),
              concluded: BoolUtil.toBoolDefaultFalse(data['concluded']),
              emDisputa: BoolUtil.toBoolDefaultFalse(data['emDisputa']),
              reembolsado: BoolUtil.toBoolDefaultFalse(data['reembolsado']),
              disputaFinalizada: BoolUtil.toBoolDefaultFalse(data['disputaFinalizada']),
            );

          },

        ).toList();
      },

    );
    return  Servicos;
  }*/




//  WorkerViewModel worker = await WorkerProvider().getWorker();
/*  Stream<Map<String, List<ServicoViewModel>>> fetchServicosStream() {
    Stream<List<ServicoViewModel>> servicosListStream =
    FirebaseFirestore.instance.collection('servico').snapshots().asyncMap((QuerySnapshot snapshot) {
      return processSnapshot(snapshot);
    });

    return servicosListStream.map((List<ServicoViewModel> servicos) {
      return {'servicos': servicos};
    });
  }*/


  WorkerProvider workerProvider = WorkerProvider();

  Stream<Map<String, List<ServicoEntity>>> checkThisIsAWorkerServiceElseRemove(Stream<List<ServicoEntity>> servicos) {
    FirebaseController firebaseController = FirebaseController();
    List<ServicoEntity> allAvailableJobs = [];
    List<ServicoEntity> currentServices = [];
    List<ServicoEntity> pastJobs = [];
    Map<String, List<ServicoEntity>> map_padrao_empty = {
      'allAvailableJobs': [],
      'currentServices': [],
      'pastJobs': [],
    };

    StreamController<Map<String, List<ServicoEntity>>> controller = StreamController<Map<String, List<ServicoEntity>>>();

    servicos.listen((List<ServicoEntity> snapshot) {
      WorkerProvider workerProvider = WorkerProvider();
      for (var serviceSnapshot in snapshot) {
        bool addServiceCity = false;
        bool addServiceServiceId = false;

        for (CitiesViewModel city in workerProvider.my_cities) {
          if (city.city_name == serviceSnapshot.idCity) {
            addServiceCity = true;
            break;
          }
        }

        for (WorkerServicesViewModel service in workerProvider.my_services) {
          if (service.servico == workerProvider.getServicesByID(id: serviceSnapshot.idService)) {
            addServiceServiceId = true;
            break;
          }
        }

        if (addServiceCity == true && addServiceServiceId == true) {
          if (serviceSnapshot.idWorker == '') {
            allAvailableJobs.add(serviceSnapshot);
          }

          if (serviceSnapshot.idWorker == firebaseController.getCurrentUser()!.uid) {
            currentServices.add(serviceSnapshot);
          }

          if (serviceSnapshot.concluded == true && serviceSnapshot.idWorker == firebaseController.getCurrentUser()!.uid) {
            pastJobs.add(serviceSnapshot);
          }
          Map<String, List<ServicoEntity>> map_all_Status = {
            'allAvailableJobs': allAvailableJobs,
            'currentServices': currentServices,
            'pastJobs': pastJobs,
          };

          controller.add(map_all_Status);
        }
        else {
          controller.add(map_padrao_empty);
          }
        }
      }
    );
    return controller.stream;
  }


  Stream<Map<String, List<ServicoEntity>>> fetchServicosStream() {
    CollectionReference servicosCollection = FirebaseFirestore.instance.collection('servico');

    StreamController<Map<String, List<ServicoEntity>>> controller = StreamController<Map<String, List<ServicoEntity>>>();

    servicosCollection.snapshots().listen((QuerySnapshot snapshot) {
      List<ServicoEntity> servicosList = processSnapshot(snapshot);

      Stream<Map<String, List<ServicoEntity>>> servicos_map = checkThisIsAWorkerServiceElseRemove(Stream.value(servicosList));
      servicos_map.listen((Map<String, List<ServicoEntity>> servicos) {
        controller.add(servicos);
      });
    });

    return controller.stream;
  }

  List<ServicoEntity> processSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map<ServicoEntity>((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      return createServicoViewModel(data);
    }
    ).toList();
  }

  ServicoEntity createServicoViewModel(Map<String, dynamic> data,) {
    ServicoEntity newServico =  ServicoEntity(
      id: data['id'],
      dataPropostaFeita: convertTimestampToDateTime(data['dataPropostaFeita']),
      dataPropostaAceita: convertTimestampToDateTime(data['dataPropostaAceita']),
      dataPagamento: convertTimestampToDateTime(data['dataPagamento']),
      clientGivenDate:convertTimestampToDateTime(data['clientGivenDate']),
      descricao: data['descricao'] ?? '',
      flgClientSaw: BoolUtil.toBoolDefaultFalse(data['flgClientSaw']),
      flgWorkerSaw: BoolUtil.toBoolDefaultFalse(data['flgWorkerSaw']),
      icone: data['icone'] ?? '',
      idCity: data['idCity'] ?? '',
      idClient: data['idClient'] ?? '',
      idDisputa: data['idDisputa'] ?? '',
      idWorker: data['idWorker'] ?? '',
      serviceDetails: data['serviceDetails'] ?? {},
      service: data['service'] ?? '',
      idService: data['idService'] ?? '',
      servicePrice: data['servicePrice'] ?? "",
      waitingPayment: BoolUtil.toBoolDefaultFalse(data['waitingPayment']),
      payed: BoolUtil.toBoolDefaultFalse(data['payed']),
      doing: BoolUtil.toBoolDefaultFalse(data['doing']),
      concluded: BoolUtil.toBoolDefaultFalse(data['concluded']),
      emDisputa: BoolUtil.toBoolDefaultFalse(data['emDisputa']),
      reembolsado: BoolUtil.toBoolDefaultFalse(data['reembolsado']),
      disputaFinalizada: BoolUtil.toBoolDefaultFalse(data['disputaFinalizada']),
    );
    return newServico;
  }

}

/*Stream<List<ServicoViewModel>> servicos = FirebaseFirestore.instance
    .collection('servico')
    .snapshots()
    .asyncMap<List<ServicoViewModel>>((QuerySnapshot snapshot) async {
  return snapshot.docs.map<ServicoViewModel>((DocumentSnapshot document) async {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    FirebaseController firebaseController = FirebaseController();
    WorkerViewModel worker = await WorkerProvider().getWorker();

    // Rest of your code...

    return ServicoViewModel(
      // ServicoViewModel properties...
    );
  }).toList();
});*/

/*Future<List<ServicoViewModel>> fetchServicos() async {
  FirebaseController firebaseController = FirebaseController();
  final snapshot = await FirebaseFirestore.instance.collection('servico').get();
  List<ServicoViewModel> servicos = [];
  for (var doc in snapshot.docs) {
    Map<String, dynamic> data = doc.data();
    servicos.add(ServicoViewModel(
      id: data['id'],
      dataPropostaFeita: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
      dataPropostaAceita: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
      dataPagamento: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
      clientGivenDate: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
      descricao: data['descricao'] ?? '',
      flgClientSaw: BoolUtil.toBoolDefaultFalse(data['flgClientSaw']),
      flgWorkerSaw: BoolUtil.toBoolDefaultFalse(data['flgWorkerSaw']),
      icone: data['icone'] ?? '',
      idCity: data['idCity'] ?? '',
      idClient: data['idClient'] ?? '',
      idDisputa: data['idDisputa'] ?? '',
      idWorker: data['idWorker'] ?? '',
      idAcceptedLead: data['idAcceptedLead'] ?? '',
      idsWorkersBid: data['idsWorkersBid'] ?? [],
      serviceDetails: data['serviceDetails'] ?? {},
      service: data['service'] ?? '',
      idService: data['idService'] ?? '',
      smallerValue: data['smallerValue'] ?? '',
      greaterValue: data['greaterValue'] ?? '',
      servicePrice: data['servicePrice'] ?? '',
      areThereBids: BoolUtil.toBoolDefaultFalse(data['areThereBids']),
      clientAcceptedABid: BoolUtil.toBoolDefaultFalse(data['clientAcceptedABid']),
      waitingPayment: BoolUtil.toBoolDefaultFalse(data['waitingPayment']),
      payed: BoolUtil.toBoolDefaultFalse(data['payed']),
      doing: BoolUtil.toBoolDefaultFalse(data['doing']),
      concluded: BoolUtil.toBoolDefaultFalse(data['concluded']),
      emDisputa: BoolUtil.toBoolDefaultFalse(data['emDisputa']),
      reembolsado: BoolUtil.toBoolDefaultFalse(data['reembolsado']),
      disputaFinalizada: BoolUtil.toBoolDefaultFalse(data['disputaFinalizada']),
      )
    );
  }
  String userId = firebaseController.getCurrentUser()!.uid;
  WorkerViewModel worker = await WorkerProvider().getWorker();
  List<dynamic> worker_servicos_ids = worker.my_services;
  print('aaaaaaaa');

  print(worker_servicos_ids);
  for(var id in worker_servicos_ids){
    servicos.removeWhere((service) => service.idService != id);

/*    for(var service in servicos ){
      if(service.idService != id){
        service.
      }
    }*/
  }
  servicos.clear();

  return servicos;
}
*/
