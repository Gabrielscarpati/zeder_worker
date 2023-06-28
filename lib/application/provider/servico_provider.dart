import 'package:flutter/material.dart';
import 'package:zeder/data/avaliacoes/avaliacao_controller.dart';
import 'package:zeder/data/cancel/cancel_controller.dart';
import 'package:zeder/data/firebase/firebase_controller.dart';
import 'package:zeder/design_system/widgets/ds_pop_up.dart';
import 'package:zeder/domain/entities/log_entity.dart';
import 'package:zeder/ui/features/SignUp/views/widgets/snackbars.dart';
import '../../data/servico/servico_controller.dart';
import '../../design_system/parameters/colors.dart';
import '../../domain/entities/avaliacao_prestador_entity.dart';
import '../../domain/entities/cancel_entity.dart';
import '../../domain/entities/servico_entity.dart';
import '../../ui/features/home/Widgets/pop_up_explain_names_home_screen.dart';
import '../../ui/features/navigation_bar/navigation_bar.dart';

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

  void criarServico(){
    final dataPropostaFeita = DateTime.now();
    final dataPropostaAceita = DateTime.now().add(Duration(days: 1));
    final dataPagamento = DateTime.now().add(Duration(days: 2));
    final clientGivenDate = DateTime.now().add(Duration(days: 3));
    final descricao = "Sample description";
    final flgClientSaw = true;
    final flgWorkerSaw = false;
    final icone = "sample_icon.png";
    final idCity = "Tampa";
    final idClient = "sample_client_id";
    final idDisputa = "sample_dispute_id";
    final idWorker = "";
    final serviceDetails = {"detail1": "value1", "detail2": "value2"};
    final service = "plumber";
    final idService = "1";
    final servicePrice = '100.00';
    final waitingPayment = false;
    final payed = false;
    final doing = true;
    final concluded = false;
    final emDisputa = false;
    final reembolsado = false;
    final disputaFinalizada = false;

    final servicoEntity = ServicoEntity(
      dataPropostaFeita: dataPropostaFeita,
      dataPropostaAceita: dataPropostaAceita,
      dataPagamento: dataPagamento,
      clientGivenDate: clientGivenDate,
      descricao: descricao,
      flgClientSaw: flgClientSaw,
      flgWorkerSaw: flgWorkerSaw,
      icone: icone,
      idCity: idCity,
      idClient: idClient,
      idDisputa: idDisputa,
      idWorker: idWorker,
      serviceDetails: serviceDetails,
      service: service,
      idService: idService,
      servicePrice: servicePrice,
      waitingPayment: waitingPayment,
      payed: payed,
      doing: doing,
      concluded: concluded,
      emDisputa: emDisputa,
      reembolsado: reembolsado,
      disputaFinalizada: disputaFinalizada,
      id: firebaseController.getRandomGeneratedId(),
    );
    servicoController.cadastrarServico(servicoEntity);
  }

  setServiceAsCurrent(ServicoEntity newService) async {
    ServicoEntity updatedService = ServicoEntity(
      dataPropostaFeita: newService.dataPropostaFeita,
      dataPropostaAceita: DateTime.now(),
      dataPagamento: newService.dataPagamento,
      clientGivenDate: newService.clientGivenDate,
      descricao: newService.descricao,
      flgClientSaw: newService.flgClientSaw,
      flgWorkerSaw: newService.flgWorkerSaw,
      icone: newService.icone,
      idCity: newService.idCity,
      idClient: newService.idClient,
      idDisputa: newService.idDisputa,
      idWorker: firebaseController.getCurrentUser()!.uid,
      serviceDetails: newService.serviceDetails,
      service: newService.service,
      idService: newService.idService,
      servicePrice: newService.servicePrice,
      waitingPayment: newService.waitingPayment,
      payed: newService.payed,
      doing: newService.doing,
      concluded: newService.concluded,
      emDisputa: newService.emDisputa,
      reembolsado: newService.reembolsado,
      disputaFinalizada: newService.disputaFinalizada,
      id: newService.id,
    );

    await servicoController.atualizarServico(updatedService);
  }

  setServiceAsDone(ServicoEntity newService) async {
    ServicoEntity updatedService = ServicoEntity(
      dataPropostaFeita: newService.dataPropostaFeita,
      dataPropostaAceita: newService.dataPropostaAceita,
      dataPagamento: newService.dataPagamento,
      clientGivenDate: newService.clientGivenDate,
      descricao: newService.descricao,
      flgClientSaw: newService.flgClientSaw,
      flgWorkerSaw: newService.flgWorkerSaw,
      icone: newService.icone,
      idCity: newService.idCity,
      idClient: newService.idClient,
      idDisputa: newService.idDisputa,
      idWorker: newService.idWorker,
      serviceDetails: newService.serviceDetails,
      service: newService.service,
      idService: newService.idService,
      servicePrice: newService.servicePrice,
      waitingPayment: newService.waitingPayment,
      payed: newService.payed,
      doing: newService.doing,
      concluded: true,
      emDisputa: newService.emDisputa,
      reembolsado: newService.reembolsado,
      disputaFinalizada: newService.disputaFinalizada,
      id: newService.id,
    );

    await servicoController.atualizarServico(updatedService);
  }

   cancelarServico(ServicoEntity newService) async{
      ServicoEntity updatedService = ServicoEntity(
        dataPropostaFeita: newService.dataPropostaFeita,
        dataPropostaAceita: newService.dataPropostaAceita,
        dataPagamento: newService.dataPagamento,
        clientGivenDate: newService.clientGivenDate,
        descricao: newService.descricao,
        flgClientSaw: newService.flgClientSaw,
        flgWorkerSaw: newService.flgWorkerSaw,
        icone: newService.icone,
        idCity: newService.idCity,
        idClient: newService.idClient,
        idDisputa: newService.idDisputa,
        idWorker: '',
        serviceDetails: newService.serviceDetails,
        service: newService.service,
        idService: newService.idService,
        servicePrice: newService.servicePrice,
        waitingPayment: newService.waitingPayment,
        payed: newService.payed,
        doing: newService.doing,
        concluded: newService.concluded,
        emDisputa: newService.emDisputa,
        reembolsado: newService.reembolsado,
        disputaFinalizada: newService.disputaFinalizada,
        id: newService.id,
      );
      await servicoController.atualizarServico(updatedService);
  }

  Future showExplanationAllServices(context) => showDialog(
    context: context,
    builder: (context) =>  PopUpExplainNameHomeScreen(title: "Esses são todos os serviços",),
  );

  Future showExplanationOpenServices(context) => showDialog(
    context: context,
    builder: (context) =>  PopUpExplainNameHomeScreen(title: "Esses são os serviços que você\nestá trabalhando agora",),
  );
  Future confirmarPegarServico(context, ServicoEntity servicoEntity) => showDialog(
    context: context,
    builder: (context) =>  DSPopUp(title: 'Tem certeza que quer pegar esse serviço?',
        onPressedYes: () async {
          await setServiceAsCurrent(servicoEntity);
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
            );
        }, onPressedNo: (){
          Navigator.pop(context);
      }
    ),
  );
  CancelController cancelController = CancelController();

  Future confirmarCancelServico(context, ServicoEntity servicoEntity) => showDialog(
    context: context,
    builder: (context) =>  DSPopUp(title: 'Tem certeza que quer cancelar esse serviço?',
        onPressedYes: () async {
          CancelEntity newCancelEntity = CancelEntity(
            idServico: servicoEntity.id,
            id: '',
            idWorker: servicoEntity.idWorker,
            dataCreated: DateTime.now(),
            message: cancelingController.text.trim(),
            needsAction: true,
            idClient: servicoEntity.idClient,
          );
          await cancelarServico(servicoEntity);
          await cancelController.cadastrarCancel(newCancelEntity);
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
            );
          ShowSnackBar(context: context,).showErrorSnackBar(message: 'O serviço foi cancelado', color: DSColors.primary,);
        }, onPressedNo: (){
          Navigator.pop(context);
      }
    ),
  );

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




