import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/data/avaliacoes/avaliacao_controller.dart';
import 'package:zeder/data/cancel/cancel_controller.dart';
import 'package:zeder/data/firebase/firebase_controller.dart';
import 'package:zeder/design_system/widgets/ds_pop_up.dart';
import 'package:zeder/services/notification_service.dart';
import 'package:zeder/ui/features/SignUp/views/widgets/snackbars.dart';
import '../../data/servico/servico_controller.dart';
import '../../design_system/parameters/colors.dart';
import '../../domain/entities/avaliacao_prestador_entity.dart';
import '../../domain/entities/cancel_entity.dart';
import '../../domain/entities/servico_entity.dart';
import '../../services/firebase_messaging_service.dart';
import '../../ui/features/home/Widgets/pop_up_explain_names_home_screen.dart';
import '../../ui/features/navigation_bar/navigation_bar.dart';
import '../../ui/features/show_list_services_standard/show_past_services_screen.dart';
import 'package:provider/provider.dart';

class ServicoProvider with ChangeNotifier {

  static final ServicoProvider provider = ServicoProvider._internal();

  factory ServicoProvider() {
    return provider;
  }

  ServicoProvider._internal();

  FirebaseController firebaseController = FirebaseController();
  List<ServicoEntity> list_servicos = [];  // plumber pest control
  List<ServicoEntity> listLeadsNotAcceptedYet = [];
  List<ServicoEntity> listLeadsAccepted = [];
  ServicoController servicoController = ServicoController();


  setServiceAsCurrent(ServicoEntity newService, BuildContext context) async {
    await servicoController.atualizarServicoMakeCurrent(id: newService.id, idWorker: firebaseController.getCurrentUser()!.uid);
    ShowSnackBar(context: context,).showErrorSnackBar(message: 'O serviço é seu agora', color: DSColors.primary,);
  }



  setServiceAsDone(ServicoEntity newService, BuildContext context) async {
    await servicoController.atualizarServicoSetDone(id: newService.id,);
    ShowSnackBar(context: context,).showErrorSnackBar(message: 'O serviço foi finalizado', color: DSColors.primary,);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ShowPastServicesScreen()),
    );

  }

  cancelarServico(ServicoEntity newService) async{
      await servicoController.atualizarCancelarServico(id: newService.id);
  }

  iniciarDisputa(ServicoEntity newService, String newIdDisputa) async{
    await servicoController.atualizarServicoIniciarDisputa(id: newService.id, idDisputa: newIdDisputa,);
  }


  Future showExplanationAllServices(context) => showDialog(
    context: context,
    builder: (context) =>  PopUpExplainNameHomeScreen(title: "Esses são os serviços que você pode selecionar para realizar",),
  );

  Future showExplanationOpenServices(context) => showDialog(
    context: context,
    builder: (context) =>  PopUpExplainNameHomeScreen(title: "Esses são os serviços que você\nestá trabalhando agora",),
  );
  Future confirmarPegarServico(context, ServicoEntity servicoEntity) => showDialog(
    context: context,
    builder: (context) =>  DSPopUp(title: 'Tem certeza que quer pegar esse serviço?',
        onPressedYes: () async {
          await setServiceAsCurrent(servicoEntity, context);
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
            );
        }, onPressedNo: (){
          Navigator.pop(context);
      }
    ),
  );
  
  Future confirmarFinalizarServico(BuildContext context, ServicoEntity servicoEntity) => showDialog(
    context: context,
    builder: (context) =>  DSPopUp(title: 'Tem certeza que quer finalizar esse serviço?',
        onPressedYes: () async {
          await setServiceAsDone(servicoEntity, context);
          ShowSnackBar(context: context,).showErrorSnackBar(
            message: 'O serviço foi finalizado', color: DSColors.primary,);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ShowPastServicesScreen()),
          );
        }, onPressedNo: (){
          Navigator.pop(context);
        }
    ),
  );

  CancelController cancelController = CancelController();

  Future confirmarCancelServico(context, ServicoEntity servicoEntity, RoundedLoadingButtonController loadingButton) {
    //FirebaseMessagingService provider = Provider.of<FirebaseMessagingService>(context, listen: false);
    return showDialog(
    context: context,
    builder: (context) =>  DSPopUp(title: 'Tem certeza que quer cancelar esse serviço?',
        onPressedYes: () async {
          if(cancelingFormKey.currentState!.validate()) {
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
            await Provider.of<FirebaseMessagingService>(context, listen: false).sendPushMessage('Serviço disponível', 'tem um novo serviço esperando por você');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
            );
            ShowSnackBar(context: context,).showErrorSnackBar(
              message: 'O serviço foi cancelado', color: DSColors.primary,);
              
              
          }
          else{
            Navigator.pop(context);
          }
          loadingButton.reset();
        }, onPressedNo: (){
          loadingButton.start();
          Navigator.pop(context);
      }
    ),
  );
  } 

  TextEditingController cancelingController = TextEditingController();
  GlobalKey<FormState> cancelingFormKey = GlobalKey<FormState>();

  String? validateCanceling(String? value) {
    if (cancelingController.text.trim().isEmpty) {
      return "Por favor, digite o motivo do cancelamento";
    } else {
      return null;
    }
  }

  Future<AvaliacaoPrestadorEntity> getAvaliaCaoByServicoId(String idServico) async{
    AvaliacaoController avaliacaoEntity = AvaliacaoController();
    List<AvaliacaoPrestadorEntity> listRatings = await avaliacaoEntity.buscarAvaliacaoComCondicao(idServico, 'idServico');
    return listRatings[0];
  }

}




