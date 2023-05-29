import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/parameters/colors.dart';
import 'package:zeder/ui/features/select_service/list_service.dart';
import '../../../application/provider/pesquisa_cidade_provider.dart';
import '../../../application/provider/tipo_servico_provider.dart';
import '../home/views/dropdown_choose_city.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({Key? key}) : super(key: key);

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Transform.scale(
                scaleY: 1.2,
                child: SizedBox(
                  width: double.infinity, // Set the width to occupy the whole screen width
                  child: Image.asset(
                    'assets/cabecario.png',
                    fit: BoxFit.fitWidth, // Set the fit property to cover the whole space
                  ),
                ),
              ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Select a service', style: TextStyle(color: DSColors.cardColor, fontSize: 22, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only( left: 16, right: 16),
                    child:Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  CityControllter(cityController: passwordController, hint: "Type the service's name", iconData: Icons.search,),
                  const DropdownChooseCity(),
                ],
              ),
            ],
          ),
          const ListService(),
        ],
      ),
    );
  }
}


class CityControllter extends StatefulWidget {
  final TextEditingController cityController;
  final String hint;
  final IconData iconData;
  const CityControllter({Key? key, required this.cityController, required this.hint, required this.iconData}) : super(key: key);

  @override
  State<CityControllter> createState() => _CityControllterState();
}

class _CityControllterState extends State<CityControllter> {


  @override
  Widget build(BuildContext context) {
    final TipoServicoProvider _Provider = context.watch<TipoServicoProvider>();
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        height: 56,
        child: TextField(
          onChanged: (value) {
            setState(() {
              _Provider.applicarFiltroNalistaServico(value);

            });
          },
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 16,
            color: DSColors.tertiary,
          ),
          controller: widget.cityController,
          cursorColor: Colors.indigoAccent,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: DSColors.tertiary,
            ),

            prefixIcon: Icon(widget.iconData,color: DSColors.tertiary,size: 36,),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}

