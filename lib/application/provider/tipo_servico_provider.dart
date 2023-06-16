import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/domain/domain.dart';
import '../../infra/repo/tipo_servico_repo.dart';
import '../../ui/widgets/servico_do_app/servico_do_app_viewmodel.dart';


class TipoServicoProvider with ChangeNotifier {

  static final TipoServicoProvider provider = TipoServicoProvider._internal();

  factory TipoServicoProvider() {
    return provider;
  }
  TipoServicoProvider._internal();


  List<Map<String, dynamic>> list_all_services = TipoServiceRepo().tipo_servico_repo;
  List<ServicoDoAppViewModel> list_servicos_screen = [];
  List<ServicoDoAppViewModel> selected_servicos = [];

  void addSelectedService(ServicoDoAppViewModel newServico){
    for(ServicoDoAppViewModel cadaServico in selected_servicos){
     if(cadaServico.servico == newServico.servico ){
       return;
     }
    }
    selected_servicos.add(newServico);
    notifyListeners();
  }

  void removeSelectedService(ServicoDoAppViewModel servico){
    selected_servicos.remove(servico);
    notifyListeners();
  }

  String user_chosen_servico ='';

  List<ServicoDoAppViewModel> getListaDeServicosViewModel(){
    List<ServicoDoAppViewModel> tiposServicoViewModel = [];
    for(int i = 0; i < list_all_services.length; i++ ) {
      TipoServicoEntity tipoServicoEntity = TipoServicoEntity.fromJson(list_all_services[i]);
      tiposServicoViewModel.add(ServicoDoAppViewModel(icone: tipoServicoEntity.icone, servico: tipoServicoEntity.nome, valor: '', nota: '0', qtdeAvaliacoes: tipoServicoEntity.numero_de_servicos));
    }
    list_servicos_screen= tiposServicoViewModel;
    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
    return tiposServicoViewModel;
  }

  void applicarFiltroNalistaServico(String filter_name){
    List<ServicoDoAppViewModel> list_all_services = getListaDeServicosViewModel();
    List<ServicoDoAppViewModel> novalista_servicos = [];
    for(int i = 0; i < list_all_services.length; i++ ) {
      if(list_all_services[i].servico.toLowerCase().contains(filter_name.toLowerCase())){
        novalista_servicos.add(list_all_services[i]);
      }
    }
    list_servicos_screen = novalista_servicos;
    Future.delayed(Duration.zero, () {
      notifyListeners();
    });  }
  void set_user_chonsen_servico(String city_name){
    user_chosen_servico = city_name;
    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }
  String get_user_chonsen_servico(){
    return user_chosen_servico;
  }
}


