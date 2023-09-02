import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/data/disputa/disputa_controller.dart';
import 'package:zeder/domain/domain.dart';

import '../../design_system/parameters/colors.dart';
import '../../design_system/widgets/ds_pop_up.dart';
import '../../ui/features/SignUp/views/widgets/snackbars.dart';
import '../../ui/features/navigation_bar/navigation_bar.dart';
import '../../utils/flutter_get_Location.dart';

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

  GetLocation getLocation = GetLocation();

  Future confirmarIniciarDisputa(context, ServicoEntity servicoEntity,
          RoundedLoadingButtonController btnControllerIniciar) =>
      showDialog(
        context: context,
        builder: (context) => DSPopUp(
            title: getLocation.locationBR
                ? 'Tem certeza que quer iniciar uma disputa?'
                : 'Are you sure you want to start a dispute?',
            onPressedYes: () async {
              if (disputaFormKey.currentState!.validate()) {
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
                String idDisputa =
                    await disputaController.cadastrarDisputa(newCancelEntity);

                await servicoProvider.iniciarDisputa(servicoEntity, idDisputa);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationBarScreen()),
                );
                ShowSnackBar(context: context).showErrorSnackBar(
                  message: getLocation.locationBR
                      ? 'A disputa foi iniciada.'
                      : 'The dispute has started.',
                  color: DSColors.primary,
                );
                btnControllerIniciar.reset();
              } else {
                Navigator.pop(context);
              }
            },
            onPressedNo: () {
              Navigator.pop(context);
              btnControllerIniciar.reset();
            }),
      );

  String? validateCanceling(String? value) {
    if (disputaControllerText.text.trim().isEmpty) {
      return getLocation.locationBR
          ? "Por favor, digite o motivo do inicio da disputa"
          : "Please enter the reason for starting the dispute";
    } else {
      return null;
    }
  }
}
