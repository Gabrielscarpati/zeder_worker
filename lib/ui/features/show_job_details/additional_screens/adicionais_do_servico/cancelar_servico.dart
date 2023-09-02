import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/LoadingButton.dart';
import 'package:zeder/ui/features/LogIn/views/widgets/widgetsForSignUp.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

import '../../../../../domain/entities/servico_entity.dart';
import '../../../SignUp/views/widgets/snackbars.dart';

class CancelarServicoServico extends StatefulWidget {
  final ServicoEntity servicoViewModel;
  const CancelarServicoServico({
    Key? key,
    required this.servicoViewModel,
  }) : super(key: key);

  @override
  State<CancelarServicoServico> createState() => _CancelarServicoServicoState();
}

class _CancelarServicoServicoState extends State<CancelarServicoServico> {
  RoundedLoadingButtonController btnControllerCancelar =
      RoundedLoadingButtonController();
  RoundedLoadingButtonController btnControllerVoltar =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    ServicoProvider provider = context.read<ServicoProvider>();
    GetLocation getLocation = GetLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getLocation.locationBR ? 'Cancelar serviço' : 'Cancel Service',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: DSColors.tertiary,
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DSTextTitleBoldSecondary(
                text: getLocation.locationBR
                    ? "Clique no botão abaixo\npara cancelar o serviço "
                    : "Click the button below\nto cancel the service",
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: provider.cancelingFormKey,
                child: StandardController(
                  title: getLocation.locationBR
                      ? 'Porque cancelou?'
                      : 'Why did you cancel?',
                  hint: getLocation.locationBR
                      ? 'Digite o motivo do cancelamento'
                      : 'Enter the reason for the cancellation',
                  nameController: provider.cancelingController,
                  validator: provider.validateCanceling,
                  prefixIcon: Icons.person,
                  sufixIcon: Icons.close,
                  deleteOrHide: 'delete',
                  multilineText: true,
                  maxLines: 12,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LoadingButton(
                buttonText: getLocation.locationBR
                    ? 'Cancelar serviço'
                    : 'Cancel Service',
                goNextScreen: () async {
                  await provider.confirmarCancelServico(
                      context, widget.servicoViewModel, btnControllerCancelar);
                  btnControllerCancelar.stop();
                },
                controller: btnControllerCancelar,
              ),
              const SizedBox(
                height: 20,
              ),
              DSTextTitleBoldSecondary(
                text: getLocation.locationBR
                    ? "Esse serviço voltará para a lista \n de novos serviços e outra pessoa\npoderá pegá-lo"
                    : "This service will return to the list \nof new services and another person \nwill be able to get it",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: DSColors.cardColor,
        child: Center(
          child: LoadingButton(
            buttonText: getLocation.locationBR ? 'Voltar' : 'Back',
            goNextScreen: () async {
              ShowSnackBar(
                context: context,
              ).showErrorSnackBar(
                  message: getLocation.locationBR
                      ? 'O serviço não foi cancelado'
                      : 'The service was not canceled');
              Navigator.pop(context);
            },
            controller: btnControllerVoltar,
          ),
        ),
      ),
    );
  }
}
