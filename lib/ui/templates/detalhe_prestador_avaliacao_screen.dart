import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/detalhe_prestador/detalhe_prestador_avaliacao_viewmodel.dart';
import '../widgets/detalhe_prestador/detalhe_prestadro_avaliacao.dart';

class DetalhePrestadorAvaliacaoScreen extends StatefulWidget {
  const DetalhePrestadorAvaliacaoScreen({Key? key}) : super(key: key);

  @override
  _DetalhePrestadorAvaliacaoScreenState createState() => _DetalhePrestadorAvaliacaoScreenState();
}

class _DetalhePrestadorAvaliacaoScreenState extends State<DetalhePrestadorAvaliacaoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhe Prestador Avaliacao"),
      ),
      body: DetalhePrestadorAvaliacao(
        viewModel: DetalhePrestadorAvaliacaoViewmodel(
            profilePicture: 'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
            pretadorPrimeiroNome: 'Gabriel',
            prestadorTipoServico: 'Pedreiro',
            notaAvaliacao: 4.5,
            quantidadeAvailacao: 84,
          anosExperiencia: '5',

        ),
      ),
    );
  }
}
