import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/provider/pesquisa_cidade_provider.dart';
import '../../widgets/cities/cities.dart';
import '../../widgets/cities/cities_viewmodel.dart.dart';
import '../select_service/list_service.dart';
import '../select_service/select_service_screen.dart';

class ListCities extends StatefulWidget {
  const ListCities({Key? key}) : super(key: key);

  @override
  State<ListCities> createState() => _ListCitiesState();
}

class _ListCitiesState extends State<ListCities> {
  @override
  Widget build(BuildContext context) {
    final PesquisaCidadeProvider _Provider = context.watch<PesquisaCidadeProvider>();
    List<CitiesViewModel> cities = _Provider.list_cities_screen;
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
                _Provider.set_user_chonsen_city(cities[index].city_name);
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
