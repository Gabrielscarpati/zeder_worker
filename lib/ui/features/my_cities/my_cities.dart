import 'package:flutter/material.dart';
import 'package:zeder/design_system/parameters/colors.dart';
import 'package:zeder/ui/features/my_cities/list_city.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

import '../../device_type.dart';

class MyCities extends StatefulWidget {
  const MyCities({Key? key}) : super(key: key);

  @override
  State<MyCities> createState() => _MyCitiesState();
}

class _MyCitiesState extends State<MyCities> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop
        ? padding = (screenWidth - 900) / 2
        : padding = 8;
    GetLocation getLocation = GetLocation();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 140,
                width: double
                    .infinity, // Set the width to occupy the whole screen width
                child: Image.asset(
                  'assets/cabecario.png',
                  fit: BoxFit
                      .cover, // Set the fit property to cover the whole space
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: padding, left: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getLocation.locationBR
                              ? 'Minhas cidades'
                              : 'My cities',
                          style: TextStyle(
                              color: DSColors.cardColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const ListCity(),
        ],
      ),
    );
  }
}

class CityControllter extends StatefulWidget {
  final TextEditingController cityController;
  final String hint;
  final IconData iconData;
  const CityControllter(
      {Key? key,
      required this.cityController,
      required this.hint,
      required this.iconData})
      : super(key: key);

  @override
  State<CityControllter> createState() => _CityControllterState();
}

class _CityControllterState extends State<CityControllter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        height: 56,
        child: TextField(
          onChanged: (value) {},
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 16,
            color: DSColors.tertiary,
          ),
          controller: widget.cityController,
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
            prefixIcon: Icon(
              widget.iconData,
              color: DSColors.tertiary,
              size: 36,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
