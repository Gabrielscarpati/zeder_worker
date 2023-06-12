import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/worker_provider.dart';
import 'package:zeder/ui/widgets/cities/cities.dart';
import 'package:zeder/ui/widgets/worker_services/worker_services_listtile.dart';
import '../../widgets/cities/cities_viewmodel.dart.dart';

class ListCity extends StatefulWidget {
  const ListCity({Key? key}) : super(key: key);

  @override
  State<ListCity> createState() => _ListCityState();
}

class _ListCityState extends State<ListCity> {
  @override
  Widget build(BuildContext context) {
    final WorkerProvider _Provider = context.watch<WorkerProvider>();
    List<CitiesViewModel> servicos = _Provider.my_cities;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8,),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: servicos.length,
          itemBuilder: (context, index) {
            return CitiesListTile(
              viewModel: servicos[index],
              onTap: () {

              },
            );
          },
        ),
      ),
    );
  }
}
