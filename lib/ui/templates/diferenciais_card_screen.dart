import 'package:flutter/material.dart';

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
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diferenciais cards"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: viewModels.length,
                itemBuilder: (context, index) => DiferenciaisCardVertical(viewModel: viewModels[index], onTap: () => print('Tapped ${viewModels[index].title}')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
