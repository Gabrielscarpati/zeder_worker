import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import '../../../../application/provider/pesquisa_cidade_provider.dart';
import '../../../widgets/cities/cities.dart';
import '../../../widgets/cities/cities_viewmodel.dart.dart';

class ListBuilderCities extends StatelessWidget {
  final double paddig;
  final List<CitiesViewModel> cities;
  const ListBuilderCities({Key? key, required this.cities, required this.paddig}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     PesquisaCidadeProvider Provider = context.watch<PesquisaCidadeProvider>();
     return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: paddig, left: paddig,),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return CitiesListTile(
              viewModel: cities[index],
              onTap: () {
                Provider.addSelectedCity(cities[index]);
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectServiceScreen()),
                );*/
              },
            );
          },
        ),
      ),
    );
  }
}


class ListBuilderSelectedCities extends StatelessWidget {

  const ListBuilderSelectedCities({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     PesquisaCidadeProvider Provider = context.watch<PesquisaCidadeProvider>();
     List<CitiesViewModel> selectedCities = Provider.selected_cities;
     return SizedBox(
       height: 30,
       width: double.infinity,
       child: Padding(
         padding: const EdgeInsets.only(right: 16, left: 16,),
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: selectedCities.length,
           itemBuilder: (context, index) {
             return Padding(
               padding: const EdgeInsets.only(right: 8,),
               child: InkWell(
                 child: Container(
                   width: 176,
                   height: 30,
                   decoration: BoxDecoration(
                     color: DSColors.scaffoldBackground,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       DSTextTitleBoldSecondary(text: selectedCities[index].city_name,),
                       const DSIconSmallSecondary(iconName: 'closeCircle',),
                     ],
                   ),
                 ),
                 onTap: () {
                   Provider.removeSelectedCity(selectedCities[index]);
                 },
               ),
             );
           },
         ),
       ),
     );
  }
}
