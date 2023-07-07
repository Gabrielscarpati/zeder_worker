import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/LoadingButton.dart';
import 'package:zeder/ui/features/LogIn/views/widgets/widgetsForSignUp.dart';
import '../../../../../application/provider/adicionais_servico.dart';
import '../../../../../domain/entities/servico_entity.dart';
import '../../../SignUp/views/widgets/snackbars.dart';

class CancelarServicoServico extends StatefulWidget {
  final ServicoEntity servicoViewModel;
  const CancelarServicoServico({Key? key, required this.servicoViewModel, }) : super(key: key);

  @override
  State<CancelarServicoServico> createState() => _CancelarServicoServicoState();
}

class _CancelarServicoServicoState extends State<CancelarServicoServico> {
  RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    ServicoProvider provider = context.read<ServicoProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cancelar serviço', style: TextStyle(fontSize: 18),), backgroundColor: DSColors.tertiary,),
      body: SizedBox(
        child:Padding(
          padding: const EdgeInsets.only( left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DSTextTitleBoldSecondary(text: "Clique no botão abaixo\npara cancelar o serviço ",),
              const SizedBox(height: 20,),
              Form(
                key: provider.cancelingFormKey,
                child: StandardController(
                  title: 'Porque cancelou?',
                  hint: 'Digite o motivo do cancelamento',
                  nameController: provider.cancelingController,
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
                buttonText: 'Cancelar serviço',
                goNextScreen: () async {
                  await provider.confirmarCancelServico(context, widget.servicoViewModel);
                  btnController.reset();
                },
                controller: btnController,
              ),
              const SizedBox(height: 20,),
              const DSTextTitleBoldSecondary(text: "Esse serviço voltará para a\nlista de novos serviços",),
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
                    ShowSnackBar(context: context,).showErrorSnackBar(message: 'O serviço não foi cancelado',);
                    Navigator.pop(context);
                  },
                  controller: btnController,
                ),
          ),
      ),
    );
  }
}

