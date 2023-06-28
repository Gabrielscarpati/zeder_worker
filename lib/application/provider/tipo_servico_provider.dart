import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/application/provider/pesquisa_cidade_provider.dart';
import 'package:zeder/domain/domain.dart';
import '../../data/tipos_servico/tipos_servico_controller.dart';

class TipoServicoProvider with ChangeNotifier {

  static final TipoServicoProvider provider = TipoServicoProvider._internal();

  factory TipoServicoProvider() {
    return provider;
  }
  TipoServicoProvider._internal();


  List<TipoServicoEntity> list_all_cservices =[];
  List<String> listIDs = ['1','2','3','4','5','6'];
  PesquisaCidadeProvider pesquisaCidadeProvider = PesquisaCidadeProvider();

  Future<List<TipoServicoEntity>> loadListTipoServicos() async{
    List<TipoServicoEntity> list_all_cservices_here =[];
    list_all_cservices_here =  await TiposServicoController().buscarTodosTiposServico();
    list_all_cservices = list_all_cservices_here;
    return list_all_cservices_here;
  }

  List <TipoServicoEntity> getListServices(){
    return list_all_cservices;
  }


  List<TipoServicoEntity> list_servicos_screen = [];
  List<TipoServicoEntity> selected_servicos = [];

  void addSelectedService(TipoServicoEntity service){
    if(selected_servicos.contains(service)){
      return;
    }
    selected_servicos.add(service);
    notifyListeners();
  }

  void removeSelectedService(TipoServicoEntity service){
    selected_servicos.remove(service);
    notifyListeners();
  }

  String user_chosen_service ='';

  bool listInitialized = false;
  List<TipoServicoEntity> getListaDeServicosViewModel(){
    List<TipoServicoEntity> servicesViewModel = [];
    for(int i = 0; i < list_all_cservices.length; i++ ) {
      servicesViewModel.add(TipoServicoEntity(icon: list_all_cservices[i].icon, name: list_all_cservices[i].name, initialPrice:  list_all_cservices[i].initialPrice, numero_de_servicos:  list_all_cservices[i].numero_de_servicos, id: list_all_cservices[i].id, basicFlow: [], country: list_all_cservices[i].country,));
    }
    if(!listInitialized){
      list_servicos_screen= servicesViewModel;
    }
    listInitialized = true;
    return servicesViewModel;
  }

  void applicarFiltroNalista(String filter_name){
    List<TipoServicoEntity> list_all_services = getListaDeServicosViewModel();
    List<TipoServicoEntity> novalista_cidades = [];
    for(int i = 0; i < list_all_services.length; i++ ) {
      if(list_all_services[i].name.toLowerCase().contains(filter_name.toLowerCase())){
        novalista_cidades.add(list_all_services[i]);
      }
    }
    list_servicos_screen = novalista_cidades;
    notifyListeners();
  }
  void setUserChosenCity(String servicoName){
    user_chosen_service = servicoName;
    notifyListeners();
  }
  String get_user_chonsen_city(){
    return user_chosen_service;
  }



}

