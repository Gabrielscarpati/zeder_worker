import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/data/avaliacoes/avaliacao_controller.dart';
import 'package:zeder/data/cancel/cancel_controller.dart';
import 'package:zeder/data/firebase/firebase_controller.dart';
import 'package:zeder/design_system/widgets/ds_pop_up.dart';
import 'package:zeder/ui/features/SignUp/views/widgets/snackbars.dart';

import '../../data/servico/servico_controller.dart';
import '../../design_system/parameters/colors.dart';
import '../../domain/entities/avaliacao_prestador_entity.dart';
import '../../domain/entities/cancel_entity.dart';
import '../../domain/entities/servico_entity.dart';
import '../../ui/features/home/Widgets/pop_up_explain_names_home_screen.dart';
import '../../ui/features/navigation_bar/navigation_bar.dart';
import '../../ui/features/show_list_services_standard/show_past_services_screen.dart';
import '../../utils/flutter_get_Location.dart';
import '../../utils/ultils.dart';

class ServicoProvider with ChangeNotifier {
  static final ServicoProvider provider = ServicoProvider._internal();

  factory ServicoProvider() {
    return provider;
  }

  ServicoProvider._internal();

  FirebaseController firebaseController = FirebaseController();
  List<ServicoEntity> list_servicos = []; // plumber pest control
  List<ServicoEntity> listLeadsNotAcceptedYet = [];
  List<ServicoEntity> listLeadsAccepted = [];
  ServicoController servicoController = ServicoController();
  GetLocation getLocation = GetLocation();

  setServiceAsCurrent(ServicoEntity newService, BuildContext context) async {
    await servicoController.atualizarServicoMakeCurrent(
        id: newService.id, idWorker: firebaseController.getCurrentUser()!.uid);
    ShowSnackBar(
      context: context,
    ).showErrorSnackBar(
      message: getLocation.locationBR
          ? 'O serviço é seu agora'
          : 'Congrats! The service is yours now',
      color: DSColors.primary,
    );
  }

  setServiceAsDone(ServicoEntity newService, BuildContext context) async {
    await servicoController.atualizarServicoSetDone(
      id: newService.id,
    );
    ShowSnackBar(
      context: context,
    ).showErrorSnackBar(
      message: getLocation.locationBR
          ? 'O serviço foi finalizado'
          : 'The service was finished',
      color: DSColors.primary,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ShowPastServicesScreen()),
    );
  }

  cancelarServico(ServicoEntity newService) async {
    await servicoController.atualizarCancelarServico(id: newService.id);
  }

  iniciarDisputa(ServicoEntity newService, String newIdDisputa) async {
    await servicoController.atualizarServicoIniciarDisputa(
      id: newService.id,
      idDisputa: newIdDisputa,
    );
  }

  Future showExplanationAllServices(context) => showDialog(
        context: context,
        builder: (context) => PopUpExplainNameHomeScreen(
          title: getLocation.locationBR
              ? "Esses são os serviços que você pode selecionar para realizar"
              : "These are the services you can select to perform",
        ),
      );

  Future showExplanationOpenServices(context) => showDialog(
        context: context,
        builder: (context) => PopUpExplainNameHomeScreen(
          title: getLocation.locationBR
              ? "Esses são os serviços que você\nestá trabalhando agora"
              : "These are the services you\nare working on now",
        ),
      );
  Future confirmarPegarServico(context, ServicoEntity servicoEntity) =>
      showDialog(
        context: context,
        builder: (context) => DSPopUp(
            title: getLocation.locationBR
                ? 'Tem certeza que quer pegar esse serviço?'
                : 'Are you sure you want to take this service?',
            onPressedYes: () async {
              await setServiceAsCurrent(servicoEntity, context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigationBarScreen()),
              );
            },
            onPressedNo: () {
              Navigator.pop(context);
            }),
      );

  Future confirmarFinalizarServico(
          BuildContext context, ServicoEntity servicoEntity) =>
      showDialog(
        context: context,
        builder: (context) => DSPopUp(
            title: getLocation.locationBR
                ? 'Tem certeza que quer finalizar esse serviço?'
                : 'Are you sure you want to finish this service?',
            onPressedYes: () async {
              await setServiceAsDone(servicoEntity, context);
              ShowSnackBar(
                context: context,
              ).showErrorSnackBar(
                message: getLocation.locationBR
                    ? 'O serviço foi finalizado'
                    : 'The service was finished',
                color: DSColors.primary,
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShowPastServicesScreen()),
              );
            },
            onPressedNo: () {
              Navigator.pop(context);
            }),
      );

  CancelController cancelController = CancelController();

  Future confirmarCancelServico(context, ServicoEntity servicoEntity,
      RoundedLoadingButtonController loadingButton) {
    if (isTimeDifferenceLessThan2Hours(
            DateTime.now(), servicoEntity.clientGivenDate) ==
        true) {
      return showDialog(
        context: context,
        builder: (context) => DSPopUp(
            title: getLocation.locationBR
                ? 'O serviço ocorrerá em menos de 2 horas, se você cancelar, será retirada uma taxa de cancelamento do seu próximo serviço!'
                : 'The service will take place in less than 2 hours, if you cancel, a cancellation fee will be deducted from your next service!',
            onPressedYes: () async {
              if (cancelingFormKey.currentState!.validate()) {
                CancelEntity newCancelEntity = CancelEntity(
                  idServico: servicoEntity.id,
                  id: '',
                  idWorker: servicoEntity.idWorker,
                  dataCreated: DateTime.now(),
                  message: cancelingController.text.trim(),
                  needsAction: true,
                  idClient: servicoEntity.idClient,
                  idCity: servicoEntity.idCity,
                  aditionalData: {},
                );
                await cancelarServico(servicoEntity);
                await cancelController.cadastrarCancel(newCancelEntity);
                sendEmailNewServiceAvailable();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationBarScreen()),
                );
                ShowSnackBar(
                  context: context,
                ).showErrorSnackBar(
                  message: getLocation.locationBR
                      ? 'O serviço foi cancelado'
                      : 'The service was canceled',
                  color: DSColors.primary,
                );
              } else {
                Navigator.pop(context);
              }
              loadingButton.reset();
            },
            onPressedNo: () {
              print(servicoEntity.clientGivenDate);
              loadingButton.start();
              Navigator.pop(context);
            }),
      );
    }

    return showDialog(
      context: context,
      builder: (context) => DSPopUp(
          title: getLocation.locationBR
              ? 'Tem certeza que quer cancelar esse serviço?'
              : 'Are you sure you want to cancel this service?',
          onPressedYes: () async {
            if (cancelingFormKey.currentState!.validate()) {
              CancelEntity newCancelEntity = CancelEntity(
                idServico: servicoEntity.id,
                id: '',
                idWorker: servicoEntity.idWorker,
                dataCreated: DateTime.now(),
                message: cancelingController.text.trim(),
                needsAction: true,
                idClient: servicoEntity.idClient,
                idCity: servicoEntity.idCity,
                aditionalData: {},
              );
              await cancelarServico(servicoEntity);
              await cancelController.cadastrarCancel(newCancelEntity);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigationBarScreen()),
              );
              ShowSnackBar(
                context: context,
              ).showErrorSnackBar(
                message: getLocation.locationBR
                    ? 'O serviço foi cancelado'
                    : 'The service was canceled',
                color: DSColors.primary,
              );
            } else {
              Navigator.pop(context);
            }
            loadingButton.reset();
          },
          onPressedNo: () {
            print(servicoEntity.clientGivenDate);
            loadingButton.start();
            Navigator.pop(context);
          }),
    );
  }

  TextEditingController cancelingController = TextEditingController();
  GlobalKey<FormState> cancelingFormKey = GlobalKey<FormState>();

  String? validateCanceling(String? value) {
    if (cancelingController.text.trim().isEmpty) {
      return getLocation.locationBR
          ? "Por favor, digite o motivo do cancelamento"
          : "Please enter the reason for the cancellation";
    } else {
      return null;
    }
  }

  Future<AvaliacaoPrestadorEntity> getAvaliaCaoByServicoId(
      String idServico) async {
    AvaliacaoController avaliacaoEntity = AvaliacaoController();
    List<AvaliacaoPrestadorEntity> listRatings = await avaliacaoEntity
        .buscarAvaliacaoComCondicao(idServico, 'idServico');
    return listRatings[0];
  }

  bool isTimeDifferenceLessThan2Hours(DateTime startTime, DateTime endTime) {
    Duration difference = endTime.difference(startTime);
    if (difference.inHours < 0) {
      return false;
    }
    return difference.inHours < 2;
  }
}
