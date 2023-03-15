import 'package:flutter/material.dart';
import '../../../design_system/widgets/icons.dart';
import '../../../design_system/widgets/text.dart';
import '../detalhe_prestador/detalhe_prestador_avaliacao_viewmodel.dart';

class DetalhePrestadorAvaliacao extends StatelessWidget {
  final DetalhePrestadorAvaliacaoViewmodel viewModel;
  const DetalhePrestadorAvaliacao({Key?key, required this.viewModel,}) : super(key: key);

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 12),
        child: SizedBox(
          height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(viewModel.profilePicture),
                        radius: 32,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          DSTextTitleBoldSecondary(text: viewModel.pretadorPrimeiroNome),
                          const SizedBox(height: 4,),
                          DSTextTitleSecondary(text: viewModel.prestadorTipoServico.toString()),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const DSIconLargePrimary(iconName: 'seal',),
                                  const SizedBox(width: 8,),
                                  Column(children: [
                                      DSTextTitleBoldSecondary(text: viewModel.notaAvaliacao.toString()),
                                       DSTextTitleSecondary(text: '(${viewModel.quantidadeAvailacao.toString()})'),
                                   ],
                                ),
                              ],
                          ),

                          GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                DSTextSubtitleBoldPrimaryUnderline(text: "ver avaliações"),
                              ],
                            ),
                            onTap: () {
                              print("ver avaliações");
                              /*TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),*/
                            },
                          ),
                    ],
                  ),
                ]
           ),
                const SizedBox(height: 4,),
                DSTextTitleSecondary(text: 'Tempo de Experiência: ${viewModel.anosExperiencia} anos'),

              ],
            ),
        ),
      ),
    );
  }
}