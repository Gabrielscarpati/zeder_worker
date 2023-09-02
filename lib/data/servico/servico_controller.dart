import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../application/provider/worker_provider.dart';
import '../../domain/entities/servico_entity.dart';
import '../../infra/fetch_data_stream.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';
import '../../utils/flutter_get_Location.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class ServicoController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.servicoCollection;
  GetLocation getLocation = GetLocation();

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

  Future<void> atualizarServicoMakeCurrent({
    required String id,
    required String idWorker,
  }) async {
    Map<String, Object> data = {};
    data['dataPropostaAceita'] = Timestamp.now();
    data['idWorker'] = idWorker;

    try {
      await _firebase.atualizarDadosEspecificos(
        collection: _collection,
        id: id,
        data: data,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarServicoSetDone({
    required String id,
  }) async {
    Map<String, Object> data = {};
    data['concluded'] = true;
    try {
      await _firebase.atualizarDadosEspecificos(
        collection: _collection,
        id: id,
        data: data,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarCancelarServico({
    required String id,
  }) async {
    Map<String, Object> data = {};
    data['idWorker'] = '';
    try {
      await _firebase.atualizarDadosEspecificos(
        collection: _collection,
        id: id,
        data: data,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarServicoIniciarDisputa({
    required String id,
    required String idDisputa,
  }) async {
    Map<String, Object> data = {};
    data['idDisputa'] = idDisputa;
    data['emDisputa'] = true;
    try {
      await _firebase.atualizarDadosEspecificos(
        collection: _collection,
        id: id,
        data: data,
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

  Future<List<ServicoEntity>> buscarServicoComCondicao(
      {required String cond, required String condName}) async {
    List<ServicoEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(
          collection: _collection, cond: cond, condName: condName);
      //final response = await _db.collection('servico').where('idTipoServico', isEqualTo: '1').get();
      dado.forEach((element) {
        retorno.add(ServicoEntity.fromJson(element));
      });

      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  WorkerProvider workerProvider = WorkerProvider();

  Stream<List<ServicoEntity>> fetchWorkerServicesStreamWithParameter() {
    List<String> my_cities = [];
    for (CitiesViewModel city in workerProvider.my_cities) {
      my_cities.add(city.id);
    }
    return FetchDataStreamDocuments<ServicoEntity>()
        .fetchStreamWithParametersPassingListParameters(
      parameter: 'idCity',
      value: my_cities,
      collection: _collection,
      createEntity: ({required Map<String, dynamic> data}) {
        ServicoEntity newAccount = ServicoEntity.fromJson(data);
        return newAccount;
      },
    );
  }

  Stream<List<ServicoEntity>> fetchNewServicesStreamWithParameter() {
    return FetchDataStreamDocuments<ServicoEntity>()
        .fetchStreamWithSingleParameter(
      parameter: 'idWorker',
      value: '',
      collection: _collection,
      createEntity: ({required Map<String, dynamic> data}) {
        ServicoEntity newAccount = ServicoEntity.fromJson(data);
        return newAccount;
      },
    );
  }
}

/*  Stream<Map<String, List<ServicoEntity>>> checkThisIsAWorkerServiceElseRemove(Stream<List<ServicoEntity>> servicos) {
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
          if (city.name.toString().trim() == serviceSnapshot.idCity.toString().trim()) {
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

        if (addServiceCity == false && addServiceServiceId == true) {

          if (serviceSnapshot.idWorker == '') {
            allAvailableJobs.add(serviceSnapshot);
          }

          if (serviceSnapshot.idWorker == firebaseController.getCurrentUser()!.uid && serviceSnapshot.concluded == false) {
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
  }*/
