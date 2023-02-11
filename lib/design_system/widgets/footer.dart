import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../parameters/colors.dart';

class Footer extends StatelessWidget {
  final Widget button;
  final Widget priceRange;
  final Widget description;

  const Footer({Key? key, required this.button, required this.priceRange, required this.description, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*


    terminar rodape



    * */
    return Card(
      //color: color,
      surfaceTintColor: DSColors.cardColor,
      elevation: 0.0,
      child:Container(
        child: Column(children: [
          Row(
            children: [
              Column(children: [
                priceRange,
                description
              ],)
          ],),
          button
        ],),
      )
    );
  }
}
