import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/home/home_screen.dart';
import 'package:zeder/ui/features/navigation_bar/navigation_bar.dart';
import 'package:zeder/ui/features/select_city/select_city_screen.dart';
import 'package:zeder/ui/templates/barra_botoes_media_screen.dart';
import 'package:zeder/ui/templates/botoes_screen.dart';
import 'package:zeder/ui/templates/diferenciais_card_screen.dart';
import 'package:zeder/ui/templates/card_avaliacao_screen.dart';
import 'package:zeder/ui/templates/card_prazo_execucao_servico_screen.dart';
import 'package:zeder/ui/templates/detalhe_prestador_avaliacao_screen.dart';
import 'package:zeder/ui/templates/orcamento_listtile_screen.dart';
import 'package:zeder/ui/templates/rodape_aceite_proposta_orcamento_screen.dart';
import 'package:zeder/ui/templates/rodape_confirmar_abertura_disputa_screen.dart';
import 'package:zeder/ui/templates/rodape_confirmar_execucao_servico_screen.dart';
import 'package:zeder/ui/templates/rodape_contactar_prestador_servico_screen.dart';
import 'package:zeder/ui/templates/rodape_liberar_pagamento_servico_screen.dart';
import 'package:zeder/ui/templates/rodape_orcamento_proposta_screen.dart';
import 'package:zeder/ui/templates/rodape_solicitar_orcamento_gratuito_screen.dart';
import 'package:zeder/ui/templates/rodape_solicitar_orcamento_screen.dart';
import 'package:zeder/ui/templates/servico_do_app_listtile_screen.dart';
import 'package:zeder/ui/templates/servico_listtile_screen.dart';
import 'package:zeder/ui/templates/type_comentario_screen.dart';
import 'application/provider/client_provider.dart';
import 'application/provider/home_screen_provider.dart';
import 'application/provider/pesquisa_cidade_provider.dart';
import 'application/provider/tipo_servico_repo.dart';
import 'ui/templates/rodape_confirmar_proposta_screen.dart';
import 'ui/templates/rodape_fazer_orcamento_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(  MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (context) => HomeScreenProvider() ,),
      ChangeNotifierProvider( create: (context) => PesquisaCidadeProvider() ,),
      ChangeNotifierProvider( create: (context) => TipoServicoProvider() ,),
      ChangeNotifierProvider( create: (context) => ClientProvider() ,),
    ],
    child: const MyApp(),
  ),);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DSTheme.theme(context),
      home: NavigationBarScreen(),
    );
  }
}





class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Home Screen"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
            ),

            ListTile(
              title: const Text("Botoes"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BotoesScreen()),
              ),
            ),
            ListTile(
              title: const Text("Botoes Media"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BarraBotoesMediaScreen()),
              ),
            ),
            ListTile(
              title: const Text("Orcamento ListTile"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrcamentoListTileScreen()),
              ),
            ),
            ListTile(
              title: const Text("Servico ListTile"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ServicoListTileScreen()),
              ),
            ),
            ListTile(
              title: const Text("Servico do App ListTile"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ServicoDoAppListTileScreen()),
              ),
            ),
            ListTile(
              title: const Text("Rodape Solicitar Orcamento"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeSolicitarOrcamentoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Rodape fazer orcamento"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeFazerOrcamentoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Rodape Solicitar Orcamento Gratuito"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeSolicitarOrcamentoGratuitoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Rodape Confirmar Proposta"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeConfirmarPropostaScreen()),
              ),
            ),
            ListTile(
              title: const Text("Rodape Orcamento Proposta"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeOrcamentoPropostaScreen()),
              ),
            ),
            ListTile(
              title: const Text("Rodape Aceite Proposta Orcamento"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeAceitePropostaOrcamentoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Liberar Pagamento Servico"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeLiberarPagamentoServicoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Contactar Presatador Servico"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeContactarPrestadorServicoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Confirmar execucao Servico"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeConfirmarExecucaoServicoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Confirmar Abertura Disputa"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RodapeConfirmarAberturaDisputaScreen()),
              ),
            ),
            ListTile(
              title: const Text("Type Comentario"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TypeComentarioScreen()),
              ),
            ),
            ListTile(
              title: const Text("Card Avaliacao"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CardAvaliacaoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Detalhe Prestador Avaliacao"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetalhePrestadorAvaliacaoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Card Prazo Execucao Servico"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CardPrazoExecucaoServicoScreen()),
              ),
            ),
            ListTile(
              title: const Text("Diferenciais Card"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DiferenciaisCardScreen()),
              ),
            ),            
          ],
        ),
      ),
    );
  }
}

/*
 prazo para a execucao do servico
 detalhes prestador
 card avaliacao
 tela avaliacao
 */
