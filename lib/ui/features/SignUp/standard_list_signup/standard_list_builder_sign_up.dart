import 'package:flutter/material.dart';
import '../../../widgets/cities/cities.dart';
import '../../../widgets/cities/cities_viewmodel.dart.dart';
import '../../select_service/select_service_screen.dart';

class ListBuilderCities extends StatelessWidget {
  final List<CitiesViewModel> cities;
  const ListBuilderCities({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8,),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return CitiesListTile(
              viewModel: cities[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectServiceScreen()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
