import 'package:flutter/material.dart';
import 'package:zeder/design_system/widgets/icons.dart';
import 'package:zeder/ui/features/select_city/select_city_screen.dart';
import '../../../../design_system/parameters/colors.dart';

class ShowWorkerCities extends StatefulWidget {
  const ShowWorkerCities({Key? key}) : super(key: key);

  @override
  State<ShowWorkerCities> createState() => _ShowWorkerCitiesState();
}

class _ShowWorkerCitiesState extends State<ShowWorkerCities> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 28,
      child: InkWell(

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectCityScreen()),
          );
        },
        splashColor: Colors.transparent,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(child: Text("My cities", style: TextStyle(color: DSColors.primary, fontSize: 24, fontWeight: FontWeight.bold),)),
            DSIconPrimary(iconName: 'map-marker'),
            ]
        ),
      ),
    );
  }
}