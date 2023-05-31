import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/worker_provider.dart';
import '../../widgets/cities/cities.dart';
import '../../widgets/cities/cities_viewmodel.dart.dart';
import '../select_service/select_service_screen.dart';

class ListCities extends StatefulWidget {
  const ListCities({Key? key}) : super(key: key);

  @override
  State<ListCities> createState() => _ListCitiesState();
}

class _ListCitiesState extends State<ListCities> {
  @override
  Widget build(BuildContext context) {
    final WorkerProvider _Provider = context.watch<WorkerProvider>();
    List<CitiesViewModel> cities = _Provider.my_cities;

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
