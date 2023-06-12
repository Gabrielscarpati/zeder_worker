import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/application/provider/worker_provider.dart';
import 'package:zeder/data/firebase/firebase_controller.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';
import '../../data/servico/servico_controller.dart';
import '../../domain/entities/servico_entity.dart';
import '../../ui/features/home/Widgets/pop_up_explain_names_home_screen.dart';
import '../../ui/widgets/servico/servico_viewmodel.dart';

class ServicoProvider with ChangeNotifier {

  static final ServicoProvider provider = ServicoProvider._internal();

  factory ServicoProvider() {
    return provider;
  }

  ServicoProvider._internal();

  FirebaseController firebaseController = FirebaseController();
  List<ServicoViewModel> list_servicos = [];  // plumber pest control
  List<ServicoViewModel> listLeadsNotAcceptedYet = [];
  List<ServicoViewModel> listLeadsAccepted = [];
  ServicoController servicoController = ServicoController();

  void criarServico(){
    final dataPropostaFeita = DateTime.now();
    final dataPropostaAceita = DateTime.now().add(Duration(days: 1));
    final dataPagamento = DateTime.now().add(Duration(days: 2));
    final clientGivenDate = DateTime.now().add(Duration(days: 3));
    final descricao = "Sample description";
    final flgClientSaw = true;
    final flgWorkerSaw = false;
    final icone = "sample_icon.png";
    final idCity = "sample_city_id";
    final idClient = "sample_client_id";
    final idDisputa = "sample_dispute_id";
    final idWorker = "";
    final idAcceptedLead = "sample_lead_id";
    final idsWorkersBid = ['liYZpiChtih9m3ENiARnSqcG8iD3'];
    final serviceDetails = {"detail1": "value1", "detail2": "value2"};
    final service = "plumber";
    final idService = "1";
    final smallerValue = "10";
    final greaterValue = "20";
    final acceptedValue = "15";
    final areThereBids = true;
    final clientAcceptedABid = true;
    final waitingPayment = false;
    final payed = false;
    final doing = true;
    final concluded = false;
    final emDisputa = false;
    final reembolsado = false;
    final disputaFinalizada = false;

    final servicoEntity = ServicoEntity(
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
      id: firebaseController.getRandomGeneratedId(),
    );
    servicoController.cadastrarServico(servicoEntity);
  }

  atualizarServico(ServicoViewModel servicoViewModel) async {
    ServicoEntity updatedService = ServicoEntity(
      descricao: servicoViewModel.descricao,
      flgClientSaw: servicoViewModel.flgClientSaw,
      flgWorkerSaw: servicoViewModel.flgWorkerSaw,
      icone: servicoViewModel.icone,
      idCity:servicoViewModel.idCity,
      idClient: servicoViewModel.idClient,
      idDisputa: servicoViewModel.idDisputa,
      idWorker: firebaseController.getCurrentUser()!.uid,
      idAcceptedLead: servicoViewModel.idAcceptedLead,
      idsWorkersBid: servicoViewModel.idsWorkersBid,
      serviceDetails: servicoViewModel.serviceDetails,
      service: servicoViewModel.service,
      idService: servicoViewModel.idService,
      smallerValue:servicoViewModel.smallerValue,
      greaterValue:servicoViewModel.greaterValue,
      acceptedValue: servicoViewModel.acceptedValue,
      areThereBids:servicoViewModel.areThereBids,
      clientAcceptedABid: servicoViewModel.clientAcceptedABid,
      waitingPayment: servicoViewModel.waitingPayment,
      payed: servicoViewModel.payed,
      doing: servicoViewModel.doing,
      concluded:servicoViewModel.concluded,
      emDisputa: servicoViewModel.emDisputa,
      reembolsado: servicoViewModel.reembolsado,
      disputaFinalizada: servicoViewModel.disputaFinalizada,
      id: servicoViewModel.id,
    );

    await servicoController.atualizarServico(updatedService);
  }

/*    Future<List<ServicoViewModel>> getListServicos() async {
    List<ServicoViewModel> list_all_servicos = [];  // plumber pest control

      WorkerViewModel worker = await WorkerProvider().getWorker();

    List<dynamic> list_servicos_ids = worker.my_services;

    for(int i = 0; i < list_servicos_ids.length; i++){
        List<ServicoEntity> servicoEntities = await ServicoController().buscarServicoComCondicao(cond: list_servicos_ids[i], condName: "id");
        for(int j = 0; j < servicoEntities.length; j++){
          ServicoViewModel servicoViewModel = ServicoViewModel(
            icone: servicoEntities[i].icone,
            dataPropostaAceita: servicoEntities[i].dataPropostaAceita.toString().substring(0,5),
            idDisputa: servicoEntities[i].idDisputa,
            id: servicoEntities[i].id,
            dataPropostaFeita: servicoEntities[i].dataPropostaFeita.toString().substring(0,5),
            dataPagamento: servicoEntities[i].dataPagamento.toString().substring(0,5),
            descricao: servicoEntities[i].descricao,
            flgClientSaw: servicoEntities[i].flgClientSaw,
            flgWorkerSaw: servicoEntities[i].flgWorkerSaw,
            idCity: servicoEntities[i].idCity,
            idClient: servicoEntities[i].idClient,
            idWorker: servicoEntities[i].idWorker,
            idAcceptedLead: servicoEntities[i].idAcceptedLead,
            idsWorkersBid: servicoEntities[i].idsWorkersBid,
            serviceDetails: servicoEntities[i].serviceDetails,
            service: servicoEntities[i].service,
            idService: servicoEntities[i].idService,
            smallerValue: servicoEntities[i].smallerValue,
            greaterValue: servicoEntities[i].greaterValue,
            acceptedValue: servicoEntities[i].acceptedValue,
            areThereBids: servicoEntities[i].areThereBids,
            clientAcceptedABid: servicoEntities[i].clientAcceptedABid,
            waitingPayment: servicoEntities[i].waitingPayment,
            payed: servicoEntities[i].payed,
            doing: servicoEntities[i].doing,
            concluded: servicoEntities[i].concluded,
            emDisputa: servicoEntities[i].emDisputa,
            reembolsado: servicoEntities[i].reembolsado,
            disputaFinalizada: servicoEntities[i].disputaFinalizada,
            clientGivenDate: servicoEntities[i].clientGivenDate.toString().substring(0,5),
          );
          list_all_servicos.add(servicoViewModel);
        }
      }
    list_servicos = list_all_servicos;

      return list_all_servicos;
  }*/

/*  Stream<List<ServicoViewModel>> getListServicoss() {
    Stream<List<ServicoViewModel>> servicosStream = ServicoController().fetchServicosStream();

    Stream<List<ServicoViewModel>> filteredStream = servicosStream.map((servicos) {
      return servicos
          .where((servico) => servico.descricao =="Sampe description" )
          .toList();
    });

    return filteredStream;
  }*/

/*  Future<List<ServicoViewModel>> getlistLeadsNotAcceptedYet() async {
      List <ServicoViewModel> notAcceptedYet = [];
      List<ServicoViewModel> list_all_servicos = await getListServicos();
      for(int i = 0; i < list_all_servicos.length; i++){
        for(int j = 0; j < list_all_servicos[i].idsWorkersBid.length; j++){
          if(list_all_servicos[i].idsWorkersBid[j] == firebaseController.getCurrentUser()!.uid){
            notAcceptedYet.add(list_all_servicos[i]);
            }
          }
        }
      listLeadsNotAcceptedYet = notAcceptedYet;
      //notifyListeners();
      return notAcceptedYet;
    }*/

/*    Future<List<ServicoViewModel>> getlistLeadsAccepted() async {
      listLeadsAccepted.clear();
      List<ServicoViewModel> listLeadsAccepetedOrNot = await getlistLeadsNotAcceptedYet();
      for(int i = 0; i < listLeadsAccepetedOrNot.length; i++){
        if(listLeadsAccepetedOrNot[i].idWorker == firebaseController.getCurrentUser()!.uid){
          listLeadsAccepted.add(listLeadsAccepetedOrNot[i]);
        }
      }
      return listLeadsAccepted;
    }*/

  Future showExplanationAllServices(context) => showDialog(
    context: context,
    builder: (context) =>  PopUpExplainNameHomeScreen(title: "These are all the services",),
  );

  Future showExplanationOpenServices(context) => showDialog(
    context: context,
    builder: (context) =>  PopUpExplainNameHomeScreen(title: "These are the services you\n are working on right now",),
  );
}




