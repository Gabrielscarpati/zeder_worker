import 'package:flutter/material.dart';
import '../../../design_system/widgets/icons.dart';
import '../../../design_system/widgets/text.dart';
import 'card_avaliacao_viewmodel.dart';

class CardAvaliacao extends StatelessWidget {
  final CardAvaliacaoViewmodel viewModel;
  const CardAvaliacao({Key?key, required this.viewModel,}) : super(key: key);

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 12),
          child: SizedBox(
            height: 110,
              // mudar isso

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        CircleAvatar(
                          backgroundImage: NetworkImage(viewModel.profilePicture),
                          radius: 20,
                        ),
                        DSTextTitleBoldSecondary(text: viewModel.userEmail),
                        const DSIconLargePrimary(iconName: 'seal',),
                        DSTextTitleBoldSecondary(text: viewModel.notaAvaliacao.toString()),
                      ],
                    ),
                    SizedBox(height: 8,),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 40,
                        maxHeight: 500,
                      ),
                      child: DSTextTitleSecondary(text: viewModel.textoAvaliacao),),
                    DSTextTitleSecondary(text: viewModel.dataAvailacao),
                  ]
              ),
              // textFormField
          ),
        ),
      ),
    );
  }
}