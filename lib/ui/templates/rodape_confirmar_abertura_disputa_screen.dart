import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/footer/confirmar_abertura_disputa/confirmar_abertura_disputa_footer.dart';

import '../../domain/entities/servico_entity.dart';

class RodapeConfirmarAberturaDisputaScreen extends StatefulWidget {
  const RodapeConfirmarAberturaDisputaScreen({Key? key}) : super(key: key);

  @override
  State<RodapeConfirmarAberturaDisputaScreen> createState() => _RodapeConfirmarAberturaDisputaScreenState();
}

class _RodapeConfirmarAberturaDisputaScreenState extends State<RodapeConfirmarAberturaDisputaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmar Abertura Disputa"),
      ),
      bottomSheet: ConfirmarAberturaDisputaFooter(
        servico: ServicoEntity.test(),
        onPressedBotaoIniciarDisputa: () {},
      ),
    );
  }
}
