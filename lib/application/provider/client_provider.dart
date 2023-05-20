import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';
import 'package:zeder/ui/widgets/orcamento/orcamento_viewmodel.dart';

import '../../infra/repo/client_repo.dart';
import '../../infra/repo/proposta_entity.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';


class ClientProvider with ChangeNotifier {

  static final ClientProvider provider = ClientProvider._internal();

  factory ClientProvider() {
    return provider;
  }

  ClientProvider._internal();
  Map<String, dynamic> client = ClientRepo().client;
  ClientsViewModel getClientInfo(){
    ClienteEntity clienteEntity = ClienteEntity.fromJson(client);
    ClientsViewModel clienteViewModel = ClientsViewModel(
      nome: clienteEntity.nome,
      email: clienteEntity.email,
      cpfCnpj: clienteEntity.cpfCnpj,
      tipoPessoa: clienteEntity.tipoPessoa,
      profile_picture: clienteEntity.profile_picture,
    );
    notifyListeners();
    return clienteViewModel;
  }
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


