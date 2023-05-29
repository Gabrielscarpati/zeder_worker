import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/data/user/user_controller.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';
import '../../data/servico/servico_controller.dart';
import '../../data/user/user_entity.dart';
import '../../domain/entities/servico_entity.dart';
import '../../ui/widgets/servico/servico_viewmodel.dart';
import '../../ui/widgets/servico_viewmodel.dart';
import 'client_provider.dart';

class ServicoProvider with ChangeNotifier {

  static final ServicoProvider provider = ServicoProvider._internal();

  factory ServicoProvider() {
    return provider;
  }

  ServicoProvider._internal();

  Future<List<ServicoViewModel>> getListServicos() async {
    ClientsViewModel client = await ClientProvider().getClient();
    List<dynamic> list_servicos_ids = client.servicos_id;
    List<ServicoViewModel> list_servicos = [];

    for(int i = 0; i < list_servicos_ids.length; i++){

      ServicoEntity servicoEntity = await ServicoController().buscarServico(list_servicos_ids[i]);
      ServicoViewModel servicoViewModel = ServicoViewModel(
        icone: servicoEntity.icone,
        servico: servicoEntity.servico,
        status: servicoEntity.status,
        valor: '${servicoEntity.valorFinal}',
        data: servicoEntity.dataInicial.toString().substring(0,6),
        emDestaque: servicoEntity.flgAvisoPrestador,
        list_propostas: servicoEntity.idsPropostasRecebidas,
      );
      list_servicos.add(servicoViewModel);
    }

    notifyListeners();
    return list_servicos;
  }

}


