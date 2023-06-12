import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/data/user/user_controller.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';
import '../../data/firebase/firebase_controller.dart';
import '../../data/user/user_entity.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';
import '../../ui/widgets/worker_services/worker_services_viewmodel.dart';

class WorkerProvider with ChangeNotifier {

  static final WorkerProvider provider = WorkerProvider._internal();

  factory WorkerProvider() {
    return provider;
  }

  WorkerProvider._internal();

  List get_servicos({required List servicos}) {
    return servicos;
  }
  FirebaseController firebaseController = FirebaseController();

  List<CitiesViewModel> my_cities = [];
  List<WorkerServicesViewModel> my_services = [];
  List<dynamic> servicosIDS = [];

  Future<WorkerViewModel> getWorker() async {
    WorkerEntity workerEntity = await WorkerController().buscarWorker(firebaseController.getCurrentUser()!.uid);
    WorkerViewModel workerViewModel = WorkerViewModel(
      nome: workerEntity.nome,
      email: workerEntity.email,
      cpfCnpj: workerEntity.cpfCnpj,
      tipoPessoa: workerEntity.tipoPessoa,
      profile_picture: workerEntity.profile_picture,
      phone: workerEntity.phone,
      servicos_id: workerEntity.servicos,
      my_cities: workerEntity.my_cities,
      my_services: workerEntity.servicos,
    );
    get_servicos(servicos: workerEntity.servicos);
    my_cities.clear();
    for(int i = 0; i < workerViewModel.my_services.length; i++){
      my_services.add(WorkerServicesViewModel(icone: 'city', servico: getServicesByID(id:workerViewModel.my_services[i])));
    }
    for(int i = 0; i < workerViewModel.my_cities.length; i++){
      my_cities.add(CitiesViewModel(icon: 'city', city_name: workerViewModel.my_cities[i]));
    }
    servicosIDS = workerViewModel.servicos_id;
    return workerViewModel;
  }

  String getServicesByID({required String id}){
    if(id == '1'){
      return 'Plumber';
    }else if(id == '2'){
      return 'Pest Control';
    }else if(id == '3'){
      return 'Roofing';
    }else if(id == '4'){
      return 'Salon';
    }else if(id == '5'){
      return 'Computer Repair';
    }else if(id == '6'){
      return 'Ac Repair';
    }
    return "";
  }



}


