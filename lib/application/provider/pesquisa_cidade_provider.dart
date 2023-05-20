import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/domain/domain.dart';
import '../../infra/repo/cidade_repo.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';


class PesquisaCidadeProvider with ChangeNotifier {

  static final PesquisaCidadeProvider provider = PesquisaCidadeProvider._internal();

  factory PesquisaCidadeProvider() {
    return provider;
  }
  PesquisaCidadeProvider._internal();

  List<Map<String, dynamic>> list_all_cities = CidadeRepo().cidade_repo_list;
  List<CitiesViewModel> list_cities_screen = [];

  String user_chosen_city ='';

  List<CitiesViewModel> getListaDeCidadesViewModel(){
    List<CitiesViewModel> tiposServicoViewModel = [];
    for(int i = 0; i < list_all_cities.length; i++ ) {
      CidadeEntity tipoServicoEntity = CidadeEntity.fromJson(list_all_cities[i]);
      tiposServicoViewModel.add(CitiesViewModel(icon: 'city',city_name: "${tipoServicoEntity.nome}, ${tipoServicoEntity.uf}"));
    }
    list_cities_screen= tiposServicoViewModel;
    notifyListeners();
    return tiposServicoViewModel;
  }

  void applicarFiltroNalista(String filter_name){
    List<CitiesViewModel> list_all_cities = getListaDeCidadesViewModel();
    List<CitiesViewModel> novalista_cidades = [];
    for(int i = 0; i < list_all_cities.length; i++ ) {
      if(list_all_cities[i].city_name.toLowerCase().contains(filter_name.toLowerCase())){
        novalista_cidades.add(list_all_cities[i]);
      }
    }
    list_cities_screen = novalista_cidades;
    notifyListeners();
  }
  void set_user_chonsen_city(String city_name){
    user_chosen_city = city_name;
    notifyListeners();
  }
  String get_user_chonsen_city(){
    return user_chosen_city;
  }



}


