import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/application/provider/worker_provider.dart';
import 'package:zeder/data/firebase/firebase_controller.dart';
import 'package:zeder/data/user/user_controller.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';
import '../../data/servico/servico_controller.dart';
import '../../data/user/user_entity.dart';
import '../../domain/entities/servico_entity.dart';
import '../../ui/widgets/servico/servico_viewmodel.dart';
import '../../ui/widgets/servico_viewmodel.dart';

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


    Future<List<ServicoViewModel>> getListServicos() async {
      List<ServicoViewModel> list_all_servicos = [];  // plumber pest control

      WorkerViewModel worker = await WorkerProvider().getWorker();

    List<dynamic> list_servicos_ids = worker.my_services;

    for(int i = 0; i < list_servicos_ids.length; i++){
        List<ServicoEntity> servicoEntities = await ServicoController().buscarServicoComCondicao(cond: list_servicos_ids[i], condName: "idTipoServico");
        for(int j = 0; j < servicoEntities.length; j++){
          ServicoViewModel servicoViewModel = ServicoViewModel(
            icone: servicoEntities[i].icone,
            servico: servicoEntities[i].servico,
            status: servicoEntities[i].status,
            valor: '${servicoEntities[i].valorFinal}',
            data: servicoEntities[i].dataInicial.toString().substring(0,6),
            emDestaque: servicoEntities[i].flgAvisoPrestador,
            list_propostas: servicoEntities[i].idsPropostasRecebidas,
            idsPrestadoresBid: servicoEntities[i].idsPrestadoresBid,
            service_details: servicoEntities[i].service_details,
            dataCadastro: servicoEntities[i].dataCadastro,
            idTipoServico: servicoEntities[i].idTipoServico,
            idCliente: servicoEntities[i].idCliente,
            idCidade: servicoEntities[i].idCidade,
            descricao: servicoEntities[i].descricao,
            valorInicial: servicoEntities[i].valorInicial,
            valorFinal: servicoEntities[i].valorFinal,
            dataInicial: servicoEntities[i].dataInicial,
            dataFinal: servicoEntities[i].dataFinal,
            flgDatasFlexiveis: servicoEntities[i].flgDatasFlexiveis,
            flgAvisoPrestador: servicoEntities[i].flgAvisoPrestador,
            flgAvisoCliente: servicoEntities[i].flgAvisoCliente,
            idsPropostasRecebidas: servicoEntities[i].idsPropostasRecebidas,
            idPropostaAceita: servicoEntities[i].idPropostaAceita,
            idPrestador: servicoEntities[i].idPrestador,
            dataPropostaAceita: servicoEntities[i].dataPropostaAceita,
            idDisputa: servicoEntities[i].idDisputa,
            id: servicoEntities[i].id,
          );
          list_all_servicos.add(servicoViewModel);
        }
      }

    list_servicos = list_all_servicos;
    return list_all_servicos;
  }

  Future<List<ServicoViewModel>> getlistLeadsNotAcceptedYet() async {
      List <ServicoViewModel> notAcceptedYet = [];
      List<ServicoViewModel> list_all_servicos = await getListServicos();
      for(int i = 0; i < list_all_servicos.length; i++){
        for(int j = 0; j < list_all_servicos[i].idsPrestadoresBid.length; j++){
          if(list_all_servicos[i].idsPrestadoresBid[j] == firebaseController.getCurrentUser()!.uid){
            notAcceptedYet.add(list_all_servicos[i]);
            }
          }
        }
      listLeadsNotAcceptedYet = notAcceptedYet;
      //notifyListeners();
      return notAcceptedYet;
    }

    Future<List<ServicoViewModel>> getlistLeadsAccepted() async {
      listLeadsAccepted.clear();
      List<ServicoViewModel> listLeadsAccepetedOrNot = await getlistLeadsNotAcceptedYet();
      for(int i = 0; i < listLeadsAccepetedOrNot.length; i++){
        if(listLeadsAccepetedOrNot[i].idPrestador == firebaseController.getCurrentUser()!.uid){
          listLeadsAccepted.add(listLeadsAccepetedOrNot[i]);
        }
      }
      return listLeadsAccepted;
    }

}


