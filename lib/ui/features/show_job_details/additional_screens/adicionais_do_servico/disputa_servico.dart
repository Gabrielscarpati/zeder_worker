import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/LoadingButton.dart';
import 'package:zeder/ui/features/LogIn/views/widgets/widgetsForSignUp.dart';

import '../../../../../application/provider/disputa_provider.dart';
import '../../../../../domain/entities/servico_entity.dart';
import '../../../../../utils/flutter_get_Location.dart';
import '../../../SignUp/views/widgets/snackbars.dart';

class DisputaServico extends StatefulWidget {
  final ServicoEntity servicoViewModel;
  const DisputaServico({
    Key? key,
    required this.servicoViewModel,
  }) : super(key: key);

  @override
  State<DisputaServico> createState() => _DisputaServicoState();
}

class _DisputaServicoState extends State<DisputaServico> {
  RoundedLoadingButtonController btnControllerIniciar =
      RoundedLoadingButtonController();
  RoundedLoadingButtonController btnControllerVoltar =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    DisputaProvider provider = context.read<DisputaProvider>();
    GetLocation getLocation = GetLocation();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getLocation.locationBR ? 'Disputa do serviço' : 'service dispute',
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
                    ? "Clique no botão abaixo\npara iniciar disputa"
                    : "Click the button below\nto start dispute",
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: provider.disputaFormKey,
                child: StandardController(
                  title: getLocation.locationBR
                      ? 'Qual o motivo da disputa?'
                      : 'What is the reason for the dispute?',
                  hint: getLocation.locationBR
                      ? 'Digite o motivo da disputa'
                      : 'Enter the reason for the dispute',
                  nameController: provider.disputaControllerText,
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
                    ? 'Iniciar disputa do serviço'
                    : 'Start service dispute',
                goNextScreen: () async {
                  await provider.confirmarIniciarDisputa(
                    context,
                    widget.servicoViewModel,
                    btnControllerIniciar,
                  );
                  btnControllerIniciar.reset();
                },
                controller: btnControllerIniciar,
              ),
              const SizedBox(
                height: 20,
              ),
              DSTextTitleBoldSecondary(
                text: getLocation.locationBR
                    ? "Voltaremos em contato para\nresolver a disputa"
                    : "We will contact you to\nresolve the dispute",
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
                    ? 'A disputa não foi iniciada'
                    : 'The dispute was not started',
                color: DSColors.primary,
              );
              Navigator.pop(context);
            },
            controller: btnControllerVoltar,
          ),
        ),
      ),
    );
  }
}
