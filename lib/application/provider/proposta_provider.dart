import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/propostas/proposta_controller.dart';
import '../../domain/entities/proposta_entity.dart';
import '../../ui/widgets/proposta/proposta_viewmodel.dart';

class PropostaProvider with ChangeNotifier {

  static final PropostaProvider provider = PropostaProvider._internal();

  factory PropostaProvider() {
    return provider;
  }
  PropostaProvider._internal();

  Future<List<PropostaViewModel>> getListPropostas(List<dynamic> list_propostas_id) async {
    List<PropostaViewModel> list_propostas = [];
    print(list_propostas_id.length.toString()+" propostas");
    for(int i = 0; i < list_propostas_id.length; i++){
      PropostaEntity propostaEntity = await PropostasController().buscarProposta(list_propostas_id[i]);
      print(propostaEntity.idPrestador);
      PropostaViewModel servicoViewModel = PropostaViewModel(
          idPrestador: propostaEntity.idPrestador,
          idServico: propostaEntity.idServico,
          dataInicio: propostaEntity.dataInicio,
          valor: propostaEntity.valor,
          consideracoes: propostaEntity.consideracoes,
          flgAvisoCliente: propostaEntity.flgAvisoCliente,
          flgAvisoPrestador: propostaEntity.flgAvisoPrestador ,
      );
      list_propostas.add(servicoViewModel);
    }

    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
    return list_propostas;
  }



}


