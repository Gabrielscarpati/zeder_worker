import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/application/provider/tipo_servico_provider.dart';
import 'package:zeder/domain/domain.dart';
import '../../data/listCitiesBrazil/ListCitiesBrazilController.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';

class PesquisaCidadeProvider with ChangeNotifier {

  static final PesquisaCidadeProvider provider = PesquisaCidadeProvider._internal();

  factory PesquisaCidadeProvider() {
    return provider;
  }
  PesquisaCidadeProvider._internal();

  ListCitiesBrazilController cityControllter = ListCitiesBrazilController();
  List<CityEntity> list_all_cities =[];

  bool isServicesLoaded = false;
  Future<String> loadCities() async{
    TipoServicoProvider tipoServicoProvider = TipoServicoProvider();
    tipoServicoProvider.loadListTipoServicos();
    isServicesLoaded = true;
    List<CityEntity> citiesFromDataBase = await cityControllter.buscarCidadeComCondicao(cond:'Brazil', condName: 'country');
    list_all_cities.clear();
    list_all_cities = citiesFromDataBase;
    return 'String';
  }

  List<CitiesViewModel> list_cities_screen = [];
  List<CitiesViewModel> selected_cities = [];

  void addSelectedCity(CitiesViewModel city){
    if(selected_cities.contains(city)){
      return;
    }
    selected_cities.add(city);
    notifyListeners();
  }

  void removeSelectedCity(CitiesViewModel city){
    selected_cities.remove(city);
    notifyListeners();
  }

  String user_chosen_city ='';

  bool listInitialized = false;
  List<CitiesViewModel> getListaDeCidadesViewModel(){
    List<CitiesViewModel> cidadesViewModel = [];
    for(int i = 0; i < list_all_cities.length; i++ ) {

      cidadesViewModel.add(CitiesViewModel(icon: 'city',city_name: list_all_cities[i].name));
    }
    if(!listInitialized){
      list_cities_screen= cidadesViewModel;
    }
    listInitialized = true;
    return cidadesViewModel;
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


