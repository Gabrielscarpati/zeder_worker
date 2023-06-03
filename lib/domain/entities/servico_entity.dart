import '../../core/core.dart';

class ServicoEntity extends Entity {
   final DateTime dataPropostaFeita;
   final DateTime dataPropostaAceita ;
   final DateTime dataPagamento ;
   final DateTime clientGivenDate;
   final String descricao;
   final bool flgClientSaw;
   final bool flgWorkerSaw;
   final String icone;
   final String idCity;
   final String idClient;
   final String idDisputa;
   final String idWorker;
   final String idAcceptedLead;
   final List idsWorkersBid;
   final Map serviceDetails;
   final String service;
   final String idService;
   final String smallerValue;
   final String greaterValue;
   final String acceptedValue;
   final bool areThereBids;
   final bool clientAcceptedABid;
   final bool waitingPayment;
   final bool payed;
   final bool doing;
   final bool concluded;
   final bool emDisputa;
   final bool reembolsado;
   final bool disputaFinalizada;

  ServicoEntity({
    required this.dataPropostaFeita,
    required this.dataPropostaAceita,
    required this.dataPagamento,
    required this.clientGivenDate,
    required this.descricao,
    required this.flgClientSaw,
    required this.flgWorkerSaw,
    required this.icone,
    required this.idCity,
    required this.idClient,
    required this.idDisputa,
    required this.idWorker,
    required this.idAcceptedLead,
    required this.idsWorkersBid,
    required this.serviceDetails,
    required this.service,
    required this.idService,
    required this.smallerValue,
    required this.greaterValue,
    required this.acceptedValue,
    required this.areThereBids,
    required this.clientAcceptedABid,
    required this.waitingPayment,
    required this.payed,
    required this.doing,
    required this.concluded,
    required this.emDisputa,
    required this.reembolsado,
    required this.disputaFinalizada,
    required super.id,
  });



  factory ServicoEntity.fromJson(Map<String, dynamic> json) {
    return ServicoEntity(
      id: json['id'] ?? '',
      dataPropostaFeita: DateUtil.toDateTimeDefaultDateZero(json['dataPropostaFeita']),
      dataPropostaAceita: DateUtil.toDateTimeDefaultDateZero(json['dataPropostaAceita']),
      dataPagamento: DateUtil.toDateTimeDefaultDateZero(json['dataPagamento']),
      clientGivenDate: DateUtil.toDateTimeDefaultDateZero(json['clientGivenDate']),
      descricao: json['descricao'] ?? '',
      flgClientSaw: BoolUtil.toBoolDefaultFalse(json['flgClientSaw']),
      flgWorkerSaw: BoolUtil.toBoolDefaultFalse(json['flgWorkerSaw']),
      icone: json['icone'] ?? '',
      idCity: json['idCity'] ?? '',
      idClient: json['idClient'] ?? '',
      idDisputa: json['idDisputa'] ?? '',
      idWorker: json['idWorker'] ?? '',
      idAcceptedLead: json['idAcceptedLead'] ?? '',
      idsWorkersBid: json['idsWorkersBid'] ?? [],
      serviceDetails: json['serviceDetails'] ?? {},
      service: json['service'] ?? '',
      idService: json['idService'] ?? '',
      smallerValue: json['smallerValue'] ?? '',
      greaterValue: json['greaterValue'] ?? '',
      acceptedValue: json['acceptedValue'] ?? '',
      areThereBids: BoolUtil.toBoolDefaultFalse(json['areThereBids']),
      clientAcceptedABid: BoolUtil.toBoolDefaultFalse(json['clientAcceptedABid']),
      waitingPayment: BoolUtil.toBoolDefaultFalse(json['waitingPayment']),
      payed: BoolUtil.toBoolDefaultFalse(json['payed']),
      doing: BoolUtil.toBoolDefaultFalse(json['doing']),
      concluded: BoolUtil.toBoolDefaultFalse(json['concluded']),
      emDisputa: BoolUtil.toBoolDefaultFalse(json['emDisputa']),
      reembolsado: BoolUtil.toBoolDefaultFalse(json['reembolsado']),
      disputaFinalizada: BoolUtil.toBoolDefaultFalse(json['disputaFinalizada']),
    );
  }

  factory ServicoEntity.test() {
    return ServicoEntity.fromJson({
      'id': '1',
      'dataPropostaFeita': DateTime(2022, 12, 1),
      'dataPropostaAceita': '2',
      'dataPagamento': '3',
      'descricao': '4',
      'flgClientSaw': 'adfadsf adsf asdf asdf asdf asdf asdf asdf asdf asdfasdfa sdf asfasdfasdf fa sdfa sdf asdf asdf asdf asdf asdf asdf asdf asdf  sadfa sdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdfasdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdfasdf asdf',
      'flgWorkerSaw': 100.0,
      'icone': 600.0,
      'idCity': DateTime(2023, 12, 1),
      'idClient': DateTime(2024, 12, 1),
      'idDisputa': true,
      'idWorker': 'teste',
      'idAcceptedLead': ['1', '2', '3'],
      'idsWorkersBid': '5',
      'serviceDetails': '6',
      'service': DateTime(2025, 12, 1),
      'idService': true,
      'smallerValue': false,
      'greaterValue': '8',
      'areThereBids': '9',
      'clientAcceptedABid': '10',
      'waitingPayment': ['11', '12', '13'],
      'payed': {'1': '1', '2': '2', '3': '3'},
      'doing': '10',
      'concluded': '10',
      'emDisputa': '10',
      'reembolsado': '10',
      'disputaFinalizada': '10',
    });
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dataPropostaFeita': dataPropostaFeita.toJsonString(),
      'dataPropostaAceita': dataPropostaAceita.toJsonString(),
      'dataPagamento': dataPagamento.toJsonString(),
      'descricao': descricao,
      'flgClientSaw': flgClientSaw,
      'flgWorkerSaw': flgWorkerSaw,
      'icone': icone,
      'idCity': idCity,
      'idClient': idClient,
      'idDisputa': idDisputa,
      'idWorker': idWorker,
      'idAcceptedLead': idAcceptedLead,
      'idsWorkersBid': idsWorkersBid,
      'serviceDetails': serviceDetails,
      'service': service,
      'idService': idService,
      'smallerValue': smallerValue,
      'greaterValue': greaterValue,
      'areThereBids': areThereBids,
      'clientAcceptedABid': clientAcceptedABid,
      'waitingPayment': waitingPayment,
      'payed': payed,
      'doing': doing,
      'concluded': concluded,
      'emDisputa': emDisputa,
      'reembolsado': reembolsado,
      'disputaFinalizada': disputaFinalizada,

    };
  }

  ServicoEntity copyWith({
    String? id,
    DateTime? dataPropostaFeita,
    DateTime? dataPropostaAceita,
    DateTime? dataPagamento,
    DateTime? clientGivenDate,
    String? descricao,
    bool? flgClientSaw,
    bool? flgWorkerSaw,
    String? icone,
    String? idCity,
    String? idClient,
    String? idDisputa,
    String? idWorker,
    String? idAcceptedLead,
    List? idsWorkersBid,
    Map? serviceDetails,
    String? service,
    String? idService,
    String? smallerValue,
    String? greaterValue,
    String? acceptedValue,
    bool? areThereBids,
    bool? clientAcceptedABid,
    bool? waitingPayment,
    bool? payed,
    bool? doing,
    bool? concluded,
    bool? emDisputa,
    bool? reembolsado,
    bool? disputaFinalizada,
  }) {
    return ServicoEntity(
      id: id ?? this.id,
       dataPropostaFeita: dataPropostaFeita ?? this.dataPropostaFeita,
      dataPropostaAceita: dataPropostaAceita ?? this.dataPropostaAceita,
      dataPagamento: dataPagamento ?? this.dataPagamento,
      clientGivenDate: clientGivenDate ?? this.clientGivenDate,
      descricao: descricao ?? this.descricao,
      flgClientSaw: flgClientSaw ?? this.flgClientSaw,
      flgWorkerSaw: flgWorkerSaw ?? this.flgWorkerSaw,
      icone: icone ?? this.icone,
      idCity: idCity ?? this.idCity,
      idClient: idClient ?? this.idClient,
      idDisputa: idDisputa ?? this.idDisputa,
      idWorker: idWorker ?? this.idWorker,
      idAcceptedLead: idAcceptedLead ?? this.idAcceptedLead,
      idsWorkersBid: idsWorkersBid ?? this.idsWorkersBid,
      serviceDetails: serviceDetails ?? this.serviceDetails,
      service: service ?? this.service,
      idService: idService ?? this.idService,
      smallerValue: smallerValue ?? this.smallerValue,
      greaterValue: greaterValue ?? this.greaterValue,
      acceptedValue: acceptedValue ?? this.acceptedValue,
      areThereBids: areThereBids ?? this.areThereBids,
      clientAcceptedABid: clientAcceptedABid ?? this.clientAcceptedABid,
      waitingPayment: waitingPayment ?? this.waitingPayment,
      payed: payed ?? this.payed,
      doing: doing ?? this.doing,
      concluded: concluded ?? this.concluded,
      emDisputa: emDisputa ?? this.emDisputa,
      reembolsado: reembolsado ?? this.reembolsado,
      disputaFinalizada: disputaFinalizada ?? this.disputaFinalizada,

    );
  }

  @override
  ServicoEntity fromJson(Map<String, dynamic> json) {
    return ServicoEntity(
      id: json['id'] ?? '',
      dataPropostaFeita: DateUtil.toDateTimeDefaultDateZero(json['dataPropostaFeita']),
      dataPropostaAceita: DateUtil.toDateTimeDefaultDateZero(json['dataPropostaAceita']),
      dataPagamento: DateUtil.toDateTimeDefaultDateZero(json['dataPagamento']),
      clientGivenDate: DateUtil.toDateTimeDefaultDateZero(json['clientGivenDate']),
      descricao: json['descricao'] ?? '',
      flgClientSaw: BoolUtil.toBoolDefaultFalse(json['flgClientSaw']),
      flgWorkerSaw: BoolUtil.toBoolDefaultFalse(json['flgWorkerSaw']),
      icone: json['icone'] ?? '',
      idCity: json['idCity'] ?? '',
      idClient: json['idClient'] ?? '',
      idDisputa: json['idDisputa'] ?? '',
      idWorker: json['idWorker'] ?? '',
      idAcceptedLead: json['idAcceptedLead'] ?? '',
      idsWorkersBid: json['idsWorkersBid'] ?? [],
      serviceDetails: json['serviceDetails'] ?? {},
      service: json['service'] ?? '',
      idService: json['idService'] ?? '',
      smallerValue: json['smallerValue'] ?? '',
      greaterValue: json['greaterValue'] ?? '',
      acceptedValue: json['acceptedValue'] ?? '',
      areThereBids: BoolUtil.toBoolDefaultFalse(json['areThereBids']),
      clientAcceptedABid: BoolUtil.toBoolDefaultFalse(json['clientAcceptedABid']),
      waitingPayment: BoolUtil.toBoolDefaultFalse(json['waitingPayment']),
      payed: BoolUtil.toBoolDefaultFalse(json['payed']),
      doing: BoolUtil.toBoolDefaultFalse(json['doing']),
      concluded: BoolUtil.toBoolDefaultFalse(json['concluded']),
      emDisputa: BoolUtil.toBoolDefaultFalse(json['emDisputa']),
      reembolsado: BoolUtil.toBoolDefaultFalse(json['reembolsado']),
      disputaFinalizada: BoolUtil.toBoolDefaultFalse(json['disputaFinalizada']),
    );
  }


}

abstract class ServicoRepository extends Repository<ServicoEntity> {}

class ServicoAdapter extends Adapter<ServicoEntity> {
  @override
  ServicoEntity fromJson(Map<String, dynamic> json) {
    return ServicoEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ServicoEntity entity) {
    return entity.toJson();
  }
}


/*install
  flutter_modular: ^5.0.3
   main:  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
    inside of app folder app moduler and app widget

* */