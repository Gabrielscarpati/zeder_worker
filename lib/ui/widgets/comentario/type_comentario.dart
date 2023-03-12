import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zeder/ui/widgets/comentario/type_comentario_viewmodel.dart';

import '../../../design_system/widgets/text.dart';
import '../../../design_system/widgets/text_card.dart';

class TypeComentario extends StatefulWidget {
  final TypeCommentViewmodel viewModel;
  const TypeComentario({Key?key, required this.viewModel,}) : super(key: key);

  @override
  _TypeComentarioState createState() => _TypeComentarioState();
}


class _TypeComentarioState extends State<TypeComentario> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DSTextTitleBoldSecondary(text: 'Comentário'),
                const SizedBox(height: 12,),
                TextCard(
                  hintText: 'Escreva seu comentário',
                  textEditingController: widget.viewModel.textEditingController,
                ),
                const SizedBox(height: 24,),

                const DSTextTitleBoldSecondary(text: 'Avaliação'),
                const SizedBox(height: 12,),

                SizedBox(
                  width: screenWidth-24.0,
                  child: Card(
                    color: Colors.white,
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
                          const DSTextTitleSecondary(text: 'Avalie o prestador de 1 a 5'),
                          const SizedBox(height: 8,),

                          RatingBar.builder(
                            itemBuilder: (BuildContext context, int index) => Icon(
                              Icons.star,
                              color: widget.viewModel.rating != null ? Colors.amber : Colors.grey,
                            ),
                            itemCount: 5,
                            itemSize: 40.0,
                            minRating: 1,
                            updateOnDrag: true,
                            onRatingUpdate: (rating) {
                              setState(() {
                                widget.viewModel.rating = rating.toInt();
                              });
                            },
                          ),
                          const SizedBox(height: 8,),

                          DSTextTitleSecondary(text: 'Sua nota foi ${widget.viewModel.rating}'),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
                /*ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),

                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Salvar avaliacao',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),*/
              ]
          ),
          // textFormField
      ),
    );
  }
}