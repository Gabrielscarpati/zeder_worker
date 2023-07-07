import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:zeder/application/provider/tipo_servico_provider.dart';
import 'package:zeder/data/user/user_controller.dart';
import 'package:zeder/design_system/widgets/ds_pop_up.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/domain/entities/log_entity.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';
import '../../data/firebase/firebase_controller.dart';
import '../../data/log/log_controller.dart';
import '../../data/user/user_entity.dart';
import '../../design_system/parameters/colors.dart';
import '../../ui/features/SignUp/save_image.dart';
import '../../ui/features/SignUp/views/widgets/snackbars.dart';
import '../../ui/features/navigation_bar/navigation_bar.dart';
import '../../ui/features/show_job_details/additional_screens/adicionais_do_servico/adicionais_do_servico_screen.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';
import '../../ui/widgets/worker_services/worker_services_viewmodel.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class AdicionaisServicoProvider with ChangeNotifier {

  static final AdicionaisServicoProvider provider = AdicionaisServicoProvider._internal();

  factory AdicionaisServicoProvider() {
    return provider;
  }

  AdicionaisServicoProvider._internal();

  GlobalKey<FormState> formKeyAuthentication = GlobalKey<FormState>();

  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();


  String? validateDescription(String? value) {
    if (description.text.isEmpty) {
      return "Adicione uma descrição";
    } else {
      return null;
    }
  }

  String? validatePrice(String? value) {
    if (price.text.isEmpty) {
      return "Adicione uma descrição";
    } else {
      return null;
    }
  }
  LogController logController = LogController();

  Future<LogEntity> createLogEntity({required ServicoEntity servicoViewModel}) async {
    LogEntity newLoogEntity = LogEntity(
      id: '',
      idWorker: servicoViewModel.idWorker,
      idServico: servicoViewModel.id,
      dataCreated: DateTime.now(),
      message: description.text.trim(),
      needsAction: true,
      value: price.text.trim(),
      idCity: servicoViewModel.idCity,
      aditionalData: {
         description.text.trim():price.text.trim(),
      },
      idClient: servicoViewModel.idClient,
    );
    await logController.cadastrarLog(newLoogEntity);
    return newLoogEntity;
  }

  Future<List<LogEntity>> getLogEntity({required String idServico,}) async{
    List<LogEntity> listLogs = await logController.buscarLogComCondicao( idServico,'idServico',);
    return listLogs;
  }

  void checkConditionsCreateLog({required BuildContext context,required ServicoEntity servicoViewModel}) async {
    if(!formKeyAuthentication.currentState!.validate()){
      ShowSnackBar(context: context).showErrorSnackBar(message: 'Preencha todos os campos',);
      Navigator.pop(context);
    }
    else{
      await createLogEntity(servicoViewModel: servicoViewModel);
      ShowSnackBar(context: context).showErrorSnackBar(message: 'Adicional adicionado com sucesso', color: DSColors.secondary,);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdicionaisDoServicoScreen(servicoViewModel: servicoViewModel,)));
    }
  }

  Future showExplanationAllServices(context,servicoViewModel) => showDialog(
    context: context,
    builder: (context) => DSPopUp(title: "Você tem certeza que deseja adicionar esse adicional?",
      onPressedNo: (){
        Navigator.pop(context);
      },
      onPressedYes: (){
        checkConditionsCreateLog(servicoViewModel:servicoViewModel, context: context);
      },
    ),
  );



}


