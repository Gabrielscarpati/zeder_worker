import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/tipo_servico_provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/ui/features/SignUp/list_signup_city/standard_list_builder_sign_up.dart';
import 'package:zeder/ui/features/SignUp/list_signup_service/standard_list_builder_sign_up_service.dart';
import 'package:zeder/ui/features/home/home_screen.dart';
import '../../../../application/provider/pesquisa_cidade_provider.dart';
import '../../../device_type.dart';
import '../../../widgets/servico_do_app/servico_do_app_viewmodel.dart';

class ChooseServiceScreen extends StatefulWidget {
  const ChooseServiceScreen({Key? key}) : super(key: key);

  @override
  State<ChooseServiceScreen> createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop? padding = (screenWidth-900)/2 : padding = 8;

    final TipoServicoProvider _Provider = context.watch<TipoServicoProvider>();
    _Provider.getListaDeServicosViewModel();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 220,
                width: double.infinity, // Set the width to occupy the whole screen width
                child: Image.asset(
                  'assets/cabecario.png',
                  fit: BoxFit.cover, // Set the fit property to cover the whole space
                ),
              ),
               Padding(
                 padding: EdgeInsets.only(right: padding, left: padding),
                 child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                      height: 40,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('I provide these services', style: TextStyle(color: DSColors.cardColor, fontSize: 22, fontWeight: FontWeight.bold),),
                      ],
                    ),
                     Padding(
                      padding: EdgeInsets.only( left: 16, right: 16),
                      child:Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    CityControllter(hint: "Type the service's name", iconData: Icons.search,),
                    ListBuilderSelectedServices(),
                  ],
              ),
               ),
            ],
          ),
          ListBuilderServices(servicos: _Provider.list_servicos_screen, paddig: padding,),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DSButtonLargePrimary(
                onPressed: (){
                  if(_Provider.selected_servicos.isEmpty){
                    mostrarCompleteInfo(context);
                  }
                  else{
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                  }
                },
                text: "FINISH"
              )
            ],
          ),
        ),
      )
    );
  }
  Future mostrarCompleteInfo(context) => showDialog(
    context: context,
    builder: (context) => PopUpSelectOneCity(),
  );
}

class ListBuilderSelectedServices extends StatelessWidget {

  const ListBuilderSelectedServices({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TipoServicoProvider Provider = context.watch<TipoServicoProvider>();
    List<ServicoDoAppViewModel> selectedServices = Provider.selected_servicos;
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16,),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: selectedServices.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8,),
              child: InkWell(
                child: Container(
                  width: 162,
                  height: 30,
                  decoration: BoxDecoration(
                    color: DSColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DSTextTitleBoldSecondary(text: selectedServices[index].servico,),
                      const DSIconSmallSecondary(iconName: 'closeCircle',),
                    ],
                  ),
                ),
                onTap: () {
                  Provider.removeSelectedService(selectedServices[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
class PopUpSelectOneCity extends StatelessWidget {
  const PopUpSelectOneCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select at least one service!',
        textAlign: TextAlign.center ,
        style: TextStyle(color: DSColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 28),
      ),
      actions: [
        DSButtonLargePrimary(
            onPressed: () =>  Navigator.of(context).pop(),
            text: "Ok",
        )
      ],
    );
  }
}

class CityControllter extends StatefulWidget {
  final String hint;
  final IconData iconData;
  const CityControllter({Key? key, required this.hint, required this.iconData}) : super(key: key);

  @override
  State<CityControllter> createState() => _CityControllterState();
}

class _CityControllterState extends State<CityControllter> {


  @override
  Widget build(BuildContext context) {
    final PesquisaCidadeProvider _Provider = context.watch<PesquisaCidadeProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: SizedBox(
        height: 56,
        child: TextField(
          onChanged: (value) {
            setState(() {
              _Provider.applicarFiltroNalista(value);
            });
          },
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 16,
            color: DSColors.tertiary,
          ),
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

