import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/design_system/parameters/colors.dart';
import 'package:zeder/ui/features/SignUp/list_signup_city/standard_list_builder_sign_up.dart';
import 'package:zeder/ui/features/home/home_screen.dart';
import '../../../../application/provider/pesquisa_cidade_provider.dart';
import '../../../device_type.dart';
import '../list_signup_service/choose_service_screen.dart';
import '../views/widgets/snackbars.dart';

class ChooseCityScreen extends StatefulWidget {
  const ChooseCityScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCityScreen> createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop? padding = (screenWidth-900)/2 : padding = 8;

    final PesquisaCidadeProvider _Provider = context.watch<PesquisaCidadeProvider>();
    _Provider.getListaDeCidadesViewModel();
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
                 child: const Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                      height: 40,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('I work in these cities', style: TextStyle(color: DSColors.cardColor, fontSize: 22, fontWeight: FontWeight.bold),),
                      ],
                    ),
                     Padding(
                      padding: EdgeInsets.only( left: 16, right: 16),
                      child:Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    CityControllter(hint: "Type the city's name", iconData: Icons.search,),
                    ListBuilderSelectedCities(),
                  ],
              ),
               ),
            ],
          ),
           ListBuilderCities(cities: _Provider.list_cities_screen, paddig: padding,),
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
                  if(_Provider.selected_cities.isEmpty){
                    mostrarCompleteInfo(context);
                  }
                  else{
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChooseServiceScreen()),
                  );
                  }
                },
                text: "CONTINUE"
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

class PopUpSelectOneCity extends StatelessWidget {
  const PopUpSelectOneCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select at least one city!',
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

