import 'package:cloud_firestore/cloud_firestore.dart';

class ServicoViewModel {
  final String id;
  final Timestamp dataPropostaFeitaDateTime;
  final Timestamp dataPropostaAceitaDateTime;
  final Timestamp dataPagamentoDateTime;
  final Timestamp clientGivenDateDateTime;
  final String dataPropostaFeitaString;
  final String dataPropostaAceitaString;
  final String dataPagamentoString;
  final String clientGivenDateString;
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


  ServicoViewModel({
    required this.id,
    required this.dataPropostaFeitaDateTime,
    required this.dataPropostaAceitaDateTime,
    required this.clientGivenDateDateTime,
    required this.dataPagamentoDateTime,
    required this.dataPropostaFeitaString,
    required this.dataPropostaAceitaString,
    required this.clientGivenDateString,
    required this.dataPagamentoString,
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
  });
}