import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/client_provider.dart';
import 'package:zeder/ui/features/home/views/dropdown_choose_city.dart';
import 'package:zeder/ui/features/home/views/header.dart';
import 'package:zeder/ui/features/home/views/list_servicos.dart';
import '../../../design_system/parameters/colors.dart';
import '../../../design_system/widgets/search_bar_button.dart';
import '../../templates/diferenciais_card_screen.dart';
import '../../widgets/client/client_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 900,  //ver como pegar a altura da tela
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24,),
            Header(),
            SearchBarButton(),
            DiferenciaisCardScreen(),
            ListServicos(),
          ],
        ),
      ),
    );
  }
}

