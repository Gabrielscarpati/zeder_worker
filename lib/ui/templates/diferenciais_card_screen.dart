import 'package:flutter/material.dart';

import '../../design_system/widgets/text.dart';
import '../widgets/diferenciais_card/diferenciais_card.dart';
import '../widgets/diferenciais_card/diferenciais_card_view_model.dart';
import '../widgets/servico/servico_listtile.dart';
import '../widgets/servico/servico_viewmodel.dart';

class DiferenciaisCardScreen extends StatelessWidget {
  const DiferenciaisCardScreen({Key? key}) : super(key: key);

  List<DiferenciaisCardViewModel> get viewModels => [
        const DiferenciaisCardViewModel(
          icone: 'lightning-bolt',
          title: 'Eletricista',
        ),
        const DiferenciaisCardViewModel(
          icone: 'lightning-bolt',
          title: 'Eletricista',
        ),
        const DiferenciaisCardViewModel(
          icone: 'lightning-bolt',
          title: 'Eletricista',
        ),const DiferenciaisCardViewModel(
          icone: 'lightning-bolt',
          title: 'Eletricista',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: DSTextTitleBoldSecondary(text: "Como funciona?"),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: viewModels.length,
                itemBuilder: (context, index) => DiferenciaisCardVertical(viewModel: viewModels[index], onTap: () => print('Tapped ${viewModels[index].title}')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: DSTextTitleBoldSecondary(text: "Serviços do app"),
            ),
          ],
        ),

    );
  }
}
