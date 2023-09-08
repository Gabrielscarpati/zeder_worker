import 'package:flutter/material.dart';
import 'package:zeder/design_system/widgets/ds_pop_up.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/domain/entities/log_entity.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

import '../../data/log/log_controller.dart';
import '../../design_system/parameters/colors.dart';
import '../../ui/features/SignUp/views/widgets/snackbars.dart';
import '../../ui/features/show_job_details/additional_screens/adicionais_do_servico/adicionais_do_servico_screen.dart';

class AdicionaisServicoProvider with ChangeNotifier {
  static final AdicionaisServicoProvider provider =
      AdicionaisServicoProvider._internal();

  factory AdicionaisServicoProvider() {
    return provider;
  }

  AdicionaisServicoProvider._internal();

  GlobalKey<FormState> formKeyAuthentication = GlobalKey<FormState>();

  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  GetLocation getLocation = GetLocation();

  String? validateDescription(String? value) {
    if (description.text.isEmpty) {
      return getLocation.locationBR
          ? "Adicione uma descrição!"
          : "Add a decription!";
    } else {
      return null;
    }
  }

  String? validatePrice(String? value) {
    if (price.text.isEmpty) {
      return getLocation.locationBR ? "Adicione um preço!" : "Add a price!";
    } else {
      return null;
    }
  }

  LogController logController = LogController();

  Future<LogEntity> createLogEntity(
      {required ServicoEntity servicoViewModel}) async {
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
        description.text.trim(): price.text.trim(),
      },
      idClient: servicoViewModel.idClient,
    );
    await logController.cadastrarLog(newLoogEntity);
    return newLoogEntity;
  }

  Future<List<LogEntity>> getLogEntity({
    required String idServico,
  }) async {
    List<LogEntity> listLogs = await logController.buscarLogComCondicao(
      idServico,
      'idServico',
    );
    return listLogs;
  }

  void checkConditionsCreateLog(
      {required BuildContext context,
      required ServicoEntity servicoViewModel}) async {
    if (!formKeyAuthentication.currentState!.validate()) {
      ShowSnackBar(context: context).showErrorSnackBar(
        message: getLocation.locationBR
            ? "Preencha todos os campos!"
            : "Fill in all fields!",
      );
      Navigator.pop(context);
    } else {
      await createLogEntity(servicoViewModel: servicoViewModel);
      ShowSnackBar(context: context).showErrorSnackBar(
        message: getLocation.locationBR
            ? 'Adicional adicionado com sucesso'
            : "Added Successfully!",
        color: DSColors.secondary,
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AdicionaisDoServicoScreen(
                servicoViewModel: servicoViewModel,
              )));
    }
  }

  Future showExplanationAllServices(context, servicoViewModel) => showDialog(
        context: context,
        builder: (context) => DSPopUp(
          title: getLocation.locationBR
              ? "Você tem certeza que deseja adicionar esse adicional?"
              : "Are you sure you want to add this extra?",
          onPressedNo: () {
            Navigator.pop(context);
          },
          onPressedYes: () {
            checkConditionsCreateLog(
                servicoViewModel: servicoViewModel, context: context);
          },
        ),
      );
} /*agreement?*/
