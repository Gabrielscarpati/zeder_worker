import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/application/provider/tipo_servico_provider.dart';
import 'package:zeder/data/disputa/disputa_controller.dart';
import 'package:zeder/data/user/user_controller.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';
import '../../data/firebase/firebase_controller.dart';
import '../../data/user/user_entity.dart';
import '../../design_system/parameters/colors.dart';
import '../../design_system/widgets/ds_pop_up.dart';
import '../../ui/features/SignUp/save_image.dart';
import '../../ui/features/SignUp/views/widgets/snackbars.dart';
import '../../ui/features/navigation_bar/navigation_bar.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';
import '../../ui/widgets/worker_services/worker_services_viewmodel.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class DisputaProvider with ChangeNotifier {

  static final DisputaProvider provider = DisputaProvider._internal();

  factory DisputaProvider() {
    return provider;
  }

  DisputaProvider._internal();

  DisputaController disputaController = DisputaController();
  TextEditingController disputaControllerText = TextEditingController();
  GlobalKey<FormState> disputaFormKey = GlobalKey<FormState>();
  ServicoProvider servicoProvider = ServicoProvider();

  Future confirmarIniciarDisputa(context, ServicoEntity servicoEntity) => showDialog(
    context: context,
    builder: (context) =>  DSPopUp(title: 'Tem certeza que quer iniciar essa disputa?',
        onPressedYes: () async {
          DisputaEntity newCancelEntity = DisputaEntity(
            idServico: servicoEntity.id,
            id: '',
            idWorker: servicoEntity.idWorker,
            dataCreated: DateTime.now(),
            message: disputaControllerText.text.trim(),
            needsAction: true,
            idClient: servicoEntity.idClient,
            idCity: servicoEntity.idCity,
            aditionalData: {},
          );
           String idDisputa = await disputaController.cadastrarDisputa(newCancelEntity);
          await servicoProvider.iniciarDisputa(servicoEntity, idDisputa);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
          );
          ShowSnackBar(context: context).showErrorSnackBar(message: 'A disputa foi iniciada', color: DSColors.primary,);
        }, onPressedNo: (){
          Navigator.pop(context);
        }
    ),
  );


  String? validateCanceling(String? value) {
    if (disputaControllerText.text.trim().isEmpty) {
      return "Por favor, digite o motivo do inicio da disputa";
    } else {
      return null;
    }
  }


}


