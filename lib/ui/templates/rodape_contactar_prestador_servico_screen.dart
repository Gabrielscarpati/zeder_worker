import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/footer/contactar_prestador_servico/contactar_prestador_servico_footer.dart';

import '../../domain/entities/servico_entity.dart';

class RodapeContactarPrestadorServicoScreen extends StatefulWidget {
  const RodapeContactarPrestadorServicoScreen({Key? key}) : super(key: key);

  @override
  State<RodapeContactarPrestadorServicoScreen> createState() => _RodapeContactarPrestadorServicoScreenState();
}

class _RodapeContactarPrestadorServicoScreenState extends State<RodapeContactarPrestadorServicoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contactar Prestador Servico"),
      ),
      bottomSheet: ContactarPrestadorServicoFooter(
        servico: ServicoEntity.test(),
        onPressedBotaoEnviarMensagem: () {},
      ),
    );
  }
}
