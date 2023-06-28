import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/LoadingButton.dart';
import 'package:zeder/ui/features/LogIn/views/widgets/widgetsForSignUp.dart';
import '../../../../../application/provider/adicionais_servico.dart';
import '../../../../../domain/entities/servico_entity.dart';

class AddAdicionaisDoServico extends StatefulWidget {
  final ServicoEntity servicoViewModel;
  const AddAdicionaisDoServico({Key? key, required this.servicoViewModel, }) : super(key: key);

  @override
  State<AddAdicionaisDoServico> createState() => _AddAdicionaisDoServicoState();
}

class _AddAdicionaisDoServicoState extends State<AddAdicionaisDoServico> {
  RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    AdicionaisServicoProvider provider = context.read<AdicionaisServicoProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar adicional ao serviço', style: TextStyle(fontSize: 18),), backgroundColor: DSColors.tertiary,),
      body: SizedBox(
        child:Form(
          key: provider.formKeyAuthentication,
          child: Padding(
            padding: const EdgeInsets.only( left: 16.0, right: 16.0),
            child: Column(
              children: [
                StandardController(
                  title: 'Valor Adicional (EX: R\$ 10,00 = 10)',
                  hint: 'Digite apenas números',
                  nameController: provider.price,
                  validator: provider.validatePrice,
                  prefixIcon: MdiIcons.currencyBrl,
                  sufixIcon:  Icons.close,
                  deleteOrHide: 'delete',
                  iSkeyboardTypeNumber: true,
                ),
                StandardController(
                  title: 'Descrição',
                  hint: 'Faça uma descrição do que foi adicionado ao serviço',
                  nameController: provider.description,
                  validator: provider.validateDescription,
                  prefixIcon: Icons.person,
                  sufixIcon:  Icons.close,
                  deleteOrHide: 'delete',
                  multilineText: true,
                  maxLines: 12,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          color: DSColors.cardColor,
          child: Center(
            child:
                LoadingButton(
                  buttonText: 'Salvar',
                  goNextScreen: () async {

                    await provider.showExplanationAllServices(context, widget.servicoViewModel);
                    btnController.reset();
                  },
                  controller: btnController,
                ),
          ),
      ),
    );
  }
}

