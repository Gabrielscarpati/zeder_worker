import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/ui/widgets/servico/servico_viewmodel.dart';

import '../../data/firebase/firebase_controller.dart';
import '../../data/propostas/proposta_controller.dart';
import '../../domain/entities/proposta_entity.dart';
import '../../ui/widgets/proposta/proposta_viewmodel.dart';

class LeadProvider with ChangeNotifier {

  static final LeadProvider provider = LeadProvider._internal();

  factory LeadProvider() {
    return provider;
  }

  LeadProvider._internal();

  //buscarServicoComCondicao(cond: list_servicos_ids[i], condName: "idTipoServico");
  FirebaseController firebaseController = FirebaseController();

  Future<List<PropostaViewModel>> getListPropostas() async {
    List<PropostaViewModel> list_propostas = [];
    List<PropostaEntity> listaPropostas = await PropostasController()
        .buscarPropostaComCondicao(
        cond: firebaseController.getCurrentUser()!.uid,
        condName: "idPrestador");
    for (int i = 0; i < listaPropostas.length; i++) {
      PropostaViewModel servicoViewModel = PropostaViewModel(
        idPrestador: listaPropostas[i].idPrestador,
        idServico: listaPropostas[i].idServico,
        dataInicio: listaPropostas[i].dataInicio,
        valor: listaPropostas[i].valor,
        consideracoes: listaPropostas[i].consideracoes,
        flgAvisoCliente: listaPropostas[i].flgAvisoCliente,
        flgAvisoPrestador: listaPropostas[i].flgAvisoPrestador,
        idCliente: listaPropostas[i].idCliente,
        dataPropostaEnviada: listaPropostas[i].dataPropostaEnviada,
        nomeServico: listaPropostas[i].nomeServico,
      );
      list_propostas.add(servicoViewModel);
    }

    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
    return list_propostas;
  }

  Future<PropostaViewModel?> getPropostaByService(String id) async {

    List<PropostaViewModel> all_worker_propostas = await getListPropostas();
    print(all_worker_propostas.length);
    for (int i = 0; i < all_worker_propostas.length; i++) {
      if (all_worker_propostas[i].idServico == id) {
        return all_worker_propostas[i];
      }
    }
    return null;
}

  GlobalKey<FormState> formKeyAuthenticationLead = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  TextEditingController priceController = TextEditingController();
  TextEditingController startingDate = TextEditingController();


  Future<void> addleadFirebase({required ServicoViewModel servico}) async {
    PropostaEntity  new_lead = PropostaEntity(
        id: 'minhaproposta',
        idPrestador: firebaseController.getCurrentUser()!.uid,
        idServico: 'lG72vV9GqWyIVWlMl1jR',
        dataInicio: DateTime.now(),
        valor: double.parse(priceController.text.trim()),
        consideracoes: '',
        flgAvisoCliente: true,
        flgAvisoPrestador: true,
        idCliente: servico.idClient,
        dataPropostaEnviada: DateTime.now(),
        nomeServico: servico.service,
    );
    await PropostasController().cadastrarProposta(new_lead);

    notifyListeners();
  }





}


