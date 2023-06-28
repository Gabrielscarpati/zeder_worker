import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/application/provider/servico_provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/LoadingButton.dart';
import '../../../../../design_system/widgets/DsFutureBuilder.dart';
import '../../../../../design_system/widgets/text_card.dart';
import '../../../../../domain/entities/avaliacao_prestador_entity.dart';
import '../../../../../domain/entities/servico_entity.dart';

class SeeRatingServico extends StatefulWidget {
  final ServicoEntity servicoViewModel;
  const SeeRatingServico({Key? key, required this.servicoViewModel, }) : super(key: key);

  @override
  State<SeeRatingServico> createState() => _SeeRatingServicoState();
}

class _SeeRatingServicoState extends State<SeeRatingServico> {
  RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    ServicoProvider provider = context.read<ServicoProvider>();


    return Scaffold(
      appBar: AppBar(title: const Text('Ver avaliação do serviço', style: TextStyle(fontSize: 18),), backgroundColor: DSColors.tertiary,),
      body: DSFutureBuilder<AvaliacaoPrestadorEntity>(
        future: provider.getAvaliaCaoByServicoId(widget.servicoViewModel.id),
        builder: (context, AsyncSnapshot<AvaliacaoPrestadorEntity> snapshot) {
          AvaliacaoPrestadorEntity rating = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DSTextTitleBoldSecondary(text: 'Comentário'),
                  const SizedBox(height: 12,),
                  TextCard(
                    text: rating.comentario,
                  ),
                  const SizedBox(height: 24,),

                  const DSTextTitleBoldSecondary(text: 'Avaliação'),
                  const SizedBox(height: 12,),

                  SizedBox(
                    width: MediaQuery.of(context).size.width-24.0,
                    child: Card(
                      color: DSColors.cardColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DSTextTitleSecondary(text: 'Avalie o prestador de 1 a 5.'),
                            const SizedBox(height: 8,),

                            IgnorePointer(
                              child: RatingBar.builder(
                                itemBuilder: (BuildContext context, int index) => const Icon(
                                  Icons.star,
                                  color:Colors.amber ,
                                ),
                                itemCount: 5,
                                itemSize: 36.0,
                                minRating: 1,
                                initialRating: rating.nota.toDouble(),
                                updateOnDrag: true,
                                onRatingUpdate: (ratingValue) {
                                },
                              ),
                            ),

                            const SizedBox(height: 8,),
                             DSTextTitleSecondary(text: rating.nota.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                ]
            ),
          );
        },
        messageWhenEmpty: "Sem internet...",
      ),
     /* */
      bottomNavigationBar: Container(
          height: 70,
          color: DSColors.cardColor,
          child: Center(
            child:
                LoadingButton(
                  buttonText: 'Voltar',
                  goNextScreen: () async {
                    Navigator.pop(context);
                  },
                  controller: btnController,
                ),
          ),
      ),
    );
  }
}

