import 'package:flutter/material.dart';
import 'package:zeder/design_system/widgets/icons.dart';

import '../../../../design_system/parameters/colors.dart';
import '../../../../utils/flutter_get_Location.dart';
import '../../my_cities/my_cities.dart';

class ShowWorkerCities extends StatefulWidget {
  const ShowWorkerCities({Key? key}) : super(key: key);

  @override
  State<ShowWorkerCities> createState() => _ShowWorkerCitiesState();
}

class _ShowWorkerCitiesState extends State<ShowWorkerCities> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    GetLocation getLocation = GetLocation();

    return SizedBox(
      width: screenWidth < 814 ? MediaQuery.of(context).size.width * 0.7 : 814,
      height: 28,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCities()),
          );
        },
        splashColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                getLocation.locationBR ? "Minhas cidades" : "My cities",
                style: const TextStyle(
                    color: DSColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const DSIconPrimary(iconName: 'map-marker'),
          ],
        ),
      ),
    );
  }
}
