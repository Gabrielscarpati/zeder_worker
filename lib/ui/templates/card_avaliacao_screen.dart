import 'package:flutter/material.dart';
import '../widgets/avaliacao/card_avaliacao.dart';
import '../widgets/avaliacao/card_avaliacao_viewmodel.dart';

class CardAvaliacaoScreen extends StatefulWidget {
  const CardAvaliacaoScreen({Key? key}) : super(key: key);

  @override
  _CardAvaliacaoScreenState createState() => _CardAvaliacaoScreenState();
}

class _CardAvaliacaoScreenState extends State<CardAvaliacaoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Avaliacao"),
      ),
      body: CardAvaliacao(
        viewModel: CardAvaliacaoViewmodel(
          profilePicture: 'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
          userEmail: 'gabrielbrsc@gmail.com',
          notaAvaliacao: 4.3,
          textoAvaliacao: 'Muito bom o serviço prestado, recomendo!',
          dataAvailacao: '13/11/2022',
        ),
      ),
    );
  }
}
