import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../application/provider/worker_provider.dart';
import '../../core/utils/bool_utils.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/servico_entity.dart';
import '../../ui/widgets/client/client_viewmodel.dart';
import '../../ui/widgets/servico/servico_viewmodel.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class ServicoController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.servicoCollection;

  Future<bool> cadastrarServico(ServicoEntity servico) async {
    try {
       await _firebase.atualizarDado(
        data: servico,
        id: servico.id,
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
              acceptedValue: data['acceptedValue'] ?? '',
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



  Future<List<ServicoViewModel>> getlistJobsWorkerWatingGetOrNot( List<ServicoViewModel> list_all_servicos) async {
    FirebaseController firebaseController = FirebaseController();
    List <ServicoViewModel> notAcceptedYet = [];
    for(int i = 0; i < list_all_servicos.length; i++){
      for(int j = 0; j < list_all_servicos[i].idsWorkersBid.length; j++){
        if(list_all_servicos[i].idsWorkersBid[j] == firebaseController.getCurrentUser()!.uid){
          notAcceptedYet.add(list_all_servicos[i]);
        }
      }
    }
    return notAcceptedYet;
  }

  ServicoViewModel criarServicoPadrao(){
    final dataPropostaFeita = '';
    final dataPropostaAceita = '';
    final dataPagamento = '';
    final clientGivenDate = '';
    final descricao = "";
    final flgClientSaw = false;
    final flgWorkerSaw = false;
    final icone = "";
    final idCity = "";
    final idClient = "";
    final idDisputa = "";
    final idWorker = "";
    final idAcceptedLead = "";
    final idsWorkersBid = [];
    final serviceDetails = {};
    final service = "";
    final idService = "";
    final smallerValue = "";
    final greaterValue = "";
    final acceptedValue = "";
    final areThereBids = false;
    final clientAcceptedABid = false;
    final waitingPayment = false;
    final payed = false;
    final doing = false;
    final concluded = false;
    final emDisputa = false;
    final reembolsado = false;
    final disputaFinalizada = false;

    final servicoViewModel = ServicoViewModel(
      dataPropostaFeita: dataPropostaFeita,
      dataPropostaAceita: dataPropostaAceita,
      dataPagamento: dataPagamento,
      clientGivenDate: clientGivenDate,
      descricao: descricao,
      flgClientSaw: flgClientSaw,
      flgWorkerSaw: flgWorkerSaw,
      icone: icone,
      idCity: idCity,
      idClient: idClient,
      idDisputa: idDisputa,
      idWorker: idWorker,
      idAcceptedLead: idAcceptedLead,
      idsWorkersBid: idsWorkersBid,
      serviceDetails: serviceDetails,
      service: service,
      idService: idService,
      smallerValue: smallerValue,
      greaterValue: greaterValue,
      acceptedValue: acceptedValue,
      areThereBids: areThereBids,
      clientAcceptedABid: clientAcceptedABid,
      waitingPayment: waitingPayment,
      payed: payed,
      doing: doing,
      concluded: concluded,
      emDisputa: emDisputa,
      reembolsado: reembolsado,
      disputaFinalizada: disputaFinalizada,
      id: '',
    );
    return servicoViewModel;
  }

/*  Stream<Map<String, List<ServicoViewModel>>> checkThisIsAWorkerServiceElseRemove(Stream<List<ServicoViewModel>> servicos) {
    FirebaseController firebaseController = FirebaseController();
    List<ServicoViewModel> allAvailableJobs = [];
    List<ServicoViewModel> workerWaitingResponse = [];
    List<ServicoViewModel> workerJobAccepeted = [];
    List<ServicoViewModel> workerJobDeclined = [];
    List<ServicoViewModel> pastJobs = [];

    return servicos.asyncMap<Map<String, List<ServicoViewModel>>>((List<ServicoViewModel> snapshot) async {
      for (var servico in snapshot) {
        if (servico.id + servico.icone + servico.idCity + servico.idClient != '' && servico.idsWorkersBid.length < 6) {
          allAvailableJobs.add(servico);
        }
      }

      for(int i = 0; i < allAvailableJobs.length; i++){
        for(int j = 0; j < allAvailableJobs[i].idsWorkersBid.length; j++){
          if(allAvailableJobs[i].idsWorkersBid[j] == firebaseController.getCurrentUser()!.uid){
            workerWaitingResponse.add(allAvailableJobs[i]);
            allAvailableJobs.removeAt(i);
          }
        }
      }

      for(ServicoViewModel waitingResponse in workerWaitingResponse){
        if(waitingResponse.idWorker == firebaseController.getCurrentUser()!.uid){
          workerJobAccepeted.add(waitingResponse);
          workerWaitingResponse.remove(waitingResponse);
        }
        if(waitingResponse.idWorker != firebaseController.getCurrentUser()!.uid && waitingResponse.idWorker != ''){
          workerJobDeclined.add(waitingResponse);
          workerWaitingResponse.remove(waitingResponse);
        }
      }

      for(ServicoViewModel chekIfPastJob in workerJobAccepeted){
        if(chekIfPastJob.concluded == true){
          pastJobs.add(chekIfPastJob);
          workerJobAccepeted.remove(chekIfPastJob);
        }
      }
      Map<String, List<ServicoViewModel>> map_all_Status = {'workerWaitingResponse': workerWaitingResponse,
        'workerJobAccepeted': workerJobAccepeted, 'workerJobDeclined': workerJobDeclined, 'pastJobs': pastJobs};
      Stream<Map<String, List<ServicoViewModel>>> map_all_Status_stream = Stream.fromIterable([map_all_Status]);

      return map_all_Status_stream;
    });
  }*/

  Stream<Map<String, List<ServicoViewModel>>> checkThisIsAWorkerServiceElseRemove(Stream<List<ServicoViewModel>> servicos) {
    FirebaseController firebaseController = FirebaseController();
    List<ServicoViewModel> allAvailableJobs = [];
    List<ServicoViewModel> workerWaitingResponse = [];
    List<ServicoViewModel> workerJobAccepeted = [];
    List<ServicoViewModel> workerJobDeclined = [];
    List<ServicoViewModel> pastJobs = [];

    StreamController<Map<String, List<ServicoViewModel>>> controller = StreamController<Map<String, List<ServicoViewModel>>>();

    servicos.listen((List<ServicoViewModel> snapshot) async {
      for (var servico in snapshot) {
        if (servico.icone + servico.idCity + servico.idClient != '' && servico.idsWorkersBid.length < 6) {
          allAvailableJobs.add(servico);
        }
      }

      for(int i = 0; i < allAvailableJobs.length; i++){
        for(int j = 0; j < allAvailableJobs[i].idsWorkersBid.length; j++){
          if(allAvailableJobs[i].idsWorkersBid[j] == firebaseController.getCurrentUser()!.uid){
            workerWaitingResponse.add(allAvailableJobs[i]);
            allAvailableJobs.removeAt(i);
          }
        }
      }

      for(ServicoViewModel waitingResponse in workerWaitingResponse){
        if(waitingResponse.idWorker == firebaseController.getCurrentUser()!.uid){
          workerJobAccepeted.add(waitingResponse);
          workerWaitingResponse.remove(waitingResponse);
        }
        if(waitingResponse.idWorker != firebaseController.getCurrentUser()!.uid && waitingResponse.idWorker != ''){
          workerJobDeclined.add(waitingResponse);
          workerWaitingResponse.remove(waitingResponse);
        }
      }

      for(ServicoViewModel chekIfPastJob in workerJobAccepeted){
        if(chekIfPastJob.concluded == true){
          pastJobs.add(chekIfPastJob);
          workerJobAccepeted.remove(chekIfPastJob);
        }
      }

      Map<String, List<ServicoViewModel>> map_all_Status = {
        'allAvailableJobs': allAvailableJobs,
        'workerWaitingResponse': workerWaitingResponse,
        'workerJobAccepeted': workerJobAccepeted,
        'workerJobDeclined': workerJobDeclined,
        'pastJobs': pastJobs,
      };

      controller.add(map_all_Status);
      controller.close();
    });

    return controller.stream;
  }


  Stream<Map<String, List<ServicoViewModel>>> fetchServicosStream() {
    Stream<List<ServicoViewModel>> Servicos = FirebaseFirestore.instance.collection('servico').snapshots()
        .asyncMap<List<ServicoViewModel>>((QuerySnapshot snapshot) async {
      WorkerViewModel worker = await WorkerProvider().getWorker();
      return processSnapshot(worker, snapshot);
    });

    Stream<Map<String, List<ServicoViewModel>>> servicos_map  = checkThisIsAWorkerServiceElseRemove(Servicos);

    return servicos_map;
  }

  List<ServicoViewModel> processSnapshot(WorkerViewModel worker, QuerySnapshot snapshot) {
    return snapshot.docs.map<ServicoViewModel>((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      List<dynamic> worker_servicos_ids = worker.my_services;
      return createServicoViewModel(data,worker_servicos_ids);
    }).toList();
  }

  void removeInvalidServicos(List<dynamic> worker_servicos_ids, List<ServicoViewModel> servicos) {
    for (var id in worker_servicos_ids) {
      servicos.removeWhere((service) => service.idService != id);
    }
  }

  ServicoViewModel createServicoViewModel(Map<String, dynamic> data, List<dynamic> worker_servicos_ids) {
    ServicoViewModel servicoPadrao = criarServicoPadrao();
    ServicoViewModel newServico =  ServicoViewModel(
      id: data['id'],
      dataPropostaFeita: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0, 5),
      dataPropostaAceita: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0, 5),
      dataPagamento: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0, 5),
      clientGivenDate: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0, 5),
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
      acceptedValue: data['acceptedValue'] ?? '',
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
    for(String id in worker_servicos_ids){
      if(id == newServico.idService){
        return newServico;
      }

    }
    return servicoPadrao;

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
      acceptedValue: data['acceptedValue'] ?? '',
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
