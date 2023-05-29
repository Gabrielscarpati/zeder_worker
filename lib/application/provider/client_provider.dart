import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/data/user/user_controller.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';
import '../../data/firebase/firebase_controller.dart';
import '../../data/user/user_entity.dart';

class ClientProvider with ChangeNotifier {

  static final ClientProvider provider = ClientProvider._internal();

  factory ClientProvider() {
    return provider;
  }

  ClientProvider._internal();

  List get_servicos({required List servicos}) {
    return servicos;
  }
  FirebaseController firebaseController = FirebaseController();

  Future<ClientsViewModel> getClient() async {
    UserEntity clienteEntity = await UserController().buscarUsuario(firebaseController.getCurrentUser()!.uid);

    ClientsViewModel clienteViewModel = ClientsViewModel(
      nome: clienteEntity.nome,
      email: clienteEntity.email,
      cpfCnpj: clienteEntity.cpfCnpj,
      tipoPessoa: clienteEntity.tipoPessoa,
      profile_picture: clienteEntity.profile_picture,
      phone: clienteEntity.phone,
      servicos_id: clienteEntity.servicos,
    );
    get_servicos(servicos: clienteEntity.servicos);
    notifyListeners();
    return clienteViewModel;
  }



}


