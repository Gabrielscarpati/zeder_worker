import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/ui/widgets/orcamento/orcamento_viewmodel.dart';

import '../../infra/repo/proposta_entity.dart';


class HomeScreenProvider with ChangeNotifier {

  static final HomeScreenProvider provider = HomeScreenProvider._internal();

  factory HomeScreenProvider() {
    return provider;
  }

    HomeScreenProvider._internal();
  /*
  List<Map<String, dynamic>> list_all_propostas = ServicoRepo().prestador_servico_repo;
  //List<OrcamentoViewModel> list_orcamentos_screen = [];
  String user_chosen_city ='';

  List<OrcamentoViewModel> getListaDeOrcamentosViewModel(){
    List<OrcamentoViewModel> orcamentosViewModel = [];
    for(int i = 0; i < list_all_propostas.length; i++ ) {
      PropostaEntity tipoServicoEntity = PropostaEntity.fromJson(list_all_propostas[i]);
      orcamentosViewModel.add(OrcamentoViewModel(icone: tipoServicoEntity., servico: '', status: '', valor: '', data: '', emDestaque: null));
    }
    notifyListeners();
    return orcamentosViewModel;
  }
  */


}


