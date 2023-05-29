import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/pesquisa_cidade_provider.dart';
import 'package:zeder/design_system/widgets/icons.dart';
import 'package:zeder/ui/features/select_city/select_city_screen.dart';
import '../../../../design_system/parameters/colors.dart';

class DropdownChooseCity extends StatefulWidget {
  const DropdownChooseCity({Key? key}) : super(key: key);

  @override
  State<DropdownChooseCity> createState() => _DropdownChooseCityState();
}

class _DropdownChooseCityState extends State<DropdownChooseCity> {
  @override
  Widget build(BuildContext context) {
    final PesquisaCidadeProvider _Provider = context.watch<PesquisaCidadeProvider>();
    String city = _Provider.get_user_chonsen_city();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectCityScreen()),
          );
        },
        splashColor: DSColors.primary,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DSIconPrimary(iconName: 'map-marker'),
            const SizedBox(width: 4,),
            SizedBox(child: Text(city, style: const TextStyle(color: DSColors.primary, fontSize: 15, decoration: TextDecoration.underline),)),
            const SizedBox(width: 4,),
            const DSIconPrimary(iconName: 'arrow-down'),
          ],
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class DropdownItem extends StatefulWidget {
  const DropdownItem({Key? key}) : super(key: key);

  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _dropdownFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(

                validator: (value) => value == null ? "Select a country" : null,
                dropdownColor: DSColors.primary.withOpacity(1),

                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: dropdownItems),
          ],
        ));
  }
}

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
  return menuItems;
}*/

/*TextButton(
        onPressed: () {
          //Navigator.pop(context);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as per your preference
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(DSColors.cardColor), // Set the background color to white

        ),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 30.0,
                color: DSColors.tertiary,
              ),
              SizedBox(width: 12,),
              Text('Pesquisar tipo de serviço', style: TextStyle(color: DSColors.tertiary),),
            ],
          ),
        ),
      ),*/
