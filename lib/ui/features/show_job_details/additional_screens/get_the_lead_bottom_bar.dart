import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/show_job_details/additional_screens/adicionais_do_servico/adicionais_do_servico_screen.dart';
import '../../../../application/provider/servico_provider.dart';
import '../../../../domain/entities/servico_entity.dart';
import '../../SignUp/views/widgets/snackbars.dart';
import 'adicionais_do_servico/cancelar_servico.dart';
import 'adicionais_do_servico/disputa_servico.dart';
import 'adicionais_do_servico/see_rating_servico.dart';

class GetTheLeadBottomBar extends StatelessWidget {
  final bool allowGetLeads;
  final ServicoEntity servico;
  const GetTheLeadBottomBar({Key? key, required this.servico, required this.allowGetLeads}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServicoProvider servicoProvider = context.watch<ServicoProvider>();

    return SizedBox(
      height: allowGetLeads == true
      ? 70
      : servico.concluded ==false
      ? 262:
      215,
      //height: 328,
      child: Column(
        children: [
          allowGetLeads == true
          ? const SizedBox():
          servico.concluded ==false?
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                CardChangeServiceDetails(
                  iconName: 'check-outline',
                  title: 'Finalizar serviço',
                  onTap: () async {
                    await servicoProvider.confirmarFinalizarServico(context,servico);
                  },
                ),
                CardChangeServiceDetails(
                  iconName: 'close-circle-outline',
                  title: 'Cancelar serviço',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CancelarServicoServico(servicoViewModel: servico,)),
                    );
                  },
                ),
                CardChangeServiceDetails(
                  iconName: 'format-list-bulleted',
                  title: 'Adicionais do serviço',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdicionaisDoServicoScreen(servicoViewModel: servico,)),
                    );
                  },//
                ),
                CardChangeServiceDetails(
                  iconName: 'chat-alert-outline',
                  title: 'Dispulta serviço',
                  onTap: () {
                    if(servico.idDisputa == ''){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DisputaServico(servicoViewModel: servico,)),
                      );
                    }
                    else{
                      ShowSnackBar(context: context).showErrorSnackBar(message: 'A disputa já foi iniciada.', color: DSColors.primary,);
                    }
                  },
                ),
              ],
            ),
          )
          : Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                CardChangeServiceDetails(
                  iconName: 'format-list-bulleted',
                  title: 'Adicionais do serviço',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdicionaisDoServicoScreen(servicoViewModel: servico,)),
                    );
                  },//
                ),
                CardChangeServiceDetails(
                  iconName: 'chat-alert-outline',
                  title: 'Dispulta serviço',
                  onTap: () {
                    if(servico.idDisputa == ''){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DisputaServico(servicoViewModel: servico,)),
                      );
                    }
                    else{
                      ShowSnackBar(context: context).showErrorSnackBar(message: 'A disputa foi iniciada', color: DSColors.primary,);
                    }
                  },
                ),
                CardChangeServiceDetails(
                  iconName: 'thumb-up-outline',
                  title: 'Ver Avaliação do serviço',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SeeRatingServico(servicoViewModel: servico,)),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            color: DSColors.cardColor,
            child: Center(
              child: allowGetLeads == true
                ? DSButtonLargePrimary(
                  text: 'Pegar esse serviço',
                  onPressed: () async {
                    await servicoProvider.confirmarPegarServico(context, servico);
                  },
                )
               : DSButtonLargePrimary(
                text: 'Voltar',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ),
        ],
      ),
    );
  }
}

class CardChangeServiceDetails extends StatelessWidget {
  final String iconName;
  final String title;
  final Function() onTap;
  const CardChangeServiceDetails({Key? key, required this.iconName, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: DSColors.cardColor,
      surfaceTintColor: DSColors.cardColor,
      elevation: 4,
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -4), // to compact

        contentPadding: EdgeInsetsGeometry.lerp(
          EdgeInsets.zero,
          const EdgeInsets.symmetric(horizontal: 12),
          0.5,
        ),
        leading: DSIconLargeSecondary(iconName: iconName,),
        title: DSTextTitleBoldSecondary(text: title),
        trailing: const DSIconSecondary(iconName: 'menu-right',),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
