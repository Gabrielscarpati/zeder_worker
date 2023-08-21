import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/LoadingButton.dart';
import 'package:zeder/ui/features/LogIn/views/widgets/widgetsForSignUp.dart';
import '../../../../../application/provider/disputa_provider.dart';
import '../../../../../domain/entities/servico_entity.dart';
import '../../../SignUp/views/widgets/snackbars.dart';

class DisputaServico extends StatefulWidget {
  final ServicoEntity servicoViewModel;
  const DisputaServico({Key? key, required this.servicoViewModel,}) : super(key: key);

  @override
  State<DisputaServico> createState() => _DisputaServicoState();
}

class _DisputaServicoState extends State<DisputaServico> {
  RoundedLoadingButtonController btnControllerIniciar = RoundedLoadingButtonController();
  RoundedLoadingButtonController btnControllerVoltar = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    DisputaProvider provider = context.read<DisputaProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Disputa do serviço', style: TextStyle(fontSize: 18),), backgroundColor: DSColors.tertiary,),
      body: SizedBox(
        child:Padding(
          padding: const EdgeInsets.only( left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DSTextTitleBoldSecondary(text: "Clique no botão abaixo\npara iniciar disputa",),
              const SizedBox(height: 20,),
              Form(
                key: provider.disputaFormKey,
                child: StandardController(
                  title: 'Qual o motivo da disputa?',
                  hint: 'Digite o motivo da disputa',
                  nameController: provider.disputaControllerText,
                  validator: provider.validateCanceling,
                  prefixIcon: Icons.person,
                  sufixIcon:  Icons.close,
                  deleteOrHide: 'delete',
                  multilineText: true,
                  maxLines: 12,
                ),
              ),
              const SizedBox(height: 20,),
              LoadingButton(
                buttonText: 'Iniciar disputa do serviço',
                goNextScreen: () async {

                  await provider.confirmarIniciarDisputa(context, widget.servicoViewModel, btnControllerIniciar, );
                  btnControllerIniciar.reset();
                },
                controller: btnControllerIniciar,
              ),
              const SizedBox(height: 20,),
              const DSTextTitleBoldSecondary(text: "Voltaremos em contato para\nresolver a disputa",),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          color: DSColors.cardColor,
          child: Center(
            child:
                LoadingButton(
                  buttonText: 'Voltar',
                  goNextScreen: () async {
                    ShowSnackBar(context: context,).showErrorSnackBar(message: 'A disputa não foi iniciada',);
                    Navigator.pop(context);
                  },
                  controller: btnControllerVoltar,
                ),
          ),
      ),
    );
  }
}

